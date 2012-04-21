#!/usr/bin/perl

use 5.010;
use URI;

$base =
'http://www.portaltransparencia.gov.br/convenios/ConveniosListaGeral.asp?Ordem=-1';
$link = 'DetalhaConvenio.asp?TipoConsulta=5&CodConvenio=900154';

$result =
'http://www.portaltransparencia.gov.br/convenios/DetalhaConvenio.asp?TipoConsulta=5&CodConvenio=900154';

my $uri = URI->new_abs( $link, $base );

say 'uri = ' . $uri->as_string;
