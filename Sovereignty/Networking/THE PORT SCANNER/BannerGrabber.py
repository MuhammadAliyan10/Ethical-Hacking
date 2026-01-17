import socket


def grab_banner(ip, port):
    try:
        s = socket.socket()
        s.settimeout(2)

        print(f"Connecting to {ip}:{port}")
        s.connect((ip, port))

        s.send(b"GET / HTTP/1.1\r\n\r\n")

        banner = s.recv(1024)
        print("-" * 50)
        print(f"BANNER GRABBED:\n{banner.decode().strip()}")
        print("-" * 50)

        s.close()

    except Exception as e:
        print(f"Could not grab banner from {ip}:{port} - {e}")


target_ip = "45.33.32.156"  # We learned this IP from your last scan
target_port = 80

grab_banner(target_ip, target_port)
