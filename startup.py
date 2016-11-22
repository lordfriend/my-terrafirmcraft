import subprocess
import signal
import threading

class DaemonThread:

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
            'forge-1.7.10-10.13.4.1558-1.7.10-universal.jar',
            'nogui',
            '-o',
            'false'
        ]

    def preexec_func(self):
        '''
        prevent minecraft process receive SIGINT signal
        '''
        signal.signal(signal.SIGINT, signal.SIG_IGN)

    def _run(self):
        self.p = subprocess.Popen(self.args, stdin=subprocess.PIPE, stderr=subprocess.STDOUT, preexec_fn=self.preexec_func)
        while True:
            # print(self.p.stdout.readline())
            # self.p.stdout.flush()
            self.p.poll()
            if self.p.returncode is not None:
                print 'thread ended'
                print self.p.returncode
                break

    def start_daemon(self):
        thread = threading.Thread(target=self._run)
        thread.start()

    def stop_daemon(self):
        self.p.stdin.write('stop\r\n')
        self.p.stdin.flush()
        self.p.wait()


daemon = DaemonThread()


def stop_handler(signum, frame):
    daemon.stop_daemon()

signal.signal(signal.SIGTERM, stop_handler)
signal.signal(signal.SIGINT, stop_handler)

daemon.start_daemon()

signal.pause()

print 'program ended'