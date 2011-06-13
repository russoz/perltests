#!/usr/bin/perl

use Data::Dumper;

@a = qw/a b c d e f g h i j/;

print 'a: ' .Dumper(\@a);
print 'a[0]: '.Dumper($a[0]);
print 'a[7,8,9]: '. Dumper(@a[7, 8, 9]);
