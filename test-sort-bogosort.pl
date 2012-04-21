#!/usr/bin/perl

use Data::Dumper;
use List::Util qw/shuffle/;
use Benchmark;

sub make_random {
    my $n = shift;
    my $top =
      int( rand(5) ) +
      $n * int( 2 + rand(17) );    # using prime numbers make me look good
    my @a = ();

    my $i = $n;
    while ( $i-- ) {
        push @a, int( rand($top) );
    }
    return \@a;
}

sub is_ordered {
    my $a = shift;
    for ( my $i = 1 ; $i < @{$a} ; $i++ ) {
        return 0 if ( $a->[ $i - 1 ] > $a->[$i] );
    }
    return 1;
}

sub bogosort {
    my $array = shift;
    my @a     = @{$array};

    while ( !is_ordered( \@a ) ) {
        @a = shuffle(@a);
    }
    return [@a];
}

sub a_fmt {
    my @a = ref( $_[0] ) eq 'ARRAY' ? @{ $_[0] } : @_;

    return '[ ' . join( q{, }, @a ) . " ]\n";
}

my $numelem = shift || die q{usage: test-sort-bogosort.pl <num_elem> [times]};
my $times   = shift || 1;

timethis(
    $times,
    sub {
        my $randomlist = make_random($numelem);
        my $result     = bogosort($randomlist);

        #print a_fmt($result);
    }
);

