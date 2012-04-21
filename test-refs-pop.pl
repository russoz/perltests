#!/usr/bin/perl

use Data::Dumper;

$r = [qw/aa bb cc dd ee/];

print 'ref (before) = ' . Dumper($r);

@a = @{$r};
print 'array (before) = ' . Dumper(@a);

pop @a;
print 'array (after) = ' . Dumper(@a);

print 'ref (before) = ' . Dumper($r);
