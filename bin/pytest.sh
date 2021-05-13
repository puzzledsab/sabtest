#!/bin/sh
# Takes names of tests as parameter
cd "`dirname $0`"
cd ..
. ./dirconfig || (echo Bad dirconfig; exit 1)
rm $QUEUEFILE
rm -rf $INCOMPLETE/test/
cd tests
for a in "$@"; do
  echo Testing $a
  rm -rf $COMPLETE/sabtest/test*
  cp -r "$a"/* ../../sabnzbd/ || (echo Could not copy $a to sabnzbd dir; exit 1)
  sleep 5
  ../bin/timetest.sh ../test.nzb.gz ../sabtest/results/"$a" || exit 1
done
