#!/usr/bin/perl

use strict;
use warnings;
use Net::LDAP::Entry;

my $e = Net::LDAP::Entry->new;
$e->dn('cn=root');
$e->add(
    cn  => 'jose',
    uid => 'joselito',
);

sub check {
    my ( $ee, $sub ) = @_;

    my $test = $sub->($ee);
    print "check test = " . $test . "\n";
    return $test;
}

print "OK eq\n"
  if check( $e, sub { $a = shift; $a->get_value('cn') eq 'jose' } );

print "NOK eq\n"
  if check( $e, sub { $a = shift; $a->get_value('cn') eq 'juca' } );

print "OK m//\n"
  if check( $e, sub { $a = shift; $a->get_value('uid') =~ m/ELI/i } );

print "NOK m//\n"
  if check( $e, sub { $a = shift; $a->get_value('uid') =~ m/ELIta/i } );

print "OK m//\n"
  if check( $e, sub { $a = shift; $a->get_value('uid') !~ m/ELIta/i } );

