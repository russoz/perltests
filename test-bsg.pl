#!/usr/bin/perl

sub so($)  { print 'so ' . $_[0] . "\n"; }
sub say($) { 'say ' . $_[0]; }
sub we($)  { 'we ' . $_[0]; }
*all = *{'all'};

so say we all;
