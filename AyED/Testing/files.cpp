#include <iostream>
#include <stdio.h>

int main(){
    FILE* f = fopen("file.txt", "wt+");
    fputs("Hola",f);
    
    return 0;
}