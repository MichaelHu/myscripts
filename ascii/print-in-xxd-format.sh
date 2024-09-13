#! /bin/bash

# 【注意】必须使用/bin/bash，而不是/bin/sh
# sh不支持进程替换<()能力

# 单行模式，方便命令行运行
# paste <(cnt=0; for i in `seq 0 16 127`; do if [ $cnt -eq 1 ]; then echo; cnt=0; fi; printf '%08x:' $i; ((cnt++)); done) <(cnt=0; cnt_2=0; for i in `seq 0 127`; do if [ $cnt -eq 16 ]; then echo; cnt=0; fi; printf '%02x' $i; ((cnt_2++)); if [ $cnt_2 -eq 2 ]; then printf ' '; cnt_2=0;  fi; ((cnt++)); done) | sed -e 's/\t/ /g'

# 多行模式，方便查看代码逻辑
paste \
    <(
        cnt=0
        for i in `seq 0 16 127`; do
            if [ $cnt -eq 1 ]; then 
                echo 
                cnt=0
            fi 
            printf '%08x:' $i
            ((cnt++))
        done
    ) \
    <(
        cnt=0
        cnt_2=0
        for i in `seq 0 127`; do
            if [ $cnt -eq 16 ]; then
                echo
                cnt=0
            fi
            printf '%02x' $i
            ((cnt_2++))
            if [ $cnt_2 -eq 2 ]; then 
                printf ' '
                cnt_2=0
            fi 
            ((cnt++))
        done
    ) | sed -e 's/\t/ /g'
