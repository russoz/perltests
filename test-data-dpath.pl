#!/usr/bin/env perl

use 5.010;
use Data::Printer colored => 0;

use Data::DPath qw/dpath dpathr/;

my $data = {
    aList => [qw/aa bb cc dd ee ff gg hh ii jj/],
    aHash => {
        apple  => 'pie',
        banana => 'split',
        potato => [qw(baked chips fries fish&chips mashed)],
    },
};

sub pick {
    my ( $caption, $dpath ) = @_;
    say '::: ' . $caption;
    my @res = dpath($dpath)->match($data);
    p @res;
}

# so
say 'we all';
p $data;

############################################################################

pick( 'list',         '/aList' );
pick( 'list element', '/aList/*[2]' );

pick( 'all 4th elements of all lists', '//*[3]' );

say '::: tweaking list element';
my @elem = dpathr('/aList/*[2]')->match($data);
say @elem;
${ $elem[0] } = 'WAKAWAKAWAKA';
p @elem;
pick( 'list after tweaking', '/aList' );

############################################################################

pick( 'hash', '/aHash' );
say 'hash address: ' . $data->{aHash};
pick( q{elements with letter 'i'}, '//*[ value =~ /i/ ]' );
pick( q{elements with letter 'f'}, '//*[ value =~ /f/ ]' );
