#!/usr/bin/env perl

use 5.010;

use DateTime;

sub showtz {
    local $ENV{TZ} = $_[0] if $_[0];
    my $now = DateTime->now->set_time_zone('local');

    say '-' x 40;
    say 'env.tz = ' . $ENV{TZ};
    say 'tz     = ' . $now->time_zone()->name;
    say 'time   = ' . $now->hms;
}

showtz;

showtz('America/Los_Angeles');
showtz('Europe/Paris');
showtz('US/Pacific');

showtz;
