import sys
import base64
import BaseHTTPServer
from SimpleHTTPServer import SimpleHTTPRequestHandler

def test(key):
    class AuthHandler(SimpleHTTPRequestHandler):
        def do_HEAD(self):
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
    
        def do_AUTHHEAD(self):
            self.send_response(401)
            self.send_header('WWW-Authenticate', 'Basic realm="Test"')
            self.send_header('Content-type', 'text/html')
            self.end_headers()
    
        def do_POST(self):
            if self.check_auth():
                length = int(self.headers.getheader('Content-length'))
                print 'Received', self.headers.getheader('Content-type'), 'of length', length
                print 'Contents:'
                print self.rfile.read(length)
                self.send_response(200)
                self.end_headers()

        def do_GET(self):
            if self.check_auth():
                SimpleHTTPRequestHandler.do_GET(self)
    
        def check_auth(self):
            # Check for authentication
            if self.headers.getheader('Authorization') == None:
                self.do_AUTHHEAD()
                self.wfile.write('no auth header received')
            elif self.headers.getheader('Authorization') == 'Basic ' + key:
                return True
            else:
                self.do_AUTHHEAD()
                self.wfile.write(self.headers.getheader('Authorization'))
                self.wfile.write('not authenticated')
            return False

    BaseHTTPServer.test(AuthHandler, BaseHTTPServer.HTTPServer)

if __name__ == '__main__':
    if len(sys.argv)<3:
        print 'usage SimpleAuthServer.py [port] [username:password]'
    else:
        test(base64.b64encode(sys.argv[2])) 
