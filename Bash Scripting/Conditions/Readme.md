## Table of Contents

1. [Arithmetic Comparison Operators](#arithmetic-comparison-operators)
2. [String Comparison Operators](#string-comparison-operators)
3. [File Test Operators](#file-test-operators)

---

## Arithmetic Comparison Operators

Arithmetic comparison operators compare two integer values in shell scripts.

| Operator | Description                                                           | Example             |
| -------- | --------------------------------------------------------------------- | ------------------- |
| `-eq`    | Checks if two numbers are **equal**                                   | `[ "$a" -eq "$b" ]` |
| `-ne`    | Checks if two numbers are **not equal**                               | `[ "$a" -ne "$b" ]` |
| `-lt`    | Checks if the first number is **less than** the second                | `[ "$a" -lt "$b" ]` |
| `-le`    | Checks if the first number is **less than or equal to** the second    | `[ "$a" -le "$b" ]` |
| `-gt`    | Checks if the first number is **greater than** the second             | `[ "$a" -gt "$b" ]` |
| `-ge`    | Checks if the first number is **greater than or equal to** the second | `[ "$a" -ge "$b" ]` |

### Example Usage

```sh
a=5
b=10

if [ "$a" -lt "$b" ]; then
    echo "$a is less than $b"
fi
```

## String Comparison Operators

These operators are used for comparing strings in shell scripts.

| Operator | Description                             | Example                  |
| -------- | --------------------------------------- | ------------------------ |
| `=`      | Checks if two strings are **equal**     | `[ "$str1" = "$str2" ]`  |
| `!=`     | Checks if two strings are **not equal** | `[ "$str1" != "$str2" ]` |
| `-z`     | Checks if a string is **empty**         | `[ -z "$str" ]`          |
| `-n`     | Checks if a string is **not empty**     | `[ -n "$str" ]`          |

### Example Usage

#### String Equality

```sh
str1="hello"
str2="hello"
if [ "$str1" = "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi
```

## File Test Operators

File test operators are used to check the properties of files and directories.

| Operator | Description                                | Example                  |
| -------- | ------------------------------------------ | ------------------------ |
| `-e`     | Checks if the **file exists**              | `[ -e "/path/to/file" ]` |
| `-f`     | Checks if the **file is a regular file**   | `[ -f "/path/to/file" ]` |
| `-d`     | Checks if the **directory exists**         | `[ -d "/path/to/dir" ]`  |
| `-r`     | Checks if the **file is readable**         | `[ -r "/path/to/file" ]` |
| `-w`     | Checks if the **file is writable**         | `[ -w "/path/to/file" ]` |
| `-x`     | Checks if the **file is executable**       | `[ -x "/path/to/file" ]` |
| `-s`     | Checks if the **file has a non-zero size** | `[ -s "/path/to/file" ]` |

### Example Usage

#### Check if File Exists

```sh
if [ -e "/path/to/file" ]; then
    echo "File exists"
else
    echo "File does not exist"
fi
```

#### Logical AND

The `&&` operator executes the second command only if the first command returns true.

```sh
a=5
b=10

if [ "$a" -eq 5 ] && [ "$b" -eq 10 ]; then
    echo "Both conditions are true"
else
    echo "At least one condition is false"
fi

```
