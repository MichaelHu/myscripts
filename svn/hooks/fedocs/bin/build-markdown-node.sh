echo "parsing $1"

TMPFILE=$1.__tmp__
cp "$1" "$TMPFILE"
echo >> "$TMPFILE"
MARKED=/home/xiaoju/hudamin/fedocs/bin/marked-parser/index.js

# /home/xiaoju/zhaoming/node-v0.12.2/out/Release/node $MARKED "$TMPFILE" 
/home/xiaoju/zhaoming/node-v0.12.2/out/Release/node $MARKED "$TMPFILE" \
        | cat ./docroot/markdown_res/header.tpl.html - ./docroot/markdown_res/footer.tpl.html \
            > "$1".html

rm "$TMPFILE"
