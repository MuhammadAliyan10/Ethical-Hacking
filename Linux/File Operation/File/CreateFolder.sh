#!/bin/bash

echo -e "Enter the file name: \c : "
read foldername

if [ -e $foldername ]; then
    echo "Folder with the same name already exists"
else
    mkdir $foldername
    echo "Folder created successfully"
fi
