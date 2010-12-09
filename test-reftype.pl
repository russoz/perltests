#!/usr/bin/perl

use 5.010;

package Pkg;

sub new {
    return bless( { key => 'value in Pkg key', }, shift );
}

package main;

use Data::Dumper;
use Scalar::Util qw/blessed reftype/;

sub show_reftype {
    my $param = shift;
    printf '%-15s|%-10s|%s', blessed($param), reftype($param), Dumper($param);
}

show_reftype(42);
show_reftype( 42, 5, 7, 9 );
show_reftype( [ 42, 5, 7, 9 ] );
show_reftype( { teste => '123', wakawaka => 'babalu', } );
show_reftype( sub { print "anon sub!!\n" } );
show_reftype( *STDIN{IO} );
show_reftype( Pkg->new );

