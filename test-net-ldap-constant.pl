#!/usr/bin/env perl

use Carp;
use Data::Dumper;
use Scalar::Util qw{looks_like_number};

sub _make_result {
    my $code = shift;
    my $dn   = shift || '';
    my $msg  = shift || '';

    my $retcode =
      looks_like_number($code)
      ? $code
      : eval qq{
            use Net::LDAP::Constant qw|$code|;
            $code;
        };
    croak $@ if $@;
    return {
        matchedDN    => $dn,
        errorMessage => $msg,
        resultCode   => $retcode,
    };
}

$a = _make_result(qw/LDAP_INAPPROPRIATE_AUTH/);

print Dumper($a);
