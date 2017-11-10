#!/bin/bash

function list_remote() {
    for i in $(git branch -r | grep -v 'HEAD' | sed -e 's/\*//g'); do
        show_branch_log $i;
        done \
    | sort -r
}

function list_local() {
    for i in $(git branch | grep -v 'HEAD' | sed -e 's/\*//g'); do
        show_branch_log $i;
        done \
    | sort -r
}

function list_no_merged_local() {
    for i in $(git branch --no-merged | grep -v 'HEAD' | sed -e 's/\*//g'); do
        show_branch_log $i;
        done \
    | sort -r
}

function list_no_merged_remote() {
    for i in $(git branch -r --no-merged | grep -v 'HEAD' | sed -e 's/\*//g'); do
        show_branch_log $i;
        done \
    | sort -r
}

function show_branch_log() {
    git log -1 --date=iso $1 \
        | grep 'Date:' \
        | sed -e 's/^Date: *//g' \
        | sed -e 's/+0800//g' \
        | awk -v branch=$1 '{printf "%s %s\n", $0, branch}'
}


function show_log() {
    for i in $*; do 
        echo
        echo == start ================================================= 
        echo == $i
        echo ========================================================== 
        git checkout $i
        git log -1
        echo == end   ================================================= 
        echo
    done
}

$*

