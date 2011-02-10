#!/usr/bin/perl

use 5.010;
use integer;
#use List::Util qw/reduce/;

@v = map { int(rand(100)) } 1 .. 20;

$, = ', ';
say @v;

say '$a undefined' unless defined $a;
say '$b undefined' unless defined $b;

say 'SORTED with { $a <=> $b }';
@s = sort { $a <=> $b } @v;
say @s;

say '$a undefined' unless defined $a;
say '$b undefined' unless defined $b;

