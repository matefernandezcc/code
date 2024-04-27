#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){

    FILE* archivo;
    archivo = fopen("archivo.txt","r+t");

    // Creo un buffer que voy a guardar en el archivo
    char buffer[10] = "123456789";
    char buffer_lectura[10];

    // Escribe todo el contenido de buffer en el archivo
    fputs(buffer, archivo);
    fclose(archivo);


    // ============== Vuelvo a abrir el archivo para asegurar su funcionamiento ==============
    archivo = fopen("archivo.txt","r+t");
    printf("%s\n",fgets(buffer_lectura, 4+1,archivo));
    fclose(archivo);

    return 0;
}