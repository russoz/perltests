#!/usr/bin/perl

use 5.010;

sub somesub {
    say '=' x 40;
    for ( $i = 0 ; $i < $#_ ; $i++ ) {
        say '[' . $i . ']: ' . $_[$i];
    }
}

somesub(qw/a b c d e f g h i j k/);
somesub( 9, 8, 7, 6, 5 );
somesub( 'aaa', 'bbb', undef, 'ddd' );

