#!/usr/bin/env perl

use 5.010;
use Data::Dumper;
use Scalar::Util qw/reftype blessed openhandle/;

#print qq/Digite o nome do arquivo: /;
#my $arquivo = <STDIN>;
#chomp $arquivo;
#unless ( $arquivo =~ /skip/i ) {

#open( FILE, $arquivo );

#while (<FILE>) {
#    print;
#}

#close(FILE);
#}

sub var {
    my $v = shift || return;
    my $d = '' . Dumper($v);
    return
        ' = ' 
      . $v
      . "\n\t==> reftype("
      . reftype($v)
      . ")\n\t==> dump("
      . chomp($d)
      . ")\n\t==> openhandle "
      . openhandle($v)
      . ", blessed "
      . $v;
}

my $h1 = STDOUT;
say 'h1' . var($h1);

my $h2 = *STDOUT;
say 'h2' . var($h2);
say $h2 'saying on h2';

my $h3 = *STDOUT{IO};
say 'h3' . var($h3);
say $h3 'saying on h3';
