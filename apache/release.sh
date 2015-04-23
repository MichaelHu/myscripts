#!/bin/bash

DEST=/private/etc/apache2
ORG=conf-2.4

cp -r $ORG tmp
find tmp -type d -name ".svn" -exec rm -rf {} \;

cp -r tmp/* $DEST
rm -rf tmp
