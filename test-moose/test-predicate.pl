#!/usr/bin/env perl

use 5.010;

package P;
use Moose;

has num => (
    is        => 'ro',
    isa       => 'Int',
    required  => 1,
    lazy      => 1,
    default   => 42,
    predicate => 'has_num',
);

package main;

use Data::Dumper;

my $p = P->new;

print 'before     = ' . Dumper($p);
say 'p->has_num = ' . $p->has_num;
say 'p->num     = ' . $p->num;
print 'after      = ' . Dumper($p);
