package A;

our $plug      = undef;
our $inheriter = undef;

sub import {
    ( $pkg, $plug ) = @_;
    print join( '|', @_ ) . "\n";

    #my $pkg = shift;
    #$plug = shift // undef;
    print "pkg  = " . $pkg . "\n";
    print "plug = " . $plug . "\n";

    my $suffix = '';
    $suffix = '::' . $plug if $plug;

    my $module = 'B' . $suffix;
    print "module = " . $module . "\n";

    $inheriter = caller(0);
    print "inheriter = " . $inheriter . "\n";

    $code = "package $inheriter; use $module; ";
    eval $code;
    die $@ if $@;
}

sub blah {
    print "A, blah\n";
}

1;

