#!/bin/bash

HOME=/home/hudamin
MYSQL_DIR=$HOME/softwares/mysql

mkdir -p $MYSQL_DIR 
 
# 使用的configure方式
./configure --prefix=$MYSQL_DIR \
    --with-charset=utf8 \
    --with-unix-socket-path=$HOME/tmp/mysql_3335.sock \
    --with-tcp-port=3335
 
make > log_make.log 2>&1
make install > log_make_install.log 2>&1

