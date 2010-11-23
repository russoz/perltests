#!/usr/bin/perl

use Data::Dumper;

my $ref = {
    a => 1,
    b => 2,
    c => 3,
    d => 4,
    e => 5,
    f => 6,
    g => 7,
};

my $hash = {};

#my %h2 = map { $hash->{$_} = $ref->{$_} } qw/b d f g/;
map { $hash->{$_} = $ref->{$_} } qw/b d f g/;

print Data::Dumper->Dump( [$ref],  ['ref'] );
print Data::Dumper->Dump( [$hash], ['hash'] );

#print Data::Dumper->Dump( [\%h2], ['h2'] );

@{$other}{qw/b d f g/} = @{$ref}{qw/b d f g/};
print Data::Dumper->Dump( [$other], ['other'] );
