#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){

    FILE* archivo;
    archivo = fopen("archivo.txt","r+t");

    // // Escribe el caracter a en el archivo
    // fputc('h', archivo);
    // fputc('o', archivo);
    // fputc('l', archivo);
    // fputc('a', archivo);

    // // Lee un caracter del archivo
    //char a = fgetc(archivo);

    // printf("El caracter leido fue: %c\n",a);

    // Ir leyendo desde la consola y voy escribiendolo en el archivo
    int caracter, otra;
    while((otra = fgetc(archivo)) != EOF){
        printf("%c",otra);
    }
    
    while((caracter = getchar()) != '\n'){
        fputc(caracter, archivo);
    }


    fclose(archivo);

    return 0;
}