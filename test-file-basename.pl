#!/usr/bin/perl

use 5.010;
use File::Basename;

my $filename = '/some/where/over/the/rainbow/theres.a.place.txt';

say 'filename = '.$filename;
$, = ', ';
say 'no suffix -> ', fileparse($filename);
say 'suf (txt) -> ', fileparse($filename, qw/txt/);
say 'suf (zip) -> ', fileparse($filename, qw/zip/);
say 'suf (place txt) -> ', fileparse($filename, qw/place txt/);
say 'suf (place.txt) -> ', fileparse($filename, qw/place.txt/);

