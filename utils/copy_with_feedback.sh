#!/bin/bash

FROM=$1
TO=$2

total=$(find $FROM -mindepth 1 -maxdepth 1 -type f | wc -l)
# total=$(find $FROM -mindepth 1 -maxdepth 1 -type f -regex ".*IMG_1[2-9][0-9][0-9].JPG" -or -regex ".*IMG_11[7-9][0-9].JPG" -or -regex ".*IMG_2[0-9][0-9][0-9].JPG" | wc -l)
count=0

find $FROM -mindepth 1 -maxdepth 1 -type f > /tmp/files.lst
# find $FROM -mindepth 1 -maxdepth 1 -type f -regex ".*IMG_1[2-9][0-9][0-9].JPG" -or -regex ".*IMG_11[7-9][0-9].JPG" -or -regex ".*IMG_2[0-9][0-9][0-9].JPG" > /tmp/files.lst

# 通过-v选项给awk程序传递变量
awk -v dest="$TO" \
    -v total="$total" \
    -f generate_copy_commands.awk /tmp/files.lst

