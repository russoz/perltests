#!/usr/bin/perl

package A;

use Moose;
use Moose::Util::TypeConstraints 1.01;

subtype 'StrArray' => as 'ArrayRef[Str]';
coerce 'StrArray' => from 'ArrayRef[Any]' => via {
    my @list = @{$_};
    return [ map { return 'xa ' x $_ } @list ];
};

has 'words' => (
    is       => 'ro',
    isa      => 'StrArray',
    required => 1,
    coerce   => 1,
);

__PACKAGE__->meta->make_immutable;
no Moose::Util::TypeConstraints;
no Moose;

package main;

use Data::Dumper;

eval {
    my $a = A->new( words => [ 'abcdef', [3], 'babalu' ] );
    print Dumper( $a->words );
};
print $@;
print "\n";

