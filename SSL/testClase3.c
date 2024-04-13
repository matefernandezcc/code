#include <stdio.h>

int main(){
    int precios[4] = {200,120,20,300};
    printf("Valor de la primera pos %d \n", precios[0]);

    int a[20];

    int index;
    for(index = 0; index < 20; index++){
        a[index] = 33;
    }

    printf("Valor de la primera pos %d \n", precios[0]);

    return 0;
}