#! /bin/bash

# 1、收集当前目录下当天创建的文件
#       sh -x get-new-added-files.sh
# 2、也可提供日期，收集特定日期创建的文件
#       sh -x get-new-added-files.sh 2024-08-20

cur_year=`date +%Y`
cur_date=`date +%Y-%m-%d`

if [ -n "$1" ]; then
    cur_date=$1
fi

rm -rf ./tmp/*

find . -type f -not -name '.*' \
        -not -name 'all*.pdf' \
        -not -name '*.sh' \
        -not -regex '\./tmp/.*' \
        -exec ls -lh -D '%Y-%m-%d %H:%M:%S' {} \; \
    | sed 's/.* \(202[0-9]-\)/\1/g' \
    | sort \
    | grep -E "^$cur_date" \
    | sed -e "s/$cur_year-.* \\././g" \
    | xargs -I % echo cp '"%"' ./tmp 
