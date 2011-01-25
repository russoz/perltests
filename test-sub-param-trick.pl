#!/usr/bin/perl

use 5.010;

my $trick = sub { say 'ss = '.$ss; say 'tt = '.$tt; };

sub do_trick {
    my ($ss, $tt) = @_;

    $trick->();
}

$ss = 'yo dawg';
$tt = 'wassup?';
do_trick
