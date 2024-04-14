#ifndef EUCLID_H
#define EUCLID_H

#include <stdlib.h>
#include <stdio.h>

typedef struct {
    int rows;
    int cols;
    int **data;
} Matrix;
Matrix *createMatrix(int rows, int cols);
void freeMatrix(Matrix *mat);

// Algoritmo de Euclides extendido para encontrar el máximo común divisor (MCD)
// y las combinaciones lineales de dos números a y b tal que a(x) + b(y) = 1
int euclidesMatricial(int, int, int*, int*);

#endif /* EUCLID_H */
