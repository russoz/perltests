#!/usr/bin/perl

use 5.010;

package A;

use Moose;

has 'p' => (
  is => 'ro',
  isa => 'CodeRef',
  builder => '_p_build',
);

sub _p_build {
	say 'A p builder';
	return sub { say 'A p' };
}

package B;

use Moose;
extends 'A';

sub _p_build {
	say 'B p builder';
	return sub { say 'B p' };
}

package main;

say 'trying A';
my $a = A->new;
$a->p->();

say 'trying B';
my $b = B->new;
$b->p->();

