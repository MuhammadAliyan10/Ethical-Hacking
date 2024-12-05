# File and Folder Permissions in Linux

This document provides an overview of file and folder permissions and the commands to modify them.

| **Permission**                | **Symbol** | **Description**                                         | **Command to Change**           |
| ----------------------------- | ---------- | ------------------------------------------------------- | ------------------------------- |
| **Read** (file)               | `r`        | Allows viewing the file contents.                       | `chmod u+r filename`            |
| **Write** (file)              | `w`        | Allows modifying the file contents.                     | `chmod u+w filename`            |
| **Execute** (file)            | `x`        | Allows running the file as a program/script.            | `chmod u+x filename`            |
| **Read** (folder)             | `r`        | Allows listing the contents of the folder.              | `chmod u+r foldername`          |
| **Write** (folder)            | `w`        | Allows creating, renaming, or deleting files in folder. | `chmod u+w foldername`          |
| **Execute** (folder)          | `x`        | Allows entering (`cd`) into the folder.                 | `chmod u+x foldername`          |
| **Remove Read**               | `-r`       | Removes read permission.                                | `chmod u-r filename/foldername` |
| **Remove Write**              | `-w`       | Removes write permission.                               | `chmod u-w filename/foldername` |
| **Remove Execute**            | `-x`       | Removes execute permission.                             | `chmod u-x filename/foldername` |
| **Set Permissions (Numeric)** | `###`      | Sets permissions using numeric codes (e.g., `755`).     | `chmod 755 filename/foldername` |

### Symbolic Representation of Permissions

- `r`: Read
- `w`: Write
- `x`: Execute
- `-`: No permission

### Numeric Representation of Permissions

| **Code** | **Permission**       | **Description**           |
| -------- | -------------------- | ------------------------- |
| `7`      | Read, Write, Execute | Full access.              |
| `6`      | Read, Write          | Modify and view contents. |
| `5`      | Read, Execute        | View and run contents.    |
| `4`      | Read                 | View contents only.       |
| `0`      | None                 | No access.                |

### Example Commands

1. **Set full permissions for a file:**
   ```bash
   chmod 777 filename
   ```
2. **Set read and write permissions for the owner, and read-only for group and others:**
   ```bash
   chmod 644 filename
   ```
3. **Set read, write, and execute permissions for the owner, and read-only for group and others:**
   ```bash
   chmod 755 filename
   ```
4. **Remove all permissions for group and others, keeping full permissions for the owner:**
   ```bash
   chmod 700 filename
   ```
5. **Grant execute permission to the owner only:**
   ```bash
   chmod u+x filename
   ```
6. **Remove write permission for the group:**

   ```bash
    chmod g-w filename
   ```

7. **Add read permission for others:**
   ```bash
    chmod o+r filename
   ```
8. **Remove execute permission for all users:**
   ```bash
    chmod a-x filename
   ```
9. **Set execute-only permissions for everyone:**

```bash
    chmod 111 filename
```

10. **Grant full permissions to the owner and no permissions to others:**

    ```bash
     chmod 744 filename
    ```

11. **Grant read and write permissions to everyone:**

    ```bash
     chmod 666 filename
    ```

12. **Set read-only permissions for all users:**

    ```bash
     chmod 444 filename
    ```

13. **Add write permission for group and others:**

    ```bash
        chmod go+w filename
    ```

14. **Remove all permissions for others:**

    ```bash
    chmod o-rwx filename
    ```

15. **Grant read and execute permissions to all users (useful for scripts):**

    ```bash
    chmod 755 filename
    ```

### Folder-Specific Commands

1. **Set full permissions for a folder (including contents):**
   ```bash
   chmod -R 777 foldername
   ```
2. **Set read, write, and execute permissions for the owner, and read-only for group and others for a folder:**
   ```bash
   chmod -R 755 foldername
   ```
3. **Remove write permission for the group for a folder:**
   ```bash
   chmod -R g-w foldername
   ```
4. **Grant execute permission to the owner only for a folder:**
   ```bash
   chmod -R u+x foldername
   ```
5. **Set read-only permissions for a folder and its contents:**
   ```bash
   chmod -R 444 foldername
   ```
6. **Set read-only permissions for a folder and its contents:**
   ```bash
   chmod -R 444 foldername
   ```
7. **Remove all permissions for others for a folder:**
   ```bash
   chmod -R o-rwx foldername
   ```

### Combination Example

- **Grant read and execute to group and others while keeping full permissions for the owner:**
  ```bash
  chmod 750 filename
  ```
