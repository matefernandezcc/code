#include <stdio.h>
#include <stdint.h>
///////////////////////////////////////////////////////////////
//                   Bitwise Operators                      //
/////////////////////////////////////////////////////////////

// This operator does bitwise manipulation

/**
 *  @fn & : AND operator
 *  @fn | : OR operator
 *  @fn ~ : NOT operator
 *  @fn << : Left shift opeator
 *  @fn >> : Right shift operator
 *  @fn ^ : XOR operator
*/

int decToBin(int num){
    int bin = 0, peso = 1, base = 2;
    int resto;

    while (num){
        resto = num%base;
        num /= 2;
        bin += resto*peso;
        peso *= 10;
    }

    return bin;
}

int main(){
    int and = 7 & 4; // Se queda con el mas chico
    printf("7 & 4 = %d\n",and);

    
    int or = 7 | 4; // Se queada el mas grande
    printf("7 | 4 = %d\n",or);


    int not = 7; // Complemento a 2 del numero
    printf("El complemento de ~7 = %d\n",~not);
    // 7 = 0111
    // ~ 1000 = que en binario es -8

    int numberToShift = 1; // 0000 0001
    int bitsToShift = 2; // 0000 0010
    int leftShift = numberToShift << bitsToShift;
    printf("%d << 2 = %d\n", decToBin(numberToShift), leftShift); // If i shift to bits to left from 0000 0001 I have 0000 0100 and this equals to 4 in base 10

    printf("72 bin = %d\n", decToBin(72));
    return 0;
}
