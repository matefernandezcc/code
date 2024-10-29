#ifndef AUTOMATA_H
#define AUTOMATA_H

#define MAX_LEN 256
#define MAX_TOKENS 50
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stddef.h>

void automata(char* cadena, int* pos_inicial, int* estado_actual);
int transicion(int estado_actual, char c);
void contadorConstante(int estado_aceptacion, int* dec, int* oct, int* hex, int* aceptados);

#endif // AUTOMATA_H
