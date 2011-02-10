#!/usr/bin/perl

use 5.010;

use version;

$v1 = qv('1.2_01');
$v2 = qv('1.2');
say 'v1 < v2' if $v1 < @v2;
