#!/usr/bin/perl

use 5.010;

use common::sense;
use Data::Dumper;
use Net::SSH::Perl;
use Math::BigInt::GMP;

use Scalar::Util qw{blessed reftype openhandle};

$| = 1;

my $ssh = Net::SSH::Perl->new(
    'localhost',
    protocol => 2,

    #debug       => 2,
    #use_pty     => 1,
    #compression => 0,
);

$ssh->login('az');

#print 'TEST-1:: ' . Data::Dumper->Dump( [$ssh], ['ssh'] );

my ( $out, $err, $exit ) = $ssh->cmd('/bin/ls -l /home/az');

# HOLY CANOLE!!
# $out is NOT a filehandle, it is the literal output
print $out;

#print while <$out>;

say "out is openhandle" if openhandle($out);
say "err is openhandle" if openhandle($err);
say 'exit = ' . $exit;

#print 'TEST-2:: ' . Data::Dumper->Dump( [$ssh], ['ssh'] );

