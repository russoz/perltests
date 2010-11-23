#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $ref = { a => 1, b => 2, c => 3, };

my @list = ();

push @list, 'xyz';
push @list, $ref;
my %deref = %{$ref};
push @list, %{$ref};

print Dumper(@list);

$ref->{ddd} = 'I was added late';

print "hashref\n";
print Dumper($ref);

print "deref\n";
print Dumper(%deref);

print "list\n";
print Dumper(@list);

