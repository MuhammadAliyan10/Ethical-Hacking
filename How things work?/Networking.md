## 1. The Network Layer: Packets and Metadata

The internet does not send files; it sends packets. When you request a webpage or send a message, your data is chopped into thousands of tiny data blocks.

Every packet has two parts: the Payload (the actual data) and the Header (the routing instructions).

- **The Illusion of HTTPS:** When you use HTTPS or a standard VPN, you are encrypting the Payload. The Header cannot be encrypted, because the routers between you and your destination need to read it to know where to send the packet.
- **The Reality:** The Header contains your Source IP, Destination IP, packet size, and sequence number. Every single router, ISP, and backbone provider your packet bounces through logs this metadata. They don't need to read your message to know exactly who you are talking to, how much data you sent, and when you sent it.

## 2. The Protocol Layer: DNS and SNI Leaks

This is how your ISP and government firewalls track you, even if you use encryption.

- **The DNS Flaw:** Computers do not understand website names (like target.com); they only understand IP addresses. When you type a URL, your machine sends a Domain Name System (DNS) query to ask for the IP. By default, DNS queries are sent in plaintext over UDP Port 53. Your ISP reads and logs every single website you ask to visit before you even establish a connection.

- **The SNI Leak (Server Name Indication):** Let's say you fix the DNS issue by encrypting your DNS requests. You are still leaking data during the TLS Handshake (the process of establishing an HTTPS connection). Because many websites are hosted on a single server IP (like AWS or Cloudflare), your browser must tell the server which specific website's security certificate it needs. It does this by sending the Server Name Indication (SNI) in plaintext before the encryption starts. The surveillance dragnet logs the SNI.

## 3. The Application Layer: The Math of Fingerprinting

If you mask your IP and fix your network leaks, the tracking moves to the browser. This relies on `Hashing`.

When you visit a site, JavaScript queries your browser's API for dozens of parameters: your screen resolution, OS version, exact timezone, installed fonts, and hardware concurrency (number of CPU cores).

1. The tracking script collects this array of variables: `[1920x1080, Win10, UTC-5, 8-cores, Arial/Times/Consolas...]`
2. It runs this data through a cryptographic hash function (like SHA-256).
3. The result is a fixed-length alphanumeric string: e4d909c290d0fb1ca068ffaddf22cbd0

This hash is your permanent digital fingerprint. Even if your IP changes from New York to Tokyo, if the tracking company sees that exact hash connect to their servers, they know it is the exact same physical machine.

You are tracked because the architecture of the internet was built for reliable delivery, not privacy. Privacy has to be engineered backward over fundamentally insecure protocols.
This is where 90% of hacking actually happens. This is the software interacting with the network. If you want to exploit servers, you must know how these communicate:

- **HTTP/HTTPS (Ports 80/443):** Web traffic. Exploited via SQL Injection, Cross-Site Scripting (XSS), and directory traversal.

- **SSH (Port 22):** Secure Shell. Used by admins for remote server control. Exploited via brute-forcing or stolen RSA keys.

- **SMB (Port 445):** Server Message Block. Windows file sharing.

  - **The Exploit:** SMB vulnerabilities (like EternalBlue) are what military cyber commands and ransomware gangs use to spread laterally across entire corporate networks in seconds.

## 4: Data Link Layer (The Local Battlefield)

This layer handles physical addressing on a local network (like your home Wi-Fi or a corporate office).

- **MAC Addresses:** The hardcoded physical address of your network card.

- **ARP (Address Resolution Protocol):** Translates IP addresses to MAC addresses.

  - **The Exploit:** ARP has zero built-in authentication. If you are on the same Wi-Fi as a target, you can broadcast fake ARP packets claiming your MAC address belongs to the router. The target's computer will blindly believe you and send all its traffic to you instead of the router. This is ARP Spoofing / Man-in-the-Middle (MitM).

## 5. Network Layer (The Global Map)

This layer handles routing data across the global internet.

- **IP (Internet Protocol - IPv4 & IPv6):** The logical address. You already know this tracks you.
- **ICMP (Internet Control Message Protocol):** Used for diagnostics (like the ping command).

  - **The Exploit:** Because firewalls often allow ICMP traffic to pass through, hackers use it for "Ping Sweeps" to map live targets on a network, or they embed malicious data inside ICMP packets to bypass firewalls (ICMP Tunneling).

- **BGP (Border Gateway Protocol):** The protocol that massive internet backbones use to route traffic between continents.
  - The Exploit: BGP Hijacking. If an attacker compromises a major telecom router, they can broadcast fake BGP routes, forcing entire countries' web traffic to detour through their servers before reaching its destination.

## 6. Transport Layer (The Delivery Mechanism)

This layer handles how connections are established and maintained.

- **TCP (Transmission Control Protocol):** "Stateful." It requires a handshake and guarantees delivery. Used for web browsing (HTTP), SSH, and file transfers.

  - The Exploit: Port scanning (Nmap). You map a server by analyzing how it responds to malformed TCP packets.

- **UDP (User Datagram Protocol):** "Stateless." It just fires data blindly without checking if it arrived. Used for DNS, video streaming, and VoIP.

  - The Exploit: Because UDP doesn't verify the sender, you can easily spoof your IP. Attackers send massive UDP requests to servers using a target's spoofed IP, causing the servers to flood the target with responses. This is a UDP Amplification DDoS Attack.

## Network Architecture: NAT and Proxies

ou must understand how private networks talk to the public internet.

- **NAT (Network Address Translation):** Your home router has one public IP, but your laptop, phone, and TV all have private IPs (e.g., 192.168.1.x). NAT translates between them.

  - The Exploit: Because NAT blocks incoming connections from the outside, you cannot just hack a laptop behind a router directly. You must trick the laptop into establishing an outbound connection to your malicious server. This is called a Reverse Shell.
