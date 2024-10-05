%{
#include <stdio.h>
%}
%option noyywrap
letras [a-zA-Z]
%%
"inicio"                 printf("Reservada para INICIO\n");
"fin"                    printf("Reservada para FIN\n");
"leer"                   printf("Reservada para LEER\n");
"escribir"               printf("Reservada para ESCRIBIR\n");
{letras}[a-zA-Z0-9]*     printf("Palabra\n");
[0-9][0-9]*              printf("Numero\n");
":="                     printf("ASIGNACION\n");
"+"                      printf("SUMA\n");
"-"                      printf("RESTA\n");
","                      printf("COMA\n");
";"                      printf("PUNTOCOMA\n");
"("                      printf("ParentesisIZQ\n");
")"                      printf("ParentesisDER\n");
"."                      printf("NO RECONOCIDO\n");
%%
int main(){
    yylex();
    return 0;
}
