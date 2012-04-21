#!/usr/bin/perl

use 5.010;

use Data::Dumper;
use List::MoreUtils qw(part);

sub dmp {
    print Dumper( \@_ );
}

my @list = qw/aa bb cc dd ee ff gg hh ii jj/;

dmp(@list);

$i = 0;
dmp( part { $i++ % 2 } 1 .. 8 );

$i = 0;
dmp( part { $i++ % 3 } 0 .. $#list );

$i = 0;
dmp( part { $list[ $i++ % 3 ] } 0 .. $#list );

$i = 0;
dmp( part { $i % 3 } @list );
