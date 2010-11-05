#!/usr/bin/env perl

use DateTime::TimeZone;

my $tz = DateTime::TimeZone->new( name => 'local' );

print 'tz = '. $tz->name . "\n";
