#!/bin/bash

HOME=/Users/hudamin

./mysqld_safe \
    --defaults-file=$HOME/projects/git/myscripts/mysql/conf/my-mac.cnf \
    --ledir=$HOME/softwares/mysql-5.6.13-osx10.7-x86_64/bin/ 
