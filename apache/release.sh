#!/bin/bash

DEST=/private/etc/apache2
ORG=conf

cp -r conf tmp
find tmp -type d -name ".svn" -exec rm -rf {} \;

cp -r tmp/* $DEST
rm -rf tmp
