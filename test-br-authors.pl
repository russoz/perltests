#!/usr/bin/env perl

use 5.010;
use Data::Dumper;
use Acme::CPANAuthors;
use Acme::CPANAuthors::Brazilian;

my $authors = Acme::CPANAuthors->new('Brazilian');

my $number   = $authors->count;
my @ids      = $authors->id;
my @distros  = $authors->distributions('RUSSOZ');
my $url      = $authors->avatar_url('RUSSOZ');
my $kwalitee = $authors->kwalitee('RUSSOZ');

say $numbers;
say Dumper(@ids);
say Dumper(@distros);
say $url;
say Dumper($kwalitee);

