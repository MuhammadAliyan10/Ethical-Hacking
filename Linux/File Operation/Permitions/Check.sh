#!/bin/bash

echo -e "Enter folder/file name to check the permissions : \c "
read name

if [ -e $name]; then
    ls -l $name
else
    echo "File/folder $name not found."
fi
