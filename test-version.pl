#!/usr/bin/perl

use 5.010;
use version;

die q{usage: test-version v1 v2 [ v3 [ v4 [ ... ] ] ]} unless scalar @ARGV > 1;

@ordered = sort { version->parse($a) <=> version->parse($b) } @ARGV;
map { say version->parse($_)->stringify } @ordered;
