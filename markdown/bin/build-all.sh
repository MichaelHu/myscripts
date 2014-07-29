#!/bin/bash

ROOT=/Users/hudamin/docs/newsdocs
DOCDIR=$ROOT/docs

SVNCMD=/usr/bin/svn

cd $ROOT

pushd $DOCDIR
$SVNCMD up
popd

rm -rf __tmp
mkdir -p __tmp/docs
cp -r $DOCDIR/* __tmp/docs

pushd __tmp/docs

find . -type d -name ".svn" -exec rm -rf {} \;

find . -type f \
    \( -regex "\..*\.md" \
    -or -regex "\..*\.txt" \
    -or -regex "\..*\.text" \) \
    -exec sh $ROOT/bin/build-markdown.sh {} \;

find . -type f -regex "\..*\.html" \
    | sed -E 's/^.+$/<a href="&" target="_blank">&<\/a><br>/g' \
    | cat ./markdown_res/header.tpl.html - ./markdown_res/footer.tpl.html  \
    > list.md.html

popd
