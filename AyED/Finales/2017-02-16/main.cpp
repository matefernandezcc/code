#include <iostream>
#include <stdio.h>

/*
 * 
 * unsigned GetCurso(unsigned unÍndice); // Dodo unÍndice retorna el código de curso.
 * 
 * bool IsPromocionado(T exámenes); // Dado los exámenes de un estudiante retorna si promociona o no.
 * 
 * Dispone además de las funciones de estructuras enlazadas que puede invocar sin desarrollar
 * 
 */


// 1 Dé un nombre para T y codifique su declaración para que sea utilizable en la función IsPromocionado. Justifique brevemente
bool IsPromocionado(t_evaluacion examenes){
    if(examenes.primer_parcial >= 8 && examenes.segundo_parcial >= 8){
        return true;
    }
    else{
        return false;
    }
} // Dado los exámenes de un estudiante retorna si promociona o no.



// 2 Codifique la declaración de la variable cursos y declare los tipos de datos necesarios para declararla

struct t_evaluacion{
    int primer_parcial;
    int segundo_parcial;
}

struct t_curso{
    int legajo;
    char[21] alumno;
    t_evaluacion evaluacion;
}

struct Nodo{
    t_curso curso;
    Nodo* sgte;
}

int main(int argc, int** argv[]){
    N = 10;
    Nodo cursos[N];
    
    // Creo la cola
    Nodo p* = NULL;

    while(p!=NULL){
        
    }

    ordenar_por_curso(cursos, N);
    InformarPromocionados(cursos);

    return 0;
}

/* 3 Codifique el prototipo de InformarPromocionados que con el vector de N colas genere el archivo, ordenado por
número de legajo (consignando número de legajo, apellido y nombre y curso), de todos los estudiantes que
promocionaron en la materia analizada. */
FILE* InformarPromocionados(Nodo cursos[N]){
    // Creamos un archivo f
    FILE* f = fopen("alumnos_promocionados","wb+");

    // Guardo en el archivo las N estructuras de la cola, es decir cada curso
    while (i < N){
        fwrite(&cursos[i], sizeof(Nodo), 1, f);
        i++;
    } // Como estoy recorriendo secuencialmente y el vector cursos ya estaba ordenado por legajo mi archivo va a quedar ordenado por legajo tmb
    fclose(f);

    return f
}

void ordenar_por_curso(Nodo curso[], int cantCursos){
    for(int i=0;i<cantCursos;i++){
        for(int j=0; j<cantCursos;j++){
            if(GetCurso(curso[j]) < GetCurso(curso[j+1])){
                Nodo temp = curso[j];
                curso[j] = curso[j+1];
                curso[j+1] = temp;
            }
        }
    }
}