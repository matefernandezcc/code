#include <stdio.h>

int main(){

    int x = 5; // The address of x is 0x7ffebbfffdcc but his value is 5
    void *p = &x; // using & operator before x we get his address instead of his value
    
    
    // To change the value in the address of x 0x7ffebbfffdcc use * operator
    int *y = (int*)p;
    printf("El puntero p apunta a la direccion: %p con el valor %d \n", p, *y);

    *y = 12;
    printf("El puntero p apunta a la direccion: %p con el valor %d \n", p, *y);
    

    return 0;
}