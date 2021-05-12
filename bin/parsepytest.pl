#!/usr/bin/perl
# 769.91user 255.76system 27:00.97elapsed 63%CPU (0avgtext+0avgdata 95420maxresident)k

my @files = @ARGV;
foreach my $file (@files) {
    @ARGV = ($file);
    my ($count, $user, $system);
    my $maxu = 0;
    my $minu = 99999;
    my $maxs = 0;
    my $mins = 99999;
    my $time = 0;
    while(<>) {
        if (/([\d.]+)user\s*([\d.]+)system (\d+):([\d.]+).*?(\d+)%CPU.*?(\d+)maxresident/) {
            $count++;
            $maxu = $1 if ($1 > $maxu);
            $minu = $1 if ($1 < $minu);
            $maxs = $2 if ($2 > $maxs);
            $mins = $2 if ($2 < $mins);
            $user += $1;
            $system += $2;
            $time += $3*60;
            $time += $4;
        }
    }
    printf("$file: %6.2f ($minu/$maxu) user %6.2f ($mins/$maxs) system %6.1f seconds $count rounds\n", ($user/$count), ($system / $count), ($time / $count));
}
