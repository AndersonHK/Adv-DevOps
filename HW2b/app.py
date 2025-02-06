from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess, sys

class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        # run df -h and put in output
        #dfout = subprocess.check_output(["df", "-h"])
        #self.wfile.write(dfout)
        
        free = subprocess.check_output(["free", "-h"])
        self.wfile.write(free)
        
        ps = subprocess.check_output(["ps", "aux"])
        self.wfile.write(ps)
        
        lsblk = subprocess.check_output(["cat", "/proc/partitions"])
        self.wfile.write(lsblk)
        
        self.wfile.write("**********\n".encode())
        self.wfile.write(b'''
          ##         .
    ## ## ##        ==
 ## ## ## ## ##    ===
/"""""""""""""""""\___/ ===
{                       /  ===-
\______ O           __/
 \    \         __/
  \____\_______/


Hello from Docker!
''')

def run():
    print('Starting server...')
    server_address = ('', 8080)
    httpd = HTTPServer(server_address, MyHandler)
    print('Server started!')
    httpd.serve_forever()

if __name__ == '__main__':
    run()
