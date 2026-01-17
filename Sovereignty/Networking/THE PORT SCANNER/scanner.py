import socket
from datetime import datetime
import sys


targetDomain = "scanme.nmap.org"


try:
    targetIp = socket.gethostbyname(targetDomain)
except socket.gaierror:
    print("Hostname could not be resolved. Exiting")
    sys.exit()


print("-" * 50)
print(f"TARGET ACQUIRED: {targetDomain}")
print(f"IP ADDRESS: {targetIp}")
print(f"SCAN STARTED: {datetime.now()}")
print("-" * 50)


try:
    for port in range(20, 100):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        socket.setdefaulttimeout(0.5)

        result = s.connect_ex((targetIp, port))

        if result == 0:
            print(f"[!] PORT {port} IS OPEN")

        s.close()

except KeyboardInterrupt:
    print("\n[!] Aborting Scan.")
    sys.exit()


print("-" * 50)
print("SCAN COMPLETE")
