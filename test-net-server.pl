#!/usr/bin/perl -w 
package MyPackage;

use Net::Server;
use base 'Net::Server';

sub process_request {
    my $self = shift;
    while (<STDIN>) {
        s/\r?\n$//;
        print "You said '$_'\r\n";    # basic echo
        last if /quit/i;
    }
}

MyPackage->run( port => 16000 );

