#!/usr/bin/env perl

use 5.010;
use Data::Dumper;

package MyPkg;

use Moose;

has 'blubs' => (
    is       => 'rw',
    isa      => 'Int',
    required => 1,
);

has 'timestamp' => (
    is      => 'ro',
    isa     => 'DateTime',
    default => sub {
        use DateTime;
        return DateTime->now;
    },
    lazy => 1,
);

package main;

use DateTime;

say DateTime->now->set_time_zone('local');

my $a = MyPkg->new( { blubs => 3 } );

print Data::Dumper->Dump( [$a], ['a'] );
say '$a->blubs = ' . $a->blubs();

sleep(10);

say $a->timestamp->set_time_zone('local');

