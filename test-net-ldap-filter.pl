#!/usr/bin/env perl

use Net::LDAP::Filter;
use Data::Dumper;

sub dump_filter($) {
	my $s = shift;

	my $f = Net::LDAP::Filter->new($s);
	print Dumper($f);
}

dump_filter '(dn=*)';
dump_filter '(dn=aaa)';
