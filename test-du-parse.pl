#!/usr/bin/perl

#
# usage:
#   du -ks * | sort -rn | ./test-du-parse.pl
#

while (<>) {
    if (/^(\d+)\s+(\S+)\s*$/) {
        #print $2 . q{ => } . $1 . "\n";
        $u->{$2} = $1;
        push @order, $2;
        $t += $1;
    }
}
foreach my $k (@order) {
    printf qq{%8d %5.2f %s\n}, $u->{$k}, 100 * $u->{$k} / $t, $k;
}
