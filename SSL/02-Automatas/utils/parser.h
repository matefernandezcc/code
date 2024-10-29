#ifndef PARSER_H
#define PARSER_H

#include <ctype.h>

// Parser
const char* input;
char current_char;

int parse_expression();
int parse_term();
int parse_factor();

// Descent Partser
int gettok(const char **p, int *vp);
int evalexpr(const char **p);
void ungettok(int op, const char **p);
void contadorConstante(int estado_actual, int *dec, int *oct, int *hex, int *aceptados);
void automata(const char *cadena, int *posActual, int *estado_actual);

#endif // PARSER_H