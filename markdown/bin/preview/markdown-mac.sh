#!/bin/bash

TMPFILE=$1.__tmp__
MARKDOWNCMD=/Users/hudamin/projects/git/git-myscripts/markdown/bin/preview/mac/markdown
ROOT=/Users/hudamin/projects/git/git-myscripts/markdown/bin/preview
TPL=tpl

if [ "$2" == "local" ]; then
    TPL=tpl_local
fi

cat "$1" "$ROOT/file_empty_line" > "$TMPFILE"

$MARKDOWNCMD "$TMPFILE" | cat "$ROOT/$TPL/header.tpl.html" - "$ROOT/$TPL/footer.tpl.html" \
    > "$ROOT/tmp/preview.html" \
    && open "$ROOT/tmp/preview.html"

rm "$TMPFILE"
