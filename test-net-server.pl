#!/usr/bin/env perl -w
package MyPackage;

use Carp;
use Net::Server;
use base 'Net::Server';
use Data::Dumper;

my $_add_option = sub {
    my ( $prop, $template, $opt, $initial ) = @_;

    $prop->{$opt}     = $initial;
    $template->{$opt} = \$prop->{$opt};
};

sub options {
    my ( $self, $template ) = @_;
    my $prop = $self->{server};

    $self->SUPER::options($template);
    $_add_option->( $prop, $template, 'data', undef );
}

sub post_configure_hook {
    my $self = shift;
    my $prop = $self->{server};

    carp q{Configuration has no "data" file!}
      unless exists $prop->{data};
    carp qq|Cannot read data file "$prop->{data}"|
      unless -r $prop->{data};
}

sub process_request {
    my $self = shift;

    while (<STDIN>) {
        s/\r?\n$//;
        print qq|You said '$_'\r\n|;    # basic echo
        print STDERR Dumper($self) if /dump/i;
        exit if /quit/i;
    }
}

my $s = MyPackage->new( port => 16000 );
$s->run( data => 'yabadabadoo' );

# passing a custom option on the constructor doesnt seem to work
#my $s = MyPackage->new( port => 16000, data => 'yabadabadoo' );
#$s->run();

# however, if the custom option is a config file passed on the constructor
# that's OK
#MyPackage->run( port => 16000, conf_file => '/tmp/xxx' );

