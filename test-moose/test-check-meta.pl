#!/usr/bin/env perl

use 5.010;

package ABC;

use Moose;

has a => (
    is  => 'ro',
    isa => 'Str',
);

package main;

say 'has meta' if ABC->meta;

use Data::Dumper;
print Dumper( ABC->meta );
