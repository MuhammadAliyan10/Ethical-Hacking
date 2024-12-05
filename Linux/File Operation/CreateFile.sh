#!/bin/bash

echo -e "Enter the file name: \c : "
read filename

if [ -f $filename ]; then
    echo "File already exists"
else
    touch $filename
    echo "File created successfully"
fi
