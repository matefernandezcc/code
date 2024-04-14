#include "../include/main.h"

int main(){
    printf("Ingresar una ecuación de congruencia\n------------------------------------\n\nDe la forma:    Ax = B (mod M)\n\n------------------------------------\nIngresar los coeficientes A, B, M\n");

    int congruencia[3];
    leerCoeficientes(congruencia);
    int A = congruencia[0];
    int B = congruencia[1];
    int M = congruencia[2];
    printf("\n------------------------------------\nResolviendo: %dx = %d (mod %d)\n", A, B, M);

    // SolucionParametrica, es el conjunto de soluciones variando t desde (g, g-1)
    int g = gcdEuclides(A, M);
    printf("MCD(%d,%d) -> hay %d soluciones principales\n", A, M, g);
    int newA = A/g;
    int newB = B/g;
    int newM = M/g;
    printf("\nX(t) = %ds + %dt (mod %d), t varia entre [%d,%d]\n", newB, newM, M, 0, g-1);
    printf("\nPor teorema de fermat -> %ds = 1 (mod %d)\n", newA, newM);

    // Calculo de la combinacion lineal y de x0
    /** Ejemplo de como podria quedar el algoritmo, suponiendo la congruencia 78x = 84 (mod 102)
     *  los coeficientes de la congruencia simplificada quedan newA = 14 y newM = 17
     *  
     * Entones la matriz de Euclides es
     * 1    0   17      | el 17 arriba por ser mayor que el 14
     * 0    1   14      |
     * 
     * El s es el último número que queda cuando obtenemos la combinacion lineal que hace que newA y newB sean coprimos
     * OJO!! con el orden!!! el s es SI O SI el que acompaña al termino que tiene la s en la ecuación X(t)
     * 
     * para saber cual es ese numero en la matriz es facil:
     * Si el 14 esta abajo, es decir en la 2da fila entonces el numero s = al numero de la segunda columna
     * Si el 14 esta en la 1era fila s = es el num de la primera columna
    */
    int x0, y0;
    int gcd;
    int s;
    if (newA > newM) { // Si el condicional entra aca el s queda en la 1er columna, el s es el x0
        gcd = euclidesMatricial(newA, newM, &x0, &y0);
        printf("Calculando s usando algoritmo matricial de Euclides...\ns = %d\n", x0);
        printf("Las combinaciones lineales son: %d * %d + %d * %d = %d\n", newA, x0, newM, y0, gcd);
        s = x0;
    } else { // Si el condicional entra aca el s queda en la 2da columna, el s es el y0
        gcd = euclidesMatricial(newM, newA, &x0, &y0);
        printf("Calculando s...\ns = %d\n", y0);
        printf("Las combinaciones lineales son: %d(%d) + %d(%d) = %d\n", newA, y0, newM, x0, gcd);
        s = y0;
    }

    // Soluciones principales
    // una vez tengo s solo hay que ir sumando x(t) con t variando entre [0, (MCD(A,M))-1] para obtener las soluciones principales
    int i;
    int j;
    int conjSolucion[g];
    int t=(-newB*s)/newM;
    if((conjSolucion[0] = newB*(s) + newM*(t)) < 0)
        conjSolucion[0] += newM;
    for(i=1;i<g;i++){
        conjSolucion[i] = conjSolucion[0] + newM*i;
    }
    printf("\nLas %d soluciones de %dx = %d (mod %d) son\nX = {", g, A, B, M);
    for (int j = 0; j < g; j++){
        if (j != 0) {
            printf(", ");
        }
        printf("%d", conjSolucion[j]); // Imprime cada elemento del array
    }
    printf("}\n\n");
    //printf("t = %d\nsol pricipal = %d\n", t, newB*(s) + newM*(t));
    return 0;
}
