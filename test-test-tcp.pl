#!/usr/bin/env perl

use Test::TCP;
use IO::Pipe;
use Net::HTTPServer;

our $pipe = IO::Pipe->new();

test_tcp(
    server => sub {
        my $port = shift;
        $pipe->writer;

        print 'server: port = ' . $port . "\n";
        print 'server: pid = ' . $$ . "\n";
        sleep 5;

        my $server = Net::HTTPServer->new(
            port    => $port,
            docroot => undef,
            log     => 'STDOUT'
        );

        $server->Start();
        $server->Process(15);

        print $pipe "SERVER BLABLABLA\n";

        sleep 10;
        $server->Stop();
    },
    client => sub {
        my ( $port, $server_pid ) = @_;
        $pipe->reader;

        my $msg = <$pipe>;
        chomp $msg;

        print 'client: port = ' . $port . "\n";
        print 'client: pid = ' . $$ . "\n";
        print 'client: server sent msg (' . $msg . ")\n";

        waitpid( $server_pid, 0 );
        print "client: bailing out...\n";
    },
);

