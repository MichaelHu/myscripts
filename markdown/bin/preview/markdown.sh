#!/bin/bash

TMPFILE=$1.__tmp__
MARKDOWNCMD=/Users/hudamin/projects/git/git-myscripts/markdown/bin/preview/markdown.out
ROOT=/Users/hudamin/projects/git/git-myscripts/markdown/bin/preview

cat "$1" "$ROOT/file_empty_line" > "$TMPFILE"

$MARKDOWNCMD "$TMPFILE" | cat "$ROOT/tpl/header.tpl.html" - "$ROOT/tpl/footer.tpl.html" \
    > "$ROOT/tmp/preview.html" \
    && open "$ROOT/tmp/preview.html"

rm "$TMPFILE"
