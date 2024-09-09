#!/bin/bash

a=10
b=9

if [ $a -eq $b ]; then
    echo "$a is equal to $b"
elif [ $a -gt $b ]; then
    echo "$a is greater than $b"
elif [ $a -lt $b ]; then
    echo "$a is less than $b"
fi

if (("$a" == "$b")); then
    echo "$a is equal to $b"
elif (("$a" > "$b")); then
    echo "$a is greater than $b"
elif (("$a" < "$b")); then
    echo "$a is less than $b"
fi
