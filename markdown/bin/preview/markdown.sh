#!/bin/bash

FILENAME=$1
MARKDOWNCMD=/Users/hudamin/projects/git/git-myscripts/markdown/bin/preview/markdown.out
ROOT=/Users/hudamin/projects/git/git-myscripts/markdown/bin/preview

$MARKDOWNCMD "$1" | cat "$ROOT/tpl/header.tpl.html" - "$ROOT/tpl/footer.tpl.html" \
    > "$ROOT/tmp/preview.html" \
    && open "$ROOT/tmp/preview.html"


