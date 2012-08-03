#!/usr/bin/env perl

use 5.010;

my @numbers = qw/0 1 2 3 4 5 6 7 8 9/;

my @result = map { $_ > 4 ? 2 * $_ : 0 * $_ } @numbers;

$, = ' ';
say 'numbers =', @numbers;
say 'result  =', @result;
