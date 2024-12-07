#!/bin/bash

while true; do
    echo "------------ System Monitor and Manager -----------"
    echo "1. Display System Information"
    echo "2. Manage Processes"
    echo "3. Manage Files"
    echo "4. Automate Tasks"
    echo "5. Exit"
    echo "---------------------------------------------------"
    read -p "Enter your choice [1-5]: " choice

    case $choice in
    1)
        echo "--- System Information ---"
        echo "Hostname: $(hostname)"
        echo "Uptime: $(uptime -p)"
        echo "Current Users:"
        who
        echo "Memory Usage:"
        free -h
        echo "Disk Usage:"
        df -h
        echo "Network Information:"
        ip addr show | grep "inet " | awk '{print $2}'
        echo
        ;;
    2)
        echo "--- Process Manager ---"
        echo "1. List all running processes"
        echo "2. Search for a process"
        echo "3. Kill a process"
        read -p "Choose an option [1-3]: " procChoice
        case $procChoice in
        1)
            ps aux
            ;;
        2)
            read -p "Enter the process name to search: " procName
            ps aux | grep "$procName" | grep -v "grep"
            ;;
        3)
            read -p "Enter the process ID to kill: " procId
            kill -9 $procId && echo "Process $procId killed"
            ;;
        *)
            echo "Invalid choice"
            ;;
        esac
        ;;
    3)
        echo "--- File Manager ---"
        echo "1. Search for files"
        echo "2. Compress and archive files"
        echo "3. Backup a directory"
        read -p "Choose an option [1-3]: " fileOpt
        case $fileOpt in
        1)
            read -p "Enter filename to search: " filename
            find / -name "$filename" 2>/dev/null
            ;;
        2)
            read -p "Enter directory name to compress: " dirName
            tar -czvf "${dirName}.tar.gz" "$dirName"
            echo "Directory $dirName compressed."
            ;;
        3)
            read -p "Enter directory to backup: " backDir
            backUpFile="backup_$(date +%F_%T).tar.gz"
            tar -czvf "$backUpFile" "$backDir"
            echo "Backup created: $backUpFile"
            ;;
        *)
            echo "Invalid choice"
            ;;
        esac
        ;;
    4)
        echo "--- Automate Tasks ---"
        echo "1. Schedule a cron job"
        echo "2. Delete temp files older than N days"
        read -p "Choose an option [1-2]: " autoChoice
        case $autoChoice in
        1)
            read -p "Enter command to schedule: " cmdSch
            read -p "Enter cron schedule (e.g., '0 5 * * *' for daily at 5 AM): " cmdTime
            (
                crontab -l 2>/dev/null
                echo "$cmdTime $cmdSch"
            ) | crontab -
            echo "Cron job added."
            ;;
        2)
            read -p "Enter directory to clean up: " tempDir
            read -p "Enter days (N): " tempDay
            find "$tempDir" -type f -mtime +$tempDay -exec rm -f {} \;
            echo "Deleted files older than $tempDay days in $tempDir."
            ;;
        *)
            echo "Invalid choice"
            ;;
        esac
        ;;
    5)
        echo "Exiting... Goodbye!"
        break
        ;;
    *)
        echo "Invalid choice. Please enter a valid option."
        ;;
    esac
done
