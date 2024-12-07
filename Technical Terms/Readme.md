# Glossary of Technical Terms

This document provides definitions for technical terms and commands commonly used in Computer Science, Networking, Operating Systems, and related fields. The terms are organized alphabetically for easy reference.

---

## Networking and IP-Related Terms

| **Term**        | **Explanation**                                                                                                     |
| --------------- | ------------------------------------------------------------------------------------------------------------------- |
| **ARP**         | Address Resolution Protocol; resolves IP addresses to MAC addresses on a local network.                             |
| **DNS**         | Domain Name System; translates domain names (like `www.example.com`) into IP addresses.                             |
| **Gateway**     | A node that connects two different networks, often acting as an entry/exit point.                                   |
| **IP Address**  | A unique string of numbers identifying a device on a network.                                                       |
| **IPv4**        | Internet Protocol version 4; uses a 32-bit address space, allowing ~4.3 billion unique addresses.                   |
| **IPv6**        | Internet Protocol version 6; uses a 128-bit address space, allowing for a virtually unlimited number of addresses.  |
| **Ping**        | A command-line tool used to test connectivity between devices by sending ICMP Echo Request packets.                 |
| **Port**        | A logical endpoint for communication, used to distinguish services on the same IP address (e.g., port 80 for HTTP). |
| **Protocol**    | A set of rules governing data communication between devices.                                                        |
| **Subnet Mask** | A 32-bit number used to divide an IP address into network and host portions.                                        |
| **Traceroute**  | A command-line tool that maps the route data takes to reach a destination by listing each hop on the path.          |
| **VPN**         | Virtual Private Network; encrypts internet traffic to provide privacy and secure access to remote networks.         |

---

## Networking Commands

| **Command**              | **Description**                                                                            |
| ------------------------ | ------------------------------------------------------------------------------------------ |
| `ping`                   | Tests network connectivity by sending ICMP Echo Request packets to a target IP or domain.  |
| `tracert` / `traceroute` | Displays the route packets take to reach a destination, including intermediate hops.       |
| `netstat`                | Displays active network connections, listening ports, and protocol statistics.             |
| `ipconfig` / `ifconfig`  | Displays and manages IP configuration on Windows (`ipconfig`) or Linux/macOS (`ifconfig`). |
| `nslookup`               | Queries DNS records for a given domain name.                                               |
| `curl`                   | Transfers data from or to a server using protocols like HTTP, FTP, or SFTP.                |
| `wget`                   | A command-line tool for downloading files from the web.                                    |

---

## General Terms in Computer Science

| **Term**          | **Explanation**                                                                                                       |
| ----------------- | --------------------------------------------------------------------------------------------------------------------- |
| **Algorithm**     | A step-by-step procedure or formula for solving a problem or completing a task.                                       |
| **API**           | Application Programming Interface; a set of rules that allows different software applications to communicate.         |
| **Cache**         | A temporary storage area used to speed up access to frequently accessed data.                                         |
| **Cookie**        | A small file stored on a user's computer by a web browser to remember information about the user.                     |
| **Cryptography**  | The practice of securing communication through encoding and decoding information.                                     |
| **Firewall**      | A network security system that monitors and controls incoming and outgoing traffic based on security rules.           |
| **Hashing**       | Converting data into a fixed-size string or number, often for security purposes.                                      |
| **Load Balancer** | A device or software that distributes network or application traffic across multiple servers.                         |
| **Proxy Server**  | A server that acts as an intermediary between a client and the internet.                                              |
| **Reverse Proxy** | A server that retrieves resources on behalf of a client from one or more servers and then returns them to the client. |
| **SSL/TLS**       | Secure Sockets Layer / Transport Layer Security; protocols for encrypting communication over the internet.            |
| **VPN**           | Virtual Private Network; encrypts internet traffic to provide privacy and secure access to remote networks.           |

---

## OS and System-Related Terms

| **Term**           | **Explanation**                                                                                        |
| ------------------ | ------------------------------------------------------------------------------------------------------ |
| **BIOS**           | Basic Input/Output System; firmware used to perform hardware initialization during booting.            |
| **Kernel**         | The core of an operating system, managing system resources and hardware-software interactions.         |
| **Virtualization** | The creation of a virtual version of something, such as a server, storage device, or network resource. |
| **Process**        | A running instance of a program that includes its code, data, and state.                               |
| **Scheduler**      | Part of an OS responsible for managing process execution.                                              |
| **Thread**         | A smaller unit of a process that can run concurrently with other threads within the same process.      |
| **Daemon**         | A background process running on Unix/Linux systems, often providing system services.                   |

---

## Security Terms

| **Term**       | **Explanation**                                                                                                    |
| -------------- | ------------------------------------------------------------------------------------------------------------------ |
| **Encryption** | The process of converting data into an unreadable format to prevent unauthorized access.                           |
| **Decryption** | The process of converting encrypted data back into its original form.                                              |
| **Token**      | A digital representation of authentication, often used in API security.                                            |
| **SSH**        | Secure Shell; a protocol for secure remote login and other secure network services.                                |
| **Zero Trust** | A security model requiring strict identity verification for every person or device attempting to access resources. |

---
