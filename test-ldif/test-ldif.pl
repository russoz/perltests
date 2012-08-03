#!/usr/bin/env perl

use 5.010;
use strict;
use warnings;

use Net::LDAP::LDIF;
use Data::Dumper;

my $file = shift;
my $ldif = Net::LDAP::LDIF->new($file);

while ( not $ldif->eof() ) {
    my $entry = $ldif->read_entry();
    if ( $ldif->error() ) {
        print STDERR "Error msg: ",    $ldif->error(),       "\n";
        print STDERR "Error lines:\n", $ldif->error_lines(), "\n";
        next;
    }
    say Dumper($entry);
}
$ldif->done();

