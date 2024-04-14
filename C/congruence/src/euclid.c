#include "../include/euclid.h"

// Función para inicializar una matriz
Matrix *createMatrix(int rows, int cols) {
    Matrix *mat = malloc(sizeof(Matrix));
    mat->rows = rows;
    mat->cols = cols;
    mat->data = malloc(rows * sizeof(int *));
    for (int i = 0; i < rows; i++) {
        mat->data[i] = malloc(cols * sizeof(int));
    }
    return mat;
}

// Función para liberar la memoria asignada a una matriz
void freeMatrix(Matrix *mat) {
    for (int i = 0; i < mat->rows; i++) {
        free(mat->data[i]);
    }
    free(mat->data);
    free(mat);
}

// Algoritmo de Euclides extendido para encontrar el máximo común divisor (MCD)
// y las combinaciones lineales de dos números a y b tal que a(x) + b(y) = 1
int euclidesMatricial(int a, int b, int *x, int *y) {
    // Caso base del algoritmo
    if (b == 0) {
        *x = 1;
        *y = 0;
        return a;
    }

    int x1, y1;
    int gcd = euclidesMatricial(b, a % b, &x1, &y1);

    *x = y1;
    *y = x1 - (a / b) * y1;

    return gcd;
}