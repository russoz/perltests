#!/usr/bin/env perl

$i = 0;

while ( $i++ < 20 ) {
    next if $i > 10;
    print 'hello ' . $i . "\n";
}
continue {
    print "dubidubida $i\n";
}

