#!/bin/bash


ROOT=/home/work/hudamin/fedocs
DOCDIR=$ROOT/docs

SVNCMD=/usr/bin/svn

CHANGEDFILE=$1

cd $ROOT

pushd $DOCDIR
$SVNCMD up
popd

rm -rf __tmp/*
cp -r $DOCDIR/* __tmp
find __tmp -type d -name ".svn" -exec rm -rf {} \;

pushd __tmp

# for i in `cat $CHANGEDFILE | grep -P '\.md$' | awk '{printf "%s\n",$2}'`; do
#     /bin/bash $ROOT/bin/build-markdown.sh $i
# done
# 
# for i in `cat $CHANGEDFILE | grep -P '\.slides$' | awk '{printf "%s\n",$2}'`; do
#     /bin/bash $ROOT/bin/build-slides.sh $i
# done

find . -type f \
    -regex "\..*\.md" \
    -exec /bin/bash $ROOT/bin/build-markdown-node.sh {} \;

find . -type f \
    -regex "\..*\.slides" \
    -exec /bin/bash $ROOT/bin/build-slides.sh {} \;

popd
