#include <iostream>
#include <stdio.h>

struct t_id_evaluadores{
    int evaluador1[100];
    int evaluador2[100];
    int evaluador3[100];
}

struct t_resultado{
    char res1[41];
    char res2[41];
    char res3[41];
}

struct Trabajo{
    char titulo[51];
    int cat[5];
    char correo_resp[51];
    t_id_evaluadores id_evaluadores;
    t_resultado resultado;
}

int main(int argc, int** argv[]){

    // Abrimos el archivo con los trabajos presentados
    FILE* f = fopen("trabajos","rb+");

    fclose(f);

    return 0;
}