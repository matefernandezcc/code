#include <stdio.h>
///////////////////////////////////////////////////////////////
//                Value & Reference Calls                   //
/////////////////////////////////////////////////////////////


void valueCall(int x, int y){
    x = 20;
    y = 10;
}

void referenceCall(int *x1, int *y1){
    *x1 = 20;
    *y1 = 10;
}

int main(){
    int x = 10;
    int y = 20;
    valueCall(x,y);
    printf("Value call\nx = %d\ny = %d\n", x, y);

    referenceCall(&x,&y);
    printf("\nReference call\nx = %d\ny = %d\n", x, y);

    return 0;
}