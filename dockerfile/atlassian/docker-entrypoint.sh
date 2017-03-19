#! /bin/bash

CMD1="/etc/init.d/confluence start"
CMD2="/etc/init.d/jira start"
PROGRAM="java"

while true ; do
    PRO_NOW=`ps aux | grep $PROGRAM | grep -v grep | wc -l`

    if [ $PRO_NOW -lt 1 ]; then
        $CMD1 2>/dev/null 1>&2 &
        $CMD2 2>/dev/null 1>&2 &
        echo "start..." 
    fi

    sleep 10
done

exit 0