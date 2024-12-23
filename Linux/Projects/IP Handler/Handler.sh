#! /bin/bash

# Validate IP
validateIp() {
    read -p "Enter an IP address to validate: " ip
    if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
        IFS='.' read -r -a octets <<<"$ip"
        for octet in "${octets[@]}"; do
            if ((octet < 0 || octet > 255)); then
                echo "Invalid IP address."
                return
            fi
        done
        echo "Valid IP address."
    else
        echo "Invalid IP address."
    fi
}

# Calculate Subnet
calculateSubnet() {
    read -p "Enter the IP address: " ip
    read -p "Enter the subnet mask (e.g., 255.255.255.0): " subnet
    if command -v ipcalc >/dev/null 2>&1; then
        ipcalc "$ip" "$subnet"
    else
        echo "Please install ipcalc or calculate manually."
    fi
}

# Ping IP
pingIp() {
    read -p "Enter the IP address: " ip
    ping -c 4 $ip
}

# Fetch Public IP
fetchPublicIp() {
    echo "Fetching public IP"
    sleep 1
    curl ifconfig.me
    echo
}

# List Network Interfaces
listInterface() {
    echo "Listing Interfaces......"
    networksetup -listallhardwareports
}

# Change IP Address
changeIpAddress() {
    read -p "Enter the network service name (e.g., WiFi): " service
    read -p "Enter the new IP address: " ipAddress
    read -p "Enter the new subnet mask (e.g., 255.255.255.0): " subnetMask
    read -p "Enter the new router address: " newRouter
    sudo networksetup -setmanual "$service" "$ipAddress" "$subnetMask" "$newRouter"
    echo "IP address updated."
}

# Main Menu
while true; do
    clear
    echo "=== Network Utility Script ==="
    echo "1. Validate IP address"
    echo "2. Calculate subnet details"
    echo "3. Ping an IP address"
    echo "4. Fetch public IP address"
    echo "5. List network interfaces"
    echo "6. Change system's IP address"
    echo "7. Exit"
    read -p "Select an option: " option

    case $option in
    1) validateIp ;;
    2) calculateSubnet ;;
    3) pingIp ;;
    4) fetchPublicIp ;;
    5) listInterface ;;
    6) changeIpAddress ;;
    7)
        echo "Goodbye!"
        exit 0
        ;;
    *) echo "Invalid option. Please try again." ;;
    esac

    read -p "Press Enter to continue..."
done
