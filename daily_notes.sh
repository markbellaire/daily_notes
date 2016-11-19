#!/bin/bash

# This is the bash script version of "Daily Notes"
# The preferred alias to the script is "dn 'Whatever you want to note'"
#
# IMPORTANT: You must use single quotes.
# Ex: dn 'Note'

DIRECTORY=$HOME'/Dropbox/Daily Notes'
FILE="$DIRECTORY/"`date +%F`.md
TMP="/tmp/daily_note.txt"
NOTE=$1
DATE=`date +%B\ %d\,\ %Y`
TIME=`date +%r`
EDITOR_COMMAND='vim'

if [ "${NOTE}" == "" ]; then
    $EDITOR_COMMAND $TMP
fi

if [ ! -d "$DIRECTORY" ]; then
    mkdir -p "$DIRECTORY"
    echo $DIRECTORY
fi

if [ ! -e "${FILE}" ]; then
    echo 'Daily Notes for '$DATE >> "${FILE}"
fi

if [ ! -e $TMP ]; then
    echo >> ${FILE}
    echo "- $TIME -" >> "${FILE}"
    echo $NOTE >> "${FILE}"
else
    echo >> ${FILE}
    echo "- $TIME -" >> "${FILE}"
    cat $TMP >> "${FILE}"
    rm $TMP
fi
