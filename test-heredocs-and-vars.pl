#!/usr/bin/env perl

use 5.010;
use Data::Dumper;

sub mktext {
    my $spec = shift;
    print Data::Dumper->Dump( [$spec], ['spec'] );

    return <<"EOF";
The lazy $spec->{animal} jumped over the qq{spec->{thing}} and crashed
over the neat "$spec->{landingpad}".
EOF
}

say mktext( { animal => 'fox', thing => 'fence', landingpad => 'sofa' } );

