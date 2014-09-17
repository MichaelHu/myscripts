#!/bin/bash


ROOT=/home/work/hudamin/fedocs
DOCDIR=$ROOT/docs

SVNCMD=/home/work/softwares/svn/svn_server/subversion-1.6.15/bin/svn

CHANGEDFILE=$1

cd $ROOT

pushd $DOCDIR
$SVNCMD up
popd

# rm -rf __tmp
# mkdir __tmp
cp -r $DOCDIR/* __tmp
find __tmp -type d -name ".svn" -exec rm -rf {} \;

pushd __tmp

for i in `cat $CHANGEDFILE | grep -P '\.md$' | awk '{printf "%s",$2}'`; do
    /bin/bash $ROOT/bin/build-markdown.sh $i
done

for i in `cat $CHANGEDFILE | grep -P '\.slides$' | awk '{printf "%s",$2}'`; do
    /bin/bash $ROOT/bin/build-slides.sh $i
done

# find . -type f \
#     \( -regex "\..*\.md" \
#     -or -regex "\..*\.txt" \
#     -or -regex "\..*\.text" \) \
#     -exec sh $ROOT/bin/build-markdown.sh {} \;
# 
# find . -type f \
#     -regex "\..*\.slides" \
#     -exec sh $ROOT/bin/build-slides.sh {} \;

find . -type f -regex "\..*\.html" \
    | sed -r 's/^.+$/<a href="&" target="_blank">&<\/a><br>/g' \
    | cat ./markdown_res/header.tpl.html - ./markdown_res/footer.tpl.html  \
    > list.md.html

popd

