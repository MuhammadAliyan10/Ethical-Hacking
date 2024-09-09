#! /bin/bash

#? The default argument store in $1, $2 , $2

echo "$0, $1, $2"

args=("$@")
echo "${args[0]}, ${args[1]}, ${args[2]}"

number=$#

echo "Total number of arguments : ${number}"
