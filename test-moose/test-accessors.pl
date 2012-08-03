#!/usr/bin/env perl

use 5.010;
use Data::Dumper;

package A;

use Moose;

has intguy => ( is => 'rw', isa => 'Int' );
has strguy => ( is => 'rw', isa => 'Str' );

package main;

my $a = A->new;

$a->intguy('42');
$a->strguy(57);

print Dumper($a);

print $a->intguy(1984);
print "\n";

print Dumper($a);

