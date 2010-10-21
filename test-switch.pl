#!/usr/bin/perl
use warnings;
use strict;
use feature 'switch';

use Benchmark qw/cmpthese/;

sub work {
    my $p = shift;
    my $r = 0.0;

    #my $max = 1000 * 1000 * 1000 * 1000;
    my $max = 100;

    for( my $i = 0; $i < $max; $i++ ) {
        $r = $r + $i * rand $i;
        $r = $r ** $i;
    }
    return $p . ' => ' . $r;
}

our %table_dispatch_hash = (
    0 => sub { return "zero" },
    1 => sub { return "um" },
    2 => sub { return "dois" }
);

sub dispatch_hash {
    my $var;
    $var = $table_dispatch_hash{ int rand 3 }();
    return work($var);
}

our @table_dispatch_array =
  ( sub { return "zero" }, sub { return "um" }, sub { return "dois" } );

sub dispatch_array {
    my $var;
    $var = $table_dispatch_array[ int rand 3 ]();
    return work($var);
}

our %table_lookup_hash = (
    0 => "zero",
    1 => "um",
    2 => "dois"
);

sub lookup_hash {
    my $var;
    $var = $table_lookup_hash{ int rand 3 };
    return work($var);
}

our @table_lookup_array = ( "zero", "um", "dois" );

sub lookup_array {
    my $var;
    $var = $table_lookup_array[ int rand 3 ];
    return work($var);
}

sub switch {
    my $var;
    given ( int rand 3 ) {
        when (0) { $var = "zero" }
        when (1) { $var = "um" }
        when (2) { $var = "dois" }
    }
    return work($var);
}

cmpthese(
    -20,
    {
        lookup_hash    => \&lookup_hash,
        lookup_array   => \&lookup_array,
        dispatch_hash  => \&dispatch_hash,
        dispatch_array => \&dispatch_array,
        switch         => \&switch
    }
);
