# GitHub Commands Documentation

This documentation provides a list of commonly used Git and GitHub commands along with explanations of how they work. These commands are essential for version control and collaboration on projects.

## Setting Up Git

### Configure Git Username and Email

```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

- **What it does**: Sets your username and email globally for all Git repositories on your machine.

### Check Git Configuration

```bash
git config --list
```

- **What it does**: Lists the current Git configuration, including username, email, and other settings.

---

## Repository Management

### Initialize a New Repository

```bash
git init
```

- **What it does**: Creates an empty Git repository in the current directory.

### Clone an Existing Repository

```bash
git clone <repository_url>
```

- **What it does**: Copies a remote repository to your local machine.

---

## Basic Git Commands

### Check Repository Status

```bash
git status
```

- **What it does**: Displays the state of the working directory and staging area, showing untracked, modified, and staged files.

### Add Files to Staging Area

```bash
git add <file>
git add .
```

- **What it does**: Adds specific files (`<file>`) or all files (`.`) to the staging area for the next commit.

### Commit Changes

```bash
git commit -m "Commit message"
```

- **What it does**: Saves staged changes with a descriptive message.

### View Commit History

```bash
git log
```

- **What it does**: Shows the commit history of the repository.

---

## Branch Management

### Create a New Branch

```bash
git branch <branch_name>
```

- **What it does**: Creates a new branch named `<branch_name>`.

### Switch to a Branch

```bash
git checkout <branch_name>
```

- **What it does**: Switches to the specified branch.

### Create and Switch to a Branch

```bash
git checkout -b <branch_name>
```

- **What it does**: Creates a new branch and switches to it.

### Merge a Branch

```bash
git merge <branch_name>
```

- **What it does**: Combines changes from the specified branch into the current branch.

### Delete a Branch

```bash
git branch -d <branch_name>
```

- **What it does**: Deletes the specified branch locally.

---

## Working with Remote Repositories

### Add a Remote Repository

```bash
git remote add origin <repository_url>
```

- **What it does**: Links the local repository to a remote repository named `origin`.

### View Remote Repositories

```bash
git remote -v
```

- **What it does**: Lists the remote repositories associated with the local repository.

### Push Changes to Remote Repository

```bash
git push origin <branch_name>
```

- **What it does**: Uploads commits from the local branch to the corresponding branch on the remote repository.

### Pull Changes from Remote Repository

```bash
git pull origin <branch_name>
```

- **What it does**: Fetches and merges changes from the remote branch into the local branch.

### Fetch Changes from Remote Repository

```bash
git fetch origin
```

- **What it does**: Retrieves updates from the remote repository without merging them.

---

## Resolving Conflicts

### View Merge Conflicts

```bash
git status
```

- **What it does**: Lists files with conflicts after a merge.

### Resolve and Mark as Resolved

```bash
git add <file>
```

- **What it does**: Marks the conflict as resolved after editing the conflicting file.

### Continue Merge Process

```bash
git commit
```

- **What it does**: Finalizes the merge after resolving conflicts.

---

## Undoing Changes

### Unstage a File

```bash
git reset <file>
```

- **What it does**: Removes the file from the staging area.

### Revert Changes in Working Directory

```bash
git checkout -- <file>
```

- **What it does**: Reverts changes in the working directory to the last committed state.

### Reset to a Previous Commit

```bash
git reset --hard <commit_hash>
```

- **What it does**: Resets the repository to a specified commit, discarding all changes after it.

---

## GitHub-Specific Commands

### Fork a Repository

- **What it does**: Creates a copy of someone else's repository under your GitHub account.

### Create a Pull Request

- **What it does**: Submits proposed changes from your branch to the original repository.

### Create a Personal Access Token (PAT)

1. Go to GitHub > Settings > Developer Settings > Personal Access Tokens.
2. Generate a new token and copy it.

- **What it does**: Replaces your password for Git operations over HTTPS.

---

## Tips and Best Practices

1. Write clear and concise commit messages.
2. Always pull the latest changes before starting work.
3. Use branches to isolate features or bug fixes.
4. Regularly push your changes to avoid losing work.
5. Resolve merge conflicts carefully to prevent overwriting others' work.
