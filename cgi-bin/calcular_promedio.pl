#!/usr/bin/perl
use utf8;                             # Permite el uso de caracteres UTF-8
use strict;                           # Habilita restricciones de declaración
use warnings;                         # Activa advertencias sobre posibles errores
use CGI qw(:standard);                # Importa la biblioteca CGI
use URI::Escape;                      # Permite la codificación de URI
use List::Util qw(min max);          # Importa min y max desde List::Util

# Crear un nuevo objeto CGI
my $cgi = CGI->new;

print $cgi->header();                 # Imprime la cabecera HTTP
print $cgi->start_html("Calcular Promedio");

# Recibe las notas como un string y lo convierte en un array
my $notas_param = $cgi->param('notas');
my @notas = split(/,\s*/, $notas_param); # Separa las notas en base a comas
my $min = min(@notas);                 # Encuentra la nota mínima
my $max = max(@notas);                 # Encuentra la nota máxima

# Reemplaza la nota mínima por la máxima en un nuevo array
my @nuevas_notas = map { $_ == $min ? $max : $_ } @notas;

# Calcula el promedio solo de las nuevas notas
my $suma = 0;
$suma += $_ for @nuevas_notas;       # Suma todas las nuevas notas
my $promedio = @nuevas_notas ? $suma / @nuevas_notas : 0; # Calcula el promedio

# Muestra el resultado
print $cgi->h1("Resultados del Cálculo");
print $cgi->p("Notas ingresadas: " . join(", ", @notas));
print $cgi->p("Notas cambiadas: " . join(", ", @nuevas_notas));
print $cgi->p("El promedio de las nuevas notas es: $promedio");

print $cgi->end_html();