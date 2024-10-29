%{

#include <stdio.h>
#include <stdlib.h>

/* Esto evita warnings al compilar */ 
extern int yylex(void);
extern int yyleng;
extern char *yytext;
void yyerror(const char* s);

/* Rutinas Semánticas */ 
void procesarID(int longitud);
void procesarOP(char op);

%}

/* Esto evita warnings al compilar */ 
%union {
    char* operacion;
    int numero;
}

%token <operacion> ID
%token <numero> NUMERO
%token INICIO FIN LEER ESCRIBIR ASIGNACION SUMA RESTA COMA PUNTOCOMA ParentesisIZQ ParentesisDER ERROR 

%start objetivo

%% 

objetivo: programa
;
programa: INICIO listaSentencias FIN
;
listaSentencias: sentencia listaSentencias
                | /* epsilon */
;
sentencia: identificador ASIGNACION expresion PUNTOCOMA
          | LEER ParentesisIZQ listaIdentificadores ParentesisDER PUNTOCOMA
          | ESCRIBIR ParentesisIZQ listaExpresiones ParentesisDER PUNTOCOMA
;
listaIdentificadores: identificador
                     | identificador COMA listaIdentificadores
;
listaExpresiones: expresion
                | expresion COMA listaExpresiones
;
expresion: primaria operadorAditivo expresion
          | primaria
;
primaria: identificador
         | NUMERO { printf("Leído Identificador: %d \n", atoi(yytext)); }
         | ParentesisIZQ expresion ParentesisDER
;
operadorAditivo: SUMA { procesarOP('+'); }
                | RESTA { procesarOP('-'); }
;
identificador: ID { procesarID(yyleng); }
;

%% 

///////////// Fuente sin errores /////////////
int main(int argc, char* argv[]){
    yyparse() == 0 ? printf("\nCódigo fuente sin errores\n") : 0;
    return 0;
}

///////////// Manejo de errores /////////////
void yyerror(const char* s) {
    fprintf(stderr, "Error sintáctico: %s\n", s);
}

///////////// Rutinas semánticas /////////////
void procesarID(int longitud) {
    if(longitud > 32) {
        printf("Error Semántico: el identificador no puede tener más de 32 caracteres\n");
        exit(1);
    }
}

void procesarOP(char op) {
    if (op == '+') {
        printf("Procesando operación: suma.\n");
    } else if (op == '-') {
        printf("Procesando operación: resta.\n");
    }
}
