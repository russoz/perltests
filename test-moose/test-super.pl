#!/usr/bin/env perl

use 5.010;

package A;

use Moose;
has attr => ( is => 'rw', isa => 'Str', );
sub thereis { say 'A::thereis'; return shift; }

package B;

use Moose;
extends 'A';
has sky => ( is => 'rw', isa => 'Str', );

sub another {
    my $me = shift;
    A::thereis($me);
    say 'B::another ' . @_;
    return $me;
}

package main;

my $a = A->new;
$a->thereis();
say $a->attr('blablabla');

my $b = B->new;
$b->thereis->another->sky('walker');
say $b->attr('blobloblo');
say $b->sky;
