#!/usr/bin/perl

use utf8;                  # Para soportar caracteres UTF-8
use strict;               # Para detectar errores en tiempo de compilación
use warnings;             # Para mostrar advertencias
use CGI qw(:standard);    # Importar funciones estándar de CGI
use URI::Escape;          # Para manejar la codificación de URL

my $cgi = CGI->new;       # Crear objeto CGI

print $cgi->header('text/plain');  # Enviar cabecera de respuesta

# Formulario para ingresar datos
print $cgi->start_form(-method => 'POST', -action => 'email_generator.pl');
print $cgi->p('Nombre de Usuario:');
print $cgi->textfield('username');  
print $cgi->p('Dominio:');
print $cgi->textfield('domain');     
print $cgi->submit('Generar');       
print $cgi->end_form;                 

# Obtener y validar parámetros del formulario
my $username = $cgi->param('username');
my $domain = $cgi->param('domain');

if (defined $username && defined $domain) {
    my $email = $username . '@' . $domain;  # Concatenar para formar el correo
    print $cgi->p("Correo Electrónico: $email");  # Mostrar correo generado
}

print $cgi->end_html;  # Finalizar la respuesta HTML