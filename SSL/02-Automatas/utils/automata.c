#include "automata.h"
#include <stdio.h>

//////////////////////////////////////// Automata ////////////////////////////////////////
int transicion(int estado_actual, char c){
    if(estado_actual == 0){
        switch (c){
        case '+':
        case '-':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            return 2;
        case '0':
            return 1;
        default:
            return -1;
        }
    }
    if(estado_actual == 1){ // Estado de aceptacion
        switch (c){
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
            return 5;
        case 'X':
        case 'x':
            return 3;
        case '\0':
            return estado_actual;
        default:
            return -1;
        }
    }
    if(estado_actual == 2){ // Estado de aceptacion
        switch (c){
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            return 2;
        case '\0':
            return estado_actual;
        default:
            return -1;
        }
    }
    if(estado_actual == 3){
        switch (c){
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
            return 4;
        default:
            return -1;
        }
    }
    if(estado_actual == 4){ // Estado de aceptacion
        switch (c){
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
            return 4;
        case '\0':
            return estado_actual;
        default:
            return -1;
        }
    }
    if(estado_actual == 5){ // Estado de aceptacion
        switch (c){
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
            return 5;
        case '\0':
            return estado_actual;
        default:
            return -1;
        }
    }
}

void contadorConstante(int estado_aceptacion, int* dec, int* oct, int* hex, int* aceptados){
    switch (estado_aceptacion){
    case 2:
        (*aceptados)++; 
        (*dec)++; 
        break;
    case 1:
    case 5:
        (*aceptados)++; 
        (*oct)++; 
        break;
    case 4:
        (*aceptados)++; 
        (*hex)++; 
        break;
    default:
        break;
    }
}

void automata(char* cadena, int* pos_inicial, int* estado_actual) {
    char* leyendo = cadena;
    
    int i = *pos_inicial;
    while(leyendo != NULL && *(leyendo+i) != '\0' && *(leyendo+i) != '#' && *(leyendo+i) != EOF){
        *estado_actual = transicion(*estado_actual, *(leyendo+i));
        (*pos_inicial)++;
        i++;
    }
    if(*(cadena+*(pos_inicial)) == '#'){
        (*pos_inicial)++; 
    }
}