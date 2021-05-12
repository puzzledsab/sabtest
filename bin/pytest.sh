#!/bin/sh
# Takes names of tests as parameter
cd "`dirname $0`"
cd ..
echo Reading dirconfig
. ./dirconfig || (echo Bad dirconfig; exit 1)
echo Read dirconfig
rm $QUEUEFILE
rm -rf $INCOMPLETE/test/
cd tests
for a in "$@"; do
  echo Testing $a
  pwd
  rm -rf $COMPLETE/sabtest/test*
  cp -r "$a"/* ../../sabnzbd/ || (echo Could not copy $a to sabnzbd dir; exit 1)
  sleep 5
  pwd
  echo ../bin/timetest.sh ../test.nzb.gz ../sabtest/results/"$a" || exit 1
  ../bin/timetest.sh ../test.nzb.gz ../sabtest/results/"$a" || exit 1
done
