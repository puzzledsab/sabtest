# sabtest
System for testing performance in SABnzbd code changes

Usage:
- Clone to the same directory as sabnzbd is cloned to.
- Edit paths in dirconfig
- Make a category in SABnzbd with the path sabtest
- Copy the nzb you want to use for testing to sabtest/test.nzb.gz
- Make sure the queue is empty
- Create a test by making a subdirectory in tests/, then copy the changed file(s) to the same subdirectory as in SABnzbd (for instance tests/[testname]/sabnzbd/downloader.py).
- Tests can also be run individually, see script source...

Warning:
- sabnzbd/notifier.py will be overwritten
- The queue file will be deleted

Run using
./testall.sh

