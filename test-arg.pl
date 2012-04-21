#!/usr/bin/perl

use 5.010;

package A;

sub makesub {
    my $sub = shift;

    return sub {
        my $arg = shift;
        local $_ = $arg;
        $sub->();
    };
}

package main;

say A::makesub( sub { $_ } )->('abcdefghij');
say A::makesub( sub { uc } )->('abcdefghij');
say A::makesub( sub { scalar reverse } )->('abcdefghij');

