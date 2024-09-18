#include <stdio.h>
int len(int* i){
    return (sizeof(i)/sizeof(*i));
}

int main(){

    // Cada int es de 4 bytes y son 10 deberia ocupar 40 bytes en memoria
    int arr[10] = {0};
    int tamanio = len(arr);

    printf("El tamaño total del array es %ld\nTiene %d elementos\n", sizeof(arr), tamanio);

    return 0;
}
