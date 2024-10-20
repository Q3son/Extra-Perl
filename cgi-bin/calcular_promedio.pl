#!/usr/bin/perl

use utf8;                             # Permite el uso de caracteres UTF-8
use strict;                          # Habilita restricciones de declaración
use warnings;                        # Activa advertencias sobre posibles errores
use CGI qw(:standard);               # Importa la biblioteca CGI
use URI::Escape;                     # Permite la codificación de URI
use List::Util qw(max min sum);      # Importa funciones de List::Util

print header('text/html; charset=UTF-8');
print start_html('Calcular Promedio');

my $q = CGI->new;
my $notas_str = $q->param('notas');
my @notas = split /,\s*/, $notas_str;

# Calcular la peor y la mejor nota
my $peor_nota = min(@notas);
my $mejor_nota = max(@notas);

# Crear un nuevo array de notas
my @nuevas_notas = map { $_ == $peor_nota ? () : ($_ == $mejor_nota ? $_ * 2 : $_) } @notas;

# Calcular el promedio
my $promedio = @nuevas_notas ? (sum(@nuevas_notas) / @nuevas_notas) : 0;

print "<h1>Promedio Calculado</h1>";
print "<p>Notas originales: $notas_str</p>";
print "<p>Notas ajustadas: @nuevas_notas</p>";
print "<p>Promedio: $promedio</p>";

print end_html;