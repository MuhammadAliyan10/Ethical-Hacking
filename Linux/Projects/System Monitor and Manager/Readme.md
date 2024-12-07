# **System Monitor and Manager Script**

This script provides a simple menu-based interface to monitor and manage system resources, processes, files, and automation tasks.

---

## **Features**

1. Display System Information
2. Manage Processes
3. Manage Files
4. Automate Tasks

---

## **Commands Used**

### **General System Commands**

| **Command** | **Description**                                                        |
| ----------- | ---------------------------------------------------------------------- |
| `hostname`  | Displays the system's hostname.                                        |
| `uptime -p` | Shows how long the system has been running in a human-readable format. |
| `who`       | Lists all logged-in users.                                             |
| `free -h`   | Displays memory usage in a human-readable format.                      |
| `df -h`     | Displays disk space usage in a human-readable format.                  |

---

### **Network Commands**

| **Command**        | **Description**                                                      |
| ------------------ | -------------------------------------------------------------------- |
| `ip addr show`     | Displays detailed IP address information for all network interfaces. |
| `grep "inet "`     | Filters lines containing "inet" (IPv4 addresses).                    |
| `awk '{print $2}'` | Extracts the second field of each line to display IP addresses.      |

---

### **Process Management Commands**

| **Command**      | **Description**                                          |
| ---------------- | -------------------------------------------------------- |
| `ps aux`         | Lists all running processes with detailed information.   |
| `grep <pattern>` | Searches for a specific process name or pattern.         |
| `kill -9 <PID>`  | Forcefully terminates a process by its Process ID (PID). |

---

### **File Management Commands**

| **Command**               | **Description**                                            |
| ------------------------- | ---------------------------------------------------------- |
| `find / -name <file>`     | Searches for a file by name in the entire filesystem.      |
| `2>/dev/null`             | Redirects error messages to `/dev/null` to suppress them.  |
| `tar -czvf <archive>`     | Compresses and archives a directory into a `.tar.gz` file. |
| `tar -czvf backup.tar.gz` | Creates a compressed backup of a directory.                |

---

### **Automation Commands**

| **Command**                            | **Description**                                          |
| -------------------------------------- | -------------------------------------------------------- | ------------------------------------ |
| `crontab -l`                           | Lists existing cron jobs for the current user.           |
| `echo "<schedule> <command>"           | crontab -`                                               | Adds a new cron job to the schedule. |
| `find <directory> -type f -mtime +<N>` | Finds files older than `N` days in a specific directory. |
| `-exec rm -f {}`                       | Deletes the files found in the search.                   |

---

## **Usage**

1. **Run the script:**
   ```bash
   chmod +x system_manager.sh
   ./system_manager.sh
   ```
