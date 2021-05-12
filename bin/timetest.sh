#!/bin/sh
. "`dirname $0`"/../dirconfig || exit 1
cp "$1" $INCOMING/sabtest/ || (echo Could not copy $1 to to $INCOMING/sabtest/; exit 1)
cd "`dirname $0`"
cd ..
cp notifier.py ../sabnzbd/sabnzbd/ || (echo Could not copy notifier.py to sabnzbd; exit 1)
cd ../sabnzbd/
time -a -o "$2" python3 -OO SABnzbd.py || exit 1
