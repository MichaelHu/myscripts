echo "parsing $1"

TMPFILE=$1.__tmp__
cp "$1" "$TMPFILE"
echo >> "$TMPFILE"

/home/work/bin/slides "$TMPFILE" \
    | cat ./markdown_res/header_reveal.tpl.html - ./markdown_res/footer_reveal.tpl.html \
    > "$1".html

rm "$TMPFILE"
