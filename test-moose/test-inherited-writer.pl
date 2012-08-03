#!/usr/bin/env perl

use 5.010;
use Data::Dumper;

package A;

use Moose;

has 'bubbles' => (
    is      => 'ro',
    isa     => 'Int',
    default => 1,
);

__PACKAGE__->meta->make_immutable;
no Moose;

package B;

use Moose;
extends 'A';

has '+bubbles' => (
    default  => 3,
    init_arg => undef,
);

__PACKAGE__->meta->make_immutable;
no Moose;

package main;

my $aflat = A->new;
say q{aflat's: } . $aflat->bubbles;
print Dumper($aflat);

my $bflat = B->new;
say q{bflat's: } . $bflat->bubbles;
print Dumper($bflat);

my $b5 = B->new( bubbles => 5 );    # Ha! No exception popping!
say q{b5's: } . $b5->bubbles;
print Dumper($b5);                  # but bubbles is still 3

