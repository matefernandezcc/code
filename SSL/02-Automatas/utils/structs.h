#ifndef STRUCTS_H
#define STRUCTS_H

#define MAX_LEN 256
#define MAX_TOKENS 50
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <readline/readline.h>
#include <readline/history.h>

void leerArchivo(const char* nombreArchivo, char* buffer, size_t tamBuffer);
void mostrarTok(char* cadena, int i);
int cantHastaTok(char* cadena, int index);

/*
// Estructura del estado del autómata
typedef struct Estados {
    int id;
    int esFinal; // 1 si es True, 0 False
    struct Transiciones* transiciones; // Lista de transiciones
    struct Estados* sgte;
} Estados;

// Estructura de la transición
typedef struct Transiciones {
    char caracter;
    Estados* sgte;
    struct Transiciones* sgte;
} Transiciones;

// Estructura del autómata
typedef struct Automata {
    Estados* sgte;
    Transiciones* sgte;
} Automata;
*/

#endif // STRUCTS_H
