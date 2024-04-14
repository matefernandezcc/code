#ifndef FORMULAS_H
#define FORMULAS_H

#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

#include <readline/readline.h>
#include <readline/history.h>

typedef int CoeficienteA;
typedef int CoeficienteB;
typedef int CoeficienteM;

void leerCoeficientes(int coeficientes[]);
int* solucionParametrica(int coeficientes[]);
int gcdEuclides(int, int);

#endif /* FORMULAS_H */

