#!/bin/bash

echo -e "Enter a number : \c"
read num

if [ $((num % 2)) -eq 0 ]
then
    echo "$num is even."
else
    echo "$num is odd."
fi
