#!/usr/bin/env perl

use 5.010;
use Net::LDAP::LDIF;

my $ldif = Net::LDAP::LDIF->new( 'single-entry.ldif', 'r', onerror => 'undef' );
my $entry = $ldif->read_entry();
die $ldif->error if $ldif->error;

$entry->dump;
say '-' x 70;

use Data::Dumper;
use Net::LDAP::Filter;
use Net::LDAP::FilterMatch;

sub search {
	my $f = shift;

	my $filter = Net::LDAP::Filter->new( $f );
	unless( $filter ) {
		say STDERR 'Cannot build filter: '.Net::LDAP::Filter::errstr();
		return;
	}
	my $match = $filter->match($entry);
	print $match ? '   Match' : 'NO Match';
	say sprintf( ' [ %60s ]', $f );
	print STDERR Dumper($filter) unless $match;
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
search( 'cn:dn:=Alexei Znamensky' );
search( 'cn:dn:=*Znamensky' );
search( 'cn:dn:=*' );
