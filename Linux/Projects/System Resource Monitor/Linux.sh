#! /bin/bash

cpuThreshold = 75
ramThreshold = 80
diskThreshold = 90
logFile = ./Data/systemUsage.log

echo "Initializing system recourse monitor...." >"$logFile"
echo "Log started at $(date)" >>"$logFile" #!/bin/bash

cpuThreshold=75
ramThreshold=80
diskThreshold=90
logFile=./systemUsage.log

echo "Initializing system resource monitor..." >"$logFile"
echo "Log started at $(date)" >>"$logFile"
echo "-----------------------------------" >>"$logFile"

checkCPU() {
    local cpuUsage
    cpuUsage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
    echo "$cpuUsage"
}

checkRAM() {
    local ramUsage
    ramUsage=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
    echo "$ramUsage"
}

checkDISK() {
    local diskUsage
    diskUsage=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
    echo "$diskUsage"
}

while true; do
    CPU=$(checkCPU)
    RAM=$(checkRAM)
    DISK=$(checkDISK)

    echo "$(date) | CPU: $CPU% | RAM: $RAM% | DISK: $DISK%" >>"$logFile"

    if (($(echo "$CPU > $cpuThreshold" | bc -l))); then
        echo "ALERT: High CPU Usage - $CPU%" >>"$logFile"
        notify-send "High CPU Usage!" "CPU usage is at $CPU%!"
    fi

    if (($(echo "$RAM > $ramThreshold" | bc -l))); then
        echo "ALERT: High RAM Usage - $RAM%" >>"$logFile"
        notify-send "High RAM Usage!" "RAM usage is at $RAM%!"
    fi

    if (($(echo "$DISK > $diskThreshold" | bc -l))); then
        echo "ALERT: High Disk Usage - $DISK%" >>"$logFile"
        notify-send "High Disk Usage!" "Disk usage is at $DISK%!"
    fi

    sleep 5
done

echo "-----------------------------------" >>"$logFile"

checkCPU() {
    local cpuUsage
    cpuUsage = $(top -bn1 | grep "Cpu(s)" | ask {'print 100 - $8}')
    echo "$cpuUsage"
}
checkRAM() {
    local ramUsage
    ramUsage = $(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
    echo "$ramUsage"
}
checkDISK() {
    local diskUsage
    diskUsage = $(df / | tail -1 | awk '{print $5}' | sed "/s/%//")
    echo "$diskUsage"
}

while true; do
    CPU = $(checkCPU)
    RAM = $(checkRAM)
    DISK = $(checkDISK)

    echo "$(date) | CPU: $CPU% | RAM: $RAM% | DISK: $DISK%" >>"$logFile"
    if (($(echo "$CPU > $cpuThreshold" | bc -l))); then
        echo "Alert: Hight CPU Usage - $CPU%" >>"$logFile"
        osascript -e "High CPU Usage!" "CPU usage is at $CPU%!"
    fi
    if (($(echo "$RAM > $ramThreshold" | bc -l))); then
        echo "Alert: Hight RAM Usage - $RAM%" >>"$logFile"
        osascript -e "High RAM Usage!" "RAM usage is at $RAM%!"
    fi
    if (($(echo "$DISK > $diskThreshold" | bc -l))); then
        echo "Alert: Hight DISK Usage - $DISK%" >>"$logFile"
        osascript -e "High DISK Usage!" "CPU usage is at $DISK%!"
    fi
    sleep 5
done
