#!/bin/bash

file="$1"
if [ -z "$file" ]; then
    file=`pwd`
fi

abs_dir=$(cd `dirname $file` && pwd)
file_name=${file##*/}

echo $abs_dir
echo $file_name
echo $abs_dir/$file_name
