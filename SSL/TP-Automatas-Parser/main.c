#include "utils/structs.h"
#include "utils/automata.h"

int main(int argc, char** argv) {
    int dec = 0;
    int oct = 0;
    int hex = 0;
    int aceptados = 0;
    int rechazados = 0;

    //////////////////////////////////////// Ingreso de la cadena por un archivo ////////////////////////////////////////
    if (argc == 1) {

        //////////////////////////////// Lectura e inicialización de variables y archivo ////////////////////////////////
        char cadena[MAX_LEN + 1];
        char* leyendo = cadena;
        char* ultimaPos_leida = cadena;
        int estado_actual = 0;
        int posActual = 0;
        leerArchivo("cadena.txt", cadena, sizeof(cadena));

        printf("Cadena leida del archivo: %s\n\n", cadena);
        while(*(cadena + posActual) != '\0'){
            mostrarTok(cadena, posActual);
            printf(" -> ");

            automata(cadena, &posActual, &estado_actual);
            if(estado_actual == 2 || estado_actual == 1 || estado_actual == 4 || estado_actual == 5){
                contadorConstante(estado_actual, &dec, &oct, &hex, &aceptados);
                estado_actual = 0;
                printf("Aceptado\n");
            }
            else {
                rechazados++;
                estado_actual = 0;
                printf("No aceptado\n");
            }
        }
        printf("\nAceptados %d/%d\n%d decimales\n%d octales\n%d hexadecimales\n", aceptados, (dec+oct+hex+rechazados), dec, oct, hex);
        return EXIT_SUCCESS;
    }

    //////////////////////////////////////// Ingreso de la cadena por linea de comandos ////////////////////////////////////////
    else{
        char* cadena = argv[1];
        char* leyendo = cadena;
        char* ultimaPos_leida = cadena;
        int estado_actual = 0;
        int posActual = 0;

        printf("Cadena leida de argv[1]: %s\n\n", cadena);
        while(*(cadena+posActual) != '\0'){
            mostrarTok(cadena, posActual);
            printf(" -> ");

            automata(cadena, &posActual, &estado_actual);
            if(estado_actual == 2 || estado_actual == 1 || estado_actual == 4 || estado_actual == 5){
                contadorConstante(estado_actual, &dec, &oct, &hex, &aceptados);
                estado_actual = 0;
                printf("Aceptado\n");
            }
            else {
                rechazados++;
                estado_actual = 0;
                printf("No aceptado\n");
            }
        }
        printf("\nAceptados %d/%d\n%d decimales\n%d octales\n%d hexadecimales\n", aceptados, (dec+oct+hex+rechazados), dec, oct, hex);
        return EXIT_SUCCESS;
    }
    return EXIT_SUCCESS;
}

// Fuentes
// fgetc https://www.ibm.com/docs/es/i/7.5?topic=functions-fgetc-read-character
// strtok https://www.ibm.com/docs/es/i/7.5?topic=functions-strtok-tokenize-string