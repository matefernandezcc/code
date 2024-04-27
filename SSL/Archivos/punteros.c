#include <stdio.h>
#include <stdlib.h>

void swap(int* a, int* b){
    *a = *a + *b;
    *b = *a - *b;
    *a = *a - *b;
}

int main(int argc, char* argv[]){

    int a=1;
    int b=2;
    printf("a: %d\nb: %d\n\n", a,b);

    // Intercambiadas
    swap(&a,&b);
    printf("a: %d\nb: %d\n", a,b);

    //printf("Argumento es: %s\n", argv[1]);

    return 0;
}