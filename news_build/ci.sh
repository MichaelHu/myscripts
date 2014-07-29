#!/bin/bash

sh deploy.sh debug 2>&1 | grep -P '^Error:'

if [ $? == 0 ]; then
    exit 1
fi
