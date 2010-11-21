#!/usr/bin/perl

package MyPkg;

use 5.010;
use Moose;

has 'flag' => ( is => 'ro', isa => 'Bool' );

package main;

my $obj = MyPkg->new( { flag => 1, } );

say 'flag = ' . $obj->flag;

