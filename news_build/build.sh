#!/bin/bash

ORGIMG=../product/img
ORGMANIFEST=../product/manifest
ORGUIIMG=../common/ui/GMU-ui/image
ORGVSUIIMG=../common/ui/VS-ui/image

DSTROOT=../release
DSTJS=../release/js
DSTCSS=../release/css
DSTIMG=../release/img
DSTMANIFEST=../release/manifest
DSTUIIMG=../release/img/ui

TMPDIR=/tmp/_tmp_cp_with_svn_clear

build_type=""
if [ "$1" == "debug" ]; then
    build_type="debug"    
fi

# build build_file output_file file_type build_type
function build () {
    wpp --use-config-file=build$4.conf $1 > $2.tmp

    case "$4" in
        "debug" )
        mv $2.tmp $2
        ;;

        * )
        if [ "js" == "$3" -o "css" == "$3" ]
        then
            java -jar yuicompressor-2.4.7.jar --type $3 --charset utf-8 $2.tmp > $2
            rm $2.tmp
        else
            mv $2.tmp $2
        fi
        ;;
    esac
}

mkdir -p $DSTJS
mkdir -p $DSTCSS
mkdir -p $DSTMANIFEST
build ../product/index.html $DSTROOT/index.html html $build_type
build common.js.build $DSTJS/common.js js $build_type
build iphone.js.build $DSTJS/iphone.js js $build_type
build iphone.css.build $DSTCSS/iphone.css css $build_type

build $ORGMANIFEST/cache.manifest $DSTMANIFEST/cache.manifest.tmp manifest $build_type
echo "# build_time: `date "+%Y/%m/%d %H:%M"`" \
    | cat $DSTMANIFEST/cache.manifest.tmp - > $DSTMANIFEST/cache.manifest \
    && rm $DSTMANIFEST/cache.manifest.tmp

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

cp_with_svn_clear $ORGIMG $DSTIMG 
cp_with_svn_clear $ORGUIIMG/toolbar $DSTUIIMG/toolbar
cp_with_svn_clear $ORGUIIMG/vstoolbar $DSTUIIMG/vstoolbar
cp_with_svn_clear $ORGUIIMG/quickdelete $DSTUIIMG/quickdelete
cp_with_svn_clear $ORGUIIMG/suggestion $DSTUIIMG/suggestion
cp_with_svn_clear $ORGVSUIIMG/productlist $DSTUIIMG/productlist
cp_with_svn_clear $ORGVSUIIMG/pageloading $DSTUIIMG/pageloading

