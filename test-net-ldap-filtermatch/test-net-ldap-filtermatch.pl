#!/usr/bin/env perl

use 5.010;
use Net::LDAP::LDIF;

my $ldif = Net::LDAP::LDIF->new( 'single-entry.ldif', 'r', onerror => 'undef' );
my $entry = $ldif->read_entry();
die $ldif->error if $ldif->error;

$entry->dump;
say '-' x 70;

use Net::LDAP::Filter;
use Net::LDAP::FilterMatch;

sub search {
	my $f = shift;

	my $filter = Net::LDAP::Filter->new( $f );
	unless( $filter ) {
		say STDERR Net::LDAP::Filter::errstr();
		return;
	}
	print $filter->match($entry) ? '   Match' : 'NO Match';
	say sprintf( ' [ %60s ]', $f );
}

search( '(cn=Alexei Znamensky)' );
search( 'cn=Alexei Znamensky' );
search( '(distinguishedName=CN=Alexei Znamensky,OU=SnakeOil)' );
search( 'distinguishedName=CN=Alexei Znamensky,OU=SnakeOil' );
search( 'distinguishedName=*' );
search( '(dn=CN=Alexei Znamensky)');
search( '(dn:CN=Alexei Znamensky)');
search( '(dn=*)');
search( ':dn=*');
