#!/bin/bash

# This is the bash script version of "Daily Notes"
# The preferred alias to the script is "dn 'Whatever you want to note'"
#
# IMPORTANT: You must use single quotes.
# Ex: dn 'Note'

DIRECTORY=$HOME'/Dropbox/Documentation/daily_notes'
FILE=$DIRECTORY'/'`date +%F`.md
NOTE=$1
DATE=`date +%B\ %d\,\ %Y`
TIME=`date +%r`

if [ ! -d "$DIRECTORY" ]; then
  mkdir -p "$DIRECTORY"
  echo $DIRECTORY
fi

if [ ! -e $FILE ]; then
  echo 'Daily Notes for '$DATE >> $FILE
fi

echo >> $FILE
echo '----' >> $FILE
echo >> $FILE
echo $TIME' - '$1 >> $FILE
