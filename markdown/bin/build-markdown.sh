echo "parsing $1"

/Users/hudamin/bin/markdown "$1" \
    | cat ./markdown_res/header.tpl.html - ./markdown_res/footer.tpl.html \
    > "$1".html
