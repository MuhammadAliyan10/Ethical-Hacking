#!/bin/bash

cpuThreshold=75
ramThreshold=80
diskThreshold=90
logFile= ./systemUsage.log

echo "Initializing system resource monitor..." >"$logFile"
echo "Log started at $(date)" >>"$logFile"
echo "-----------------------------------" >>"$logFile"

checkCPU() {
    local cpuUsage
    cpuUsage=$(top -l 1 | grep "CPU usage" | awk '{print 100 - $7}' | sed 's/%//')
    echo "$cpuUsage"
}

checkRAM() {
    local ramUsage
    ramUsage=$(vm_stat | awk '/free/ {free=$3} /active/ {active=$3} /inactive/ {inactive=$3} /speculative/ {spec=$3} /wired/ {wired=$3} END {used=(active+inactive+spec+wired); total=(used+free); print (used/total)*100}')
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
        osascript -e 'display notification "CPU usage is at '"$CPU"'%" with title "High CPU Usage!"'
    fi

    if (($(echo "$RAM > $ramThreshold" | bc -l))); then
        echo "ALERT: High RAM Usage - $RAM%" >>"$logFile"
        osascript -e 'display notification "RAM usage is at '"$RAM"'%" with title "High RAM Usage!"'
    fi

    if (($(echo "$DISK > $diskThreshold" | bc -l))); then
        echo "ALERT: High Disk Usage - $DISK%" >>"$logFile"
        osascript -e 'display notification "Disk usage is at '"$DISK"'%" with title "High Disk Usage!"'
    fi

    sleep 5
done
