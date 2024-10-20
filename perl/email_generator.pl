#!/usr/bin/perl

use utf8;                            # Permite el uso de caracteres UTF-8
use strict;                         # Habilita restricciones de declaración
use warnings;                       # Activa advertencias sobre posibles errores
use CGI qw(:standard);              # Importa la biblioteca CGI
use URI::Escape;                    # Permite la codificación de URI

# Crear un nuevo objeto CGI
my $cgi = CGI->new;

# Solicitar el nombre de usuario y el dominio
my $username = $cgi->param('username');
my $domain   = $cgi->param('domain');

# Verificar que se hayan proporcionado ambos parámetros
if (!defined $username || $username eq '' || !defined $domain || $domain eq '') {
    print $cgi->header('text/plain');
    print "Error: Nombre de usuario y dominio son obligatorios.\n";
    exit;
}

# Crear el correo electrónico usando concatenación sin el operador punto
my $email = $username . '@' . $domain; # Concatenación sin punto

# Imprimir el correo electrónico generado
print $cgi->header('text/plain');
print "$email\n";                       # Imprimir el correo electrónico