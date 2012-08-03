#!/usr/bin/env perl

use strict;
use warnings;

my $a = 10;
our $b = 20;

sub t {
    print "a = $a\n";
    print "b = $b\n";
}

print "out a = $a\n";
print "out b = $b\n";
t()

