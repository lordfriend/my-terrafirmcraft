import subprocess
import signal
from twisted.application.service import Service, Application
from twisted.internet import threads

class DaemonService(Service):

    def __init__(self):
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
            'forge-1.12.2-14.23.4.2760-universal.jar',
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
        self.p.stdin.write('stop\r\n')
        self.p.stdin.flush()
        self.p.wait()

    def startService(self):
        self.start_daemon()

    def stopService(self):
        return threads.deferToThread(self.stop_daemon)


application = Application('mc server daemon')

daemon = DaemonService()

daemon.setServiceParent(application)


# def stop_handler(signum, frame):
#     daemon.stop_daemon()
#
# signal.signal(signal.SIGTERM, stop_handler)
# signal.signal(signal.SIGINT, stop_handler)
#
# daemon.start_daemon()

# signal.pause()
