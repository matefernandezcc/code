#include <stdlib.h>
#include <stdio.h>
#define tam1 10
#define tam2 10

/**
 * @brief Se usa para unir dos arrays ordenados manteniendo el orden en un tercer array
 * 
 * @param array1 vector 1 ORDENADO
 * @param size_array1 tamaño físico del vector 1
 * 
 * @param array2 vector 2 ORDENADO
 * @param size_array2 tamaño físico del vector 2
 * 
 * @param array_res vector resultado ya ordenado
 * 
 */ 
void apareo(int array1[], int size_array1, int array2[], int size_array2, int array_res[]) {
    int i = 0;
    int j = 0;
    int k = 0;

    // Aparear los dos arrays mientras haya elementos en ambos
    while (i < size_array1 && j < size_array2) {
        if(array1[i] < array2[j]) {
            array_res[k] = array1[i];
            i++;
        } else {
            array_res[k] = array2[j];
            j++;
        }
        k++;
    }

    // Copiar los elementos restantes de array1 (si los hay)
    while (i < size_array1) {
        array_res[k] = array1[i];
        i++;
        k++;
    }

    // Copiar los elementos restantes de array2 (si los hay)
    while (j < size_array2) {
        array_res[k] = array2[j];
        j++;
        k++;
    }
}

void mostrarArray(int array[], int size) {
    printf("Array: [");
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("]\n");
}

int main() {
    // Datos de ejemplo
    int pares[tam1] = {2, 4, 6, 8, 10, 12, 14, 16, 18, 20};
    int impares[tam2] = {1, 3, 5, 7, 9, 11, 13, 15, 17, 19};

    int res[tam1 + tam2];
    apareo(pares, tam1, impares, tam2, res);

    mostrarArray(pares, tam1);
    mostrarArray(impares, tam2);
    mostrarArray(res, tam1 + tam2);

    return EXIT_SUCCESS;
}
