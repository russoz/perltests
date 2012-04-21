#!/usr/bin/perl

use 5.010;

our $trick = sub { say 'ss = ' . $ss; say 'tt = ' . $tt; };

sub do_trick {
    my ( $ss, $tt ) = @_;

    $trick->();
}

sub better_trick {

    #    my ($ss, $tt) = @_;
    #
    #    no strict 'refs';
    #
    use vars qw($ss $tt);

    #    my $caller = caller;
    #
    #    local(*{$caller.'::ss'}) = \$ss;
    #    local(*{$caller.'::tt'}) = \$tt;
    #
    #    $trick->();
}

$ss = 'yo dawg';
$tt = 'wassup?';
do_trick;

use strict;
use warnings;

$trick = sub { say 'strict ss = ' . $ss; say 'strict tt = ' . $tt; };
$ss    = 'strict';
$tt    = 'and tight here';
do_trick;

# works because of the 'use vars' clause :-o)

