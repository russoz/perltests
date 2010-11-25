#!/usr/bin/perl

use 5.010;
use Data::Dumper;

$ref = [ 1, 3, 5, 7, 'a', 'yabadabadoo', ];

say Data::Dumper->Dump( [$ref], ['ref'], );

push @{$ref}, 'blabla';

say depois => undef;
say Data::Dumper->Dump( [$ref], ['ref'], );
