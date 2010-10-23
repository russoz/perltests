#!/usr/bin/perl

use strict;
use warnings;
use feature 'switch';

#
# Original do Nilson
#
sub tag_generator {
    my ( $tag_name, $style ) = @_;
    given ($style) {
        when ('html') {
            return sub {
                my $content = shift // '';
                "<$tag_name>$content</$tag_name>";
              }
        }
        when ('xml') {
            return sub {
                my $content = shift // '';
                "<$tag_name"
                  . ( length $content ? ">$content</$tag_name>" : "/>" );
              }
        }
    }
}

my $tag_html = tag_generator( 'tag', 'html' );
my $tag_xml  = tag_generator( 'tag', 'xml' );

print 'invoking html-generated sub: ' . $tag_html->("") . "\n";
print 'invoking xml-generated sub : ' . $tag_xml->("") . "\n";

##############################################################################

#
# versao dispatch_table
#
my %dispatch_table = (
    'html' => sub {
        my $tag_name = shift;
        return sub {
            my $content = shift // '';
            "<$tag_name>$content</$tag_name>";
        };
    },
    'xml' => sub {
        my $tag_name = shift;
        return sub {
            my $content = shift // '';
            "<$tag_name" . ( length $content ? ">$content</$tag_name>" : "/>" );
        };
    },
);

sub dp_tag_generator {
    my ( $tag_name, $style ) = @_;
    return $dispatch_table{$style}->($tag_name);
}

$tag_html = dp_tag_generator( 'tag', 'html' );
$tag_xml  = dp_tag_generator( 'tag', 'xml' );

print 'invoking html-generated sub: ' . $tag_html->("") . "\n";
print 'invoking xml-generated sub : ' . $tag_xml->("") . "\n";

