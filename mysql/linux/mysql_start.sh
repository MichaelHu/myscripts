#!/bin/bash

HOME=/Users/hudamin

./mysqld_safe \
    --defaults-file=$HOME/softwares/mysql/share/mysql/my-medium.cnf \
    --socket=$HOME/tmp/mysql_3335.sock \
    --port=3335 \
    --datadir=$HOME/data_mysql/comments/ &
