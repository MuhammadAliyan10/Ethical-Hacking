## Vulnerability

This is not just a "glitch." It is a specific mathematical or logical flaw in how an application processes data, manages memory, or authenticates users.

## RCE (Remote Code Execution)

The holy grail of bug bounties. This means you found a way to trick the target server into running your own malicious code. If you get RCE, you effectively own the machine. Bounties for this run into the tens of thousands of dollars.

## SSRF (Server-Side Request Forgery)

This is when you manipulate a web application into making HTTP requests to arbitrary domains of your choosing. You essentially use the target server as a proxy to attack internal networks that are hidden behind a firewall.

## IDOR (Insecure Direct Object Reference)

A logic flaw where the application doesn't properly check if you have permission to view a file. For example, changing a URL from user_id=101 to user_id=102 and suddenly seeing someone else's private dashboard.

## Smart Contract Logic Flaws

In the Web3 and decentralized finance space, a logic flaw doesn't just leak data; it drains the entire bank. A reentrancy attack or an integer underflow in a blockchain contract can instantly steal millions.

## LotL (Living off the Land)

This means using the server's own built-in, pre-installed administration tools to map out the system. If you use the native tools, the system's defenses just think you are a normal system administrator doing your job

## File Integrity Monitoring (FIM)

File Integrity Monitoring (FIM) is a critical security process that tracks, audits, and alerts on unauthorized modifications to files, configurations, and registry keys by comparing current data against a known, trusted baseline

## Reverse Shell

A reverse shell is a shell that is running on one computer but accepts requests and relays the responses to another computer
