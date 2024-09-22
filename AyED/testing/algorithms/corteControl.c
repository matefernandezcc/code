#include <stdlib.h>
#include <stdio.h>

typedef struct {
    char* nombre;
    int legajo;
    int curso;
    int valor;
} Alumnos;

/**
 * @brief Se usa para obtener valores de elementos en un conjunto de un array AGRUPADO
 * 
 */ 
void valorPorCurso(Alumnos alumnos[], int cantAlumnos) {
    int suma;
    int i = 0;

    while (i < cantAlumnos) {
        int suma = alumnos[i].valor;
        i++;

        // Sumar los valores de los alumnos del mismo curso
        while (i < cantAlumnos && alumnos[i].curso == alumnos[i-1].curso) {
            suma += alumnos[i].valor;
            i++;
        }
        printf("La suma de valor en el curso %d es de -> %d\n", alumnos[i-1].curso, suma);
    }
    return;
}

void datosEjemplo(Alumnos* a1, Alumnos* a2, Alumnos* a3, Alumnos* a4, Alumnos* a5, Alumnos* a6, Alumnos array[]) {
    a1->nombre = "Mateo";
    a1->legajo = 1;
    a1->curso = 2055;
    a1->valor = 638;

    a2->nombre = "Nico";
    a2->legajo = 1;
    a2->curso = 2055;
    a2->valor = 347;

    a3->nombre = "Agus";
    a3->legajo = 1;
    a3->curso = 2024;
    a3->valor = 246;

    a4->nombre = "Thiago";
    a4->legajo = 1;
    a4->curso = 2024;
    a4->valor = 138;

    a5->nombre = "Joaco";
    a5->legajo = 1;
    a5->curso = 2006;
    a5->valor = 423;

    a6->nombre = "Eze";
    a6->legajo = 1;
    a6->curso = 2006;
    a6->valor = 465;

    array[0] = *a1;
    array[1] = *a2;
    array[2] = *a3;
    array[3] = *a4;
    array[4] = *a5;
    array[5] = *a6;
}

int main() {
    // Datos de ejemplo
    Alumnos a1, a2, a3, a4, a5, a6;
    Alumnos alumnos[6];
    datosEjemplo(&a1, &a2, &a3, &a4, &a5, &a6, alumnos);

    valorPorCurso(alumnos, 5);

    return EXIT_SUCCESS;
}
