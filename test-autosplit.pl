#!/usr/bin/perl

#
# usage:
#   du -ks * | ./test-autosplit.pl
#

use 5.010;
use Data::Dumper;

$u = {};

while (<>) {
    if (/^(\d+)\s+(\S+)\s*$/) {
        $u->{$2} = $1;
    }
}

print Dumper($u);

