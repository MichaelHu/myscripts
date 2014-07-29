#!/bin/bash

# first step: create database related files

HOME=/Users/hudamin

./mysql_install_db \
    --basedir=$HOME/softwares/mysql-5.6.13-osx10.7-x86_64/ \
    --datadir=$HOME/mysql_data/
