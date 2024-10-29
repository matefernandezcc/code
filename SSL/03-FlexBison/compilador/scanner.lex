%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
%}

%option noyywrap

letras [a-zA-Z]
numero [0-9]

%% 

[ \t\n]                 ; /* Ignorar espacios en blanco y nuevas lineas */
"inicio"                { /*printf("INICIO\n");*/ return INICIO; }
"fin"                   { /*printf("FIN\n");*/ return FIN; }
"leer"                  { /*printf("LEER\n");*/ return LEER; }
"escribir"              { /*printf("ESCRIBIR\n");*/ return ESCRIBIR; }
{letras}[a-zA-Z0-9]*    { /*printf("ID\n");*/ return ID; }
{numero}+               { /*printf("NUMERO\n");*/ yylval.numero=atoi(yytext); return NUMERO; }
":="                    { /*printf("ASIGNACION\n");*/ return ASIGNACION; }
"+"                     { /*printf("SUMA\n");*/ return SUMA; }
"-"                     { /*printf("RESTA\n");*/ return RESTA; }
","                     { /*printf("COMA\n");*/ return COMA; }
";"                     { /*printf("PUNTOCOMA\n");*/ return PUNTOCOMA; }
"("                     { /*printf("ParentesisIZQ\n");*/ return ParentesisIZQ; }
")"                     { /*printf("ParentesisDER\n");*/ return ParentesisDER; }
.                       { printf("Error léxico: caracter inesperado %s\n", yytext); exit(1); }

%%
