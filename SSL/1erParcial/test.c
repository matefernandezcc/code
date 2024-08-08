//Dada la siguiente función, que valor tendrá p si i vale 10, complete la función printf con
//los argumentos correctos.
#include <stdio.h>

void calcular(int i, float *p) {
    int j = i * 2;
    i = 3.2;
    *p = i / 3;
    printf("%f\n", *p);
}

int main() {
    float resultado;
    calcular(10, &resultado);
    return 0;
}

