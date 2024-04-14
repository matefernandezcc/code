#include <../include/formulas.h>

// Definiciones de CoeficienteA, CoeficienteB y CoeficienteM como variables globales
CoeficienteA A;
CoeficienteB B;
CoeficienteM M;

void leerCoeficientes(int coeficientes[]) {
    char *input;

    // Read A
    input = readline("> A = ");
    if (input == NULL) {
        printf("Error: Unable to read A\n");
        exit(EXIT_FAILURE);
    }
    coeficientes[0] = atoi(input); // Convert input string to int
    A = coeficientes[0]; // Asignar el valor de A
    free(input); // Free memory

    // Read B
    input = readline("> B = ");
    if (input == NULL) {
        printf("Error: Unable to read B\n");
        exit(EXIT_FAILURE);
    }
    coeficientes[1] = atoi(input); // Convert input string to int
    B = coeficientes[1]; // Asignar el valor de B
    free(input); // Free memory

    // Read M
    input = readline("> M = ");
    if (input == NULL) {
        printf("Error: Unable to read M\n");
        exit(EXIT_FAILURE);
    }
    coeficientes[2] = atoi(input); // Convert input string to int
    M = coeficientes[2]; // Asignar el valor de M
    free(input); // Free memory
}

// GCD con Algoritmo de Euclides 
int gcdEuclides(int a, int b) {
    int temp;
    while (b != 0) {
        temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}
