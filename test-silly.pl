#!/usr/bin/perl

use 5.010;

$empty = '';
$undef = undef;

say 'empty' if $empty;
say 'defined empty' if defined $empty;
say 'undef' if $undef;
say 'defined undef' if defined $undef;
