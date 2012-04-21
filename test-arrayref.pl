#!/usr/bin/perl

use 5.010;
use Data::Printer colored => 0;

$ref = [ 1, 3, 5, 7, 'a', 'yabadabadoo', ];

say antes => p $ref;

push @{$ref}, 'blabla';

say depois => p $ref;

#############################################################################
say '--->8---' x 9;

$ref = [qw/a b c d e/];

p $ref;
p $ref->[0];
p $ref->[ 1, 2 ];
p $ref->[ 1 ... 2 ];
say 'deref+index first ', p ${$ref}[0];
say 'deref+index last ',  p ${$ref}[-1];
say 'deref+indices-comma ', ( ${$ref}[ 0, 1 ] );
say 'deref+indices-ellip ', ( ${$ref}[ 0 ... 3 ] );
