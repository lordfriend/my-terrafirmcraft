import subprocess
import signal
from twisted.web import server, resource
from twisted.application.service import Service, Application
from twisted.application import internet
from twisted.internet import threads

try:
    from configparser import ConfigParser
except:
    from ConfigParser import ConfigParser


class DaemonService(Service):

    def __init__(self):
        # web rpc interface service
        self.rpc_service = None
        self.p = None
        self.args = [
            'java',
            '-Xms4G',
            '-Xmx8G',
            '-XX:NewSize=2G',
            '-XX:MaxNewSize=4G',
            '-XX:SurvivorRatio=2',
            '-XX:+DisableExplicitGC',
            '-d64',
            '-XX:+UseConcMarkSweepGC',
            '-XX:+AggressiveOpts',
            '-jar',
            'forge-1.12.2-14.23.5.2768-universal.jar',
            'nogui',
            '-o',
            'false',
            '-Dfml.queryResult=confirm'
        ]

    def preexec_func(self):
        '''
        prevent minecraft process receive SIGINT signal
        '''
        signal.signal(signal.SIGINT, signal.SIG_IGN)

    def start_daemon(self):
        self.p = subprocess.Popen(self.args, stdin=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=self.preexec_func)

    def stop_daemon(self):
        self.p.stdin.write('stop\r\n'.encode('utf-8'))
        self.p.stdin.flush()
        self.p.wait()

    def startService(self):
        Service.startService(self)
        self.start_daemon()
        self.rpc_service.startService()

    def stopService(self):
        Service.stopService(self)
        self.rpc_service.stopService()
        return threads.deferToThread(self.stop_daemon)

    def addService(self, service):
        self.rpc_service = service
        if self.running:
            service.privilegedStartService()
            service.startService()

    def removeService(self, service):
        self.rpc_service = None
        if self.running:
            return service.stopService()
        else:
            return None

    def getServiceNamed(self, name):
        return self.rpc_service

    def privilegedStartService(self):
        Service.privilegedStartService(self)
        self.rpc_service.privilegedStartService()

    def __iter__(self):
        return [self.rpc_service]


class RPCInterface(resource.Resource):
    isLeaf = True

    def __init__(self, daemon_service):
        super().__init__()
        self.daemon = daemon_service

    def render_POST(self, request):
        rpc_method = request.path[1:].decode('ascii')
        content = request.content.read().decode('utf-8')
        print(rpc_method)
        if rpc_method == 'command':
            self.daemon.p.stdin.write('{0}\r\n'.format(content).encode('utf-8'))
            self.daemon.p.stdin.flush()
        else:
            print('no such a method ({0}) found'.format(rpc_method, ))
        return ''


def setup_server(daemon_service):
    """create a http server service"""
    config = ConfigParser()
    config.read('./config/config')
    server_port = 8080
    if 'rpc' in config:
        server_port = int(config['rpc']['server_port'])
    print('rpc server start at {0}'.format(str(server_port),))
    # child_service.startService()
    site = server.Site(RPCInterface(daemon_service))
    rpc_service = internet.TCPServer(server_port, site)
    rpc_service.setServiceParent(daemon_service)


application = Application('mc server daemon')

daemon = DaemonService()

setup_server(daemon)

daemon.setServiceParent(application)


# def stop_handler(signum, frame):
#     daemon.stop_daemon()
#
# signal.signal(signal.SIGTERM, stop_handler)
# signal.signal(signal.SIGINT, stop_handler)
#
# daemon.start_daemon()

# signal.pause()
