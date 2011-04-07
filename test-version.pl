#!/usr/bin/perl

use 5.010;
use version;

@ordered = sort { version->parse($a) <=> version->parse($b) } @ARGV;
map { say version->parse($_)->stringify } @ordered;
