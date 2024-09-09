echo "Enter the name of the file : \c"
read fileName

if [ -e $fileName ]; then
    echo "File $fileName exists."
else
    echo "File $fileName does not exist."
fi
if [ -s $fileName ]; then
    echo "File $fileName exists and not empty"
else
    echo "File $fileName empty."
fi

if [ -c $fileName ]; then
    echo "File $fileName exists and character special file."
else
    echo "File $fileName does not exist."
fi

if [ -d $fileName ]; then
    echo "File $fileName exists and block special file."
else
    echo "File $fileName does not exist."
fi

if [ -f $fileName ]; then
    echo "File $fileName exists and regulare file."
else
    echo "File $fileName does not exist."
fi

#? Directory

echo "Enter the name of the folder : \c"
read folderName

if [ -d $folderName ]; then
    echo "Folder $folderName exists."
else
    echo "Folder $folderName does not exist."
fi
