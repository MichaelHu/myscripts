#!/bin/bash                                                                                                                                                 

REPOS="$1"
REV="$2"

TIME=`date +%Y%m%d%H%M`
LOGFILE="/home/work/hudamin/fedocs/bin/svn-hooks/log/commit-log.$TIME.txt"
SVNLOOK="/home/work/svn/subversion-1.6.11/bin/svnlook"

MAILSUBJECT="NEWSDOCS COMMIT MEMO ($TIME)"

BUILDCMD="/home/work/hudamin/fedocs/bin/build-all.sh"
SEPARATORS="=====-------------++"
SEPARATORE="++-------------====="

echo "${SEPARATORS} COMMIT INFO ${SEPARATORE}" > $LOGFILE
echo "repos: $REPOS revision: $REV" >> $LOGFILE

echo >> $LOGFILE
echo >> $LOGFILE
echo "${SEPARATORS} CHANGED FILE LIST ${SEPARATORE}" >> $LOGFILE
$SVNLOOK changed -r $REV $REPOS >> $LOGFILE

echo >> $LOGFILE
echo >> $LOGFILE
echo "${SEPARATORS} FILE CONTENT DIFF ${SEPARATORE}" >> $LOGFILE
$SVNLOOK diff -r $REV $REPOS >> $LOGFILE

echo >> $LOGFILE
echo >> $LOGFILE
echo "${SEPARATORS} BUILD MARKDOWN ${SEPARATORE}" >> $LOGFILE
/bin/bash -x $BUILDCMD >> $LOGFILE 2>&1

# send mail
mail -s "$MAILSUBJECT" -a $LOGFILE hudamin@baidu.com <<EOF

Build Successfully!

LOGFILE: 
    $LOGFILE

EOF

