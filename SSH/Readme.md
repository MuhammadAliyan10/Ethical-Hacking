# Network Configuration for Virtual Machine (Kali on macOS)

This guide provides steps to configure networking between Kali Linux running in a virtual machine and the macOS host. It includes steps to set up **NAT** and **Bridged Adapter** network modes, and troubleshooting commands for diagnosing and resolving network issues.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Step 1: Check Host's IP Address](#step-1-check-hosts-ip-address)
3. [Step 2: Check Virtual Machine's IP Address](#step-2-check-virtual-machines-ip-address)
4. [Step 3: Configure Network Adapter Mode](#step-3-configure-network-adapter-mode)
   - [NAT](#nat)
   - [Bridged Adapter](#bridged-adapter)
5. [Step 4: Troubleshoot Networking Issues](#step-4-troubleshoot-networking-issues)
6. [Step 5: Verify Connection](#step-5-verify-connection)

## Prerequisites

- A running **VirtualBox** or **VMware** instance with **Kali Linux** installed.
- Basic knowledge of networking and terminal commands.

## Step 1: Check Host's IP Address (macOS)

Before configuring your virtual machine, ensure that the macOS host machine has a working IP address.

1. Open Terminal on macOS.
2. Run the following command to check the IP address:

   ```bash
   ifconfig
   ```

3. Look for the `inet` field under the active network interface (usually `en0` or `en1`). For example, the output might look like this:

   ```bash
   en0: flags=8863<UP,BROADCAST,SMART,RUNNING,MEDIAIPv4,PRIVACY> mtu 1500
       inet 192.168.1.10 netmask 0xffffff00 broadcast 192.168.1.255
   ```

   Note the IP address (`192.168.1.10`).

## Step 2: Check Virtual Machine's IP Address (Kali Linux)

In Kali Linux, check the IP address assigned to the virtual machine by running:

```bash
 ifconfig
```

Note the IP address (`10.0.2.15`).

## Step 3: Configure Network Adapter Mode

### NAT (Network Address Translation)

In **NAT** mode, the VM shares the host machine's network connection. To set up NAT, follow these steps:

1. Open your virtual machine's settings (in VirtualBox, for example).
2. Go to **Network** and select **Adapter 1**.
3. Change the **Attached to** option to **NAT**.
4. Save the settings and restart the VM.

In this mode, the VM will be isolated from the local network but can access the internet through the host.

### Bridged Adapter

In **Bridged Adapter** mode, the VM gets its own IP address from the local network, and it behaves like a separate machine on the network.

To configure this:

1. Open your virtual machine's settings (in VirtualBox, for example).
2. Go to **Network** and select **Adapter 1**.
3. Change the **Attached to** option to **Bridged Adapter**.
4. Save the settings and restart the VM.

The VM will now get an IP address from your router and can communicate with other devices on the local network.

## Step 4: Troubleshoot Networking Issues

### 1. Check Routing Table on macOS

Run the following command on macOS to check the routing table and ensure that the default gateway is correctly configured:

```bash
netstat -nr
```

### 5. Test VM-to-Host Connectivity (Ping macOS from Kali)

On Kali, ping the host's IP address (e.g., `192.168.1.10`):
