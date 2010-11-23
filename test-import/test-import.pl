#!/usr/bin/perl

use lib '.';

#eval {
#use A qw/rrr/;
#A::blah();
#};
#warn $@ if $@;

print '=' x 40 . "\n";

#use B;
#B::blah();

use A 'Ta';
B::Ta::blah();
