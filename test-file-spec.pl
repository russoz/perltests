#!/usr/bin/perl

use 5.010;

sub mostra {
    my $os = shift;
    {
        eval qq{use File::Spec::$os; say $os . "\t"
          . File::Spec::$os->catfile( File::Spec::$os->rootdir(), 'tmp', 'grande',
            'abobora' );
          };

        # File::Spec::VMS is known to fail - if you really wanna see the error
        #   message, uncomment the line below
        #warn $@ if $@;
    }
}

foreach my $os qw{Unix Mac OS2 Win32 VMS Epoc Cygwin} {
    mostra($os);
}

