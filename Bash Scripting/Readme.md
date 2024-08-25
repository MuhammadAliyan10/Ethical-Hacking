# Shell Scripting Syntax and Commands

This document provides an overview of basic shell scripting syntax and commands.

## Table of Contents

1. [Variables](#variables)
2. [Comments](#comments)
3. [Conditional Statements](#conditional-statements)
4. [Loops](#loops)
5. [Functions](#functions)
6. [Case Statements](#case-statements)
7. [Input and Output](#input-and-output)
8. [File Testing](#file-testing)
9. [String Operations](#string-operations)
10. [Arithmetic Operations](#arithmetic-operations)
11. [Process Control](#process-control)
12. [Logical Operators](#logical-operators)

---

## Variables

```bash
# Assigning a value to a variable
variable_name="value"

# Accessing a variable's value
echo $variable_name

```

## Conditional Statements

```bash
# If-else statement
if [ condition ]; then
    # commands to execute if condition is true
elif [ another_condition ]; then
    # commands to execute if another_condition is true
else
    # commands to execute if none of the conditions are true
fi

```

## Loops

```bash
# For loop
for variable in list; do
    # commands to execute
done

# While loop
while [ condition ]; do
    # commands to execute
done

# Until loop
until [ condition ]; do
    # commands to execute
done

```

## Functions

```bash
# Defining a function
function_name() {
    # commands to execute
}

# Calling a function
function_name

```

## Case Statements

```bash
# Case statement for matching a value against patterns
case "$variable" in
    pattern1)
        # commands to execute if variable matches pattern1
        ;;
    pattern2)
        # commands to execute if variable matches pattern2
        ;;
    *)
        # commands to execute if variable doesn't match any patterns
        ;;
esac

```

## Input and Output

```bash
# Reading input from the user
read variable_name

# Redirecting output
command > file.txt  # redirect output to a file
command >> file.txt  # append output to a file
command < input.txt  # take input from a file

```

## File Testing

```bash
# Testing if a file exists
if [ -e filename ]; then
    echo "File exists"
fi

# Testing if a file is readable, writable, or executable
if [ -r filename ]; then
    echo "File is readable"
fi
if [ -w filename ]; then
    echo "File is writable"
fi
if [ -x filename ]; then
    echo "File is executable"
fi
```

## String Operations

```bash
# Comparing strings
if [ "$string1" = "$string2" ]; then
    echo "Strings are equal"
fi

if [ "$string1" != "$string2" ]; then
    echo "Strings are not equal"
fi
```

## Arithmetic Operations

```bash
# Performing arithmetic operations
result=$((num1 + num2))
echo $result
```

## Process Control

```bash
# Running a command in the background
command &

# Checking the exit status of the last command
if [ $? -eq 0 ]; then
    echo "Success"
else
    echo "Failure"
fi

```

## Logical Operators

### AND (`&&`)

```bash
if [ condition1 ] && [ condition2 ]; then
    echo "Both conditions are true"
fi
```

### OR (`||`)

```bash
if [ condition1 ] || [ condition2 ]; then
    echo "At least one condition is true"
fi
```

### NOT (!)

```bash
if [ ! condition ]; then
    echo "Condition is false"
fi
```

## Equality (`=` and `!=`)

```bash
# String equality
if [ "$string1" = "$string2" ]; then
    echo "Strings are equal"
fi

if [ "$string1" != "$string2" ]; then
    echo "Strings are not equal"
fi

# Numeric equality
if [ "$num1" -eq "$num2" ]; then
    echo "Numbers are equal"
fi

if [ "$num1" -ne "$num2" ]; then
    echo "Numbers are not equal"
fi

```
