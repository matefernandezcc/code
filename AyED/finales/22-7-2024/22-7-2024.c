#include <stdio.h>
#include <stddef.h>

typedef struct {
    int id;
    char nombre[51];
}t_evaluador;

typedef struct {
    char res1[41];
    char res2[41];
    char res3[41];
}t_resultado;

typedef struct {
    char titulo[51];
    int cat[4];
    char correo_resp[51];
    t_id_evaluadores id_evaluadores;
    t_resultado resultado;
}t_trabajo;


// Es solo para un dia
void presentacion(){


}

void derivacion(){


}

int main(int argc, char* argv[]){

    return 0;
}