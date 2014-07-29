#!/bin/bash

DST=/home/work/webapp/news_android
DST_STATIC=/home/work/webapp/static/news/webapp_lite

echo "cleaning..."
rm -rf $DST/*
rm -rf $DST_STATIC/*

build_type=""
if [ "$1" == "debug" ]; then
    build_type="debug"    
fi

echo "building..."
sh -x build.sh $build_type

echo "releasing..."


mkdir -p $DST
mkdir -p $DST_STATIC/js
mkdir -p $DST_STATIC/img
mkdir -p $DST_STATIC/css
mkdir -p $DST_STATIC/mock
mkdir -p $DST_STATIC/manifest

TMPDIR=/tmp/_tmp_cp_with_svn_clear
# cp from to
function cp_with_svn_clear () {
    if [ ! -e $TMPDIR ]; then
        mkdir -p $TMPDIR
    fi
    # !!! dangrous operation
    rm -rf /tmp/_tmp_cp_with_svn_clear/*

    cp -r $1/* $TMPDIR 
    find $TMPDIR -type d -name '.svn' | xargs rm -rf 2>/dev/null

    if [ ! -e $2 ]; then
        mkdir -p $2
    fi
    cp -r $TMPDIR/* $2
}

cp ../release/index.html $DST
cp ../product/mock/* $DST_STATIC/mock
cp_with_svn_clear ../release/img $DST_STATIC/img
cp ../release/js/*.js $DST_STATIC/js
cp ../release/css/*.css $DST_STATIC/css
cp ../release/manifest/*.manifest $DST_STATIC/manifest

