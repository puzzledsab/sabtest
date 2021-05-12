#!/bin/sh
cd "`dirname $0`"
cd tests
../bin/pytest.sh `echo *`
cd ../results
../bin/parsepytest.pl *
