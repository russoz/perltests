#!/usr/bin/perl

use 5.010;
use IPC::Run qw(run timeout start pump finish);

my @cat =  qw( cat );

say '=' x 70;
