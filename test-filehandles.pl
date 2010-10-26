#!/usr/bin/perl
print qq/Digite o nome do arquivo: /;
my $arquivo = <STDIN>;
chomp $arquivo;

open( FILE, $arquivo );

while (<FILE>) {
    print;
}

close(FILE);
