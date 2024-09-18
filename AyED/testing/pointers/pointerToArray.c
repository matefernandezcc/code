#include <stdio.h>

int main(){
    int array[10] = {1,2,3,4,5,6,7,8,9,10};

    int *p = &array[0];
    
    // Apunto el puntero al inicio del array
    printf("Address %p has the value %d\n", p, *p);


    // Manejando la memoria y sumando bytes puedo llegar a la siguiente posicion de mi array solo manipulando el puntero
    int bytes = 9;
    p += bytes;
    printf("Address shifted %d bytes %p has the value %d\n\n", bytes, p, *p);


    // Voy a recorrer el array solo usando mi puntero indice
    int *indice = array;

    int i = 0;
    for(i; i<10; i++){
        printf("Array[%d] in address %p has the value %d\n", i, indice, *indice);
        indice +=1;
    }

    return 0;
}