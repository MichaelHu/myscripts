#!/bin/bash

# @desc: start a svn server which runs foreground
# @usage: sh -x start_server.sh 
# @author: hudamin@baidu.com

SERVERROOT=/Users/hudamin/repos_svn
DIRECTORYROOT=$SERVERROOT/data

# global conf, overriding per-repository conf
CONFIGFILE=$SERVERROOT/svnserve.conf

LOGFILE=$SERVERROOT/svnserve.log
PIDFILE=$SERVERROOT/svnserve.pid

PORT=8090

svnserve -d -r $DIRECTORYROOT \
        --foreground \
        --listen-port $PORT \
        --listen-host 127.0.0.1 \
        --config-file $CONFIGFILE \
        --log-file $LOGFILE \
        --pid-file $PIDFILE 

