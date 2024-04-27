#include <stdio.h>
#include <stdlib.h>

typedef struct{
    int a;
    int b;
}rg;

int main(int argc, char* argv[]){

    FILE* archivo;
    archivo = fopen("bloques.bin","r+b");

    // Declaro una variable de tipo rg
    rg registro;
    registro.a = 20;
    registro.b = 130;

    fwrite(&registro, sizeof(rg), 1,archivo);

    // Muevo el puntero al inicio y leo desde ahi
    fseek(archivo,0,SEEK_SET);
    fread(&registro,sizeof(rg), 1,archivo);

    printf("%d\n", registro.a);
    fclose(archivo);

    return 0;
}