#include "structs.h"

void leerArchivo(const char* nombreArchivo, char* buffer, size_t tamBuffer) {
    FILE* f = fopen(nombreArchivo, "r");
    if (f == NULL) {
        perror("Error al abrir el archivo");
        exit(EXIT_FAILURE);
    }

    int i, ch;

    // Leo mientras no me pase del buffer o el caracter leido no sea ni EOF ni \n
    for (i = 0; (i < (tamBuffer - 1) && ((ch = fgetc(f)) != EOF) && (ch != '\n')); i++)
        buffer[i] = ch;
    buffer[i] = '\0'; // Agrego el fin de cadena al final del buffer

    if (fclose(f)) {
        perror("fclose error");
        exit(EXIT_FAILURE);
    }
}

void mostrarTok(char* cadena, int i){
    printf("Leido: ");
    while (i<cantHastaTok(cadena, i)){
        printf("%c", cadena[i]);
        i++;
    }
}

int cantHastaTok(char* cadena, int i){
    while(cadena[i] != '\0' && cadena[i]!='#'){
        i++;
    }
    return i;
}
