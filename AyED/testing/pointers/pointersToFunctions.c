#include <stdio.h>
// https://www.youtube.com/watch?v=axngwDJ79GY

int sumar(int a, int b) {return a + b;}
int restar(int a, int b) {return a - b;}
int multiplicar(int a, int b) {return a * b;}
int dividir(int a, int b) {return (b != 0) ? (a / b) : 0;}

int operar(int (*operacion)(int, int), int x , int y) {
    return operacion(x, y);  // Devuelve un puntero a otra funcion
}

int main() {
    int a = 15;
    int b = 5;
    int suma = operar(sumar, a, b);
    int resta = operar(restar, a, b);
    int mult = operar(multiplicar, a, b);
    int div = operar(dividir, a, b);

    printf("a: %d\tb: %d\nSuma: %d\nResta: %d\nMultiplicacion: %d\nDivision: %d\n",a , b, suma, resta, mult, div);
    
    return 0;
}