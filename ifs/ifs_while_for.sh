#!/bin/bash  

# 简单csv文件解析
# 注意：不适用解析复杂csv文件的场景
# 问题：为什么在命令行模式下，IFS的设置不生效？
  
# 方案一，IFS环境变量Save/Restore
oldIFS=$IFS

# cat ./test.csv \
#     | tail -n 3 \
#     | while read line; do
#         IFS=','
#         fnum=1
#         for i in $line; do 
#             echo $fnum: $i;
#             ((fnum++))
#         done
#         IFS=$oldIFS
#     done
# 
# exit 0


# 方案二，子shell命令组合，避免IFS变量Save/Restore
cat ./test.csv \
    | while read line; do
        (
            fnum=1
            IFS=','
            for i in $line; do 
                echo $fnum: $i;
                ((fnum++))
            done
        )
    done

exit 0
  
