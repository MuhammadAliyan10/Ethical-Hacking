#!/bin/bash

echo -e "Enter name of the folder/file to delete: \c"
read name

if [ -d "$name" ]; then
    echo "Deleting folder $name ..."
    rm -r "$name"
elif [ -f "$name" ]; then
    echo "Deleting file $name ..."
    rm "$name"
else
    echo "$name does not exist."
fi
