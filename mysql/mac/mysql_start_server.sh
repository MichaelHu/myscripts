#!/bin/bash

HOME=/Users/hudamin

./mysqld_safe \
    --defaults-file=$HOME/projects/git/git-myscripts/mysql/conf/my-mac.cnf \
    --ledir=$HOME/softwares/mysql-5.6.24-osx10.8-x86_64/bin/ 
