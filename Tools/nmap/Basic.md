# namp

_Nmap ("Network Mapper") is a free, open-source tool for network discovery and security auditing, widely used for scanning networks to identify active hosts, open ports, and running services. It is essential for network inventory, managing service upgrades, and monitoring host uptime, operating on Windows, Linux, and macOS._

## How to scan step by step

### Step 1: Host Discovery (Is the target breathing?)

Before making noise by scanning ports, you verify the target is online and resolve its IP address.

**Type this command:**
`nmap -sn scanme.nmap.org`

**The Output You Will Get:**

```text
Starting Nmap 7.93 ( https://nmap.org ) at 2026-02-21 15:04 PKT
Nmap scan report for scanme.nmap.org (45.33.32.156)
Host is up (0.16s latency).
Other addresses for scanme.nmap.org (not scanned): 2600:3c01::f03c:91ff:fe18:bb2f
Nmap done: 1 IP address (1 host up) scanned in 0.45 seconds

```

**What You Must Understand:**

1. **`45.33.32.156`**: This is the most critical piece of data. DNS resolved the URL to its actual IPv4 address. You now have the physical target.
2. **`Host is up`**: The server responded to your ping. It is alive.

- _Strategic Note:_ If the output said `Host seems down. If it is really up, but blocking our ping probes, try -Pn`, that means the target has a firewall dropping ICMP (ping) requests to stay hidden. You would then have to use `-Pn` to force the scan anyway.

---

### Step 2: The Stealth Scan (Where are the doors?)

Now you find out which ports are open using a SYN "Half-Open" scan. We will use `-T4` to speed it up.

**Type this command:**
`sudo nmap -sS -T4 scanme.nmap.org`
_(Note: `sudo` is required because you are manipulating raw TCP packets)._

**The Output You Will Get:**

```text
Starting Nmap 7.93 ( https://nmap.org ) at 2026-02-21 15:05 PKT
Nmap scan report for scanme.nmap.org (45.33.32.156)
Host is up (0.15s latency).
Not shown: 996 closed tcp ports (reset)
PORT      STATE    SERVICE
22/tcp    open     ssh
80/tcp    open     http
9929/tcp  open     nping-echo
31337/tcp open     Elite

Nmap done: 1 IP address (1 host up) scanned in 1.28 seconds

```

**What You Must Understand:**

1. **`Not shown: 996 closed tcp ports (reset)`**: Nmap scanned the top 1,000 most common ports. 996 of them sent back a `RST` (Reset) packet, meaning the port is closed and no software is listening.
2. **`STATE: open`**: The target replied with a `SYN/ACK`. You have confirmed four entry points.

- _Strategic Note:_ If the state said `filtered`, it means a firewall silently swallowed your packet and sent nothing back.

3. **`SERVICE`**: Look at `22` and `80`. Nmap is _guessing_ this is SSH and HTTP because those are the default ports for those services. It does not actually know yet.

---

### Step 3: Service Enumeration (What is behind the doors?)

Knowing port 80 is open is useless. You cannot hack a port; you hack the _software_ running on the port. You must force the server to reveal its exact software versions.

**Type this command:**
`sudo nmap -sV -p 22,80 scanme.nmap.org`
_(Note: We use `-p 22,80` to only interrogate the ports we know are open, saving time)._

**The Output You Will Get:**

```text
Starting Nmap 7.93 ( https://nmap.org )
Nmap scan report for scanme.nmap.org (45.33.32.156)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 6.6.1p1 Ubuntu 2ubuntu2.3 (Ubuntu Linux; protocol 2.0)
80/tcp open  http    Apache httpd 2.4.7 ((Ubuntu))
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

```

**What You Must Understand:**

1. **`VERSION`**: This is the objective. You are no longer looking at "HTTP". You are looking at exactly `Apache httpd 2.4.7`.
2. **`Service Info`**: The server leaked its underlying operating system (`Ubuntu Linux`).

### The Next Tactical Step

This is where the scan ends and the attack begins. You take `Apache httpd 2.4.7` or `OpenSSH 6.6.1p1` and you cross-reference them against exploit databases (like Exploit-DB or the National Vulnerability Database) to see if those specific versions have known, unpatched vulnerabilities.
