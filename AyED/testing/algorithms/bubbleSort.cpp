#include <iostream>
using namespace std;

int main(){
    int dim = 5;
    int v[5] = {3, 2, 1, 4, 5};
    
    // Bubble Sort
    for(int i=0; i<dim; i++){
        for(int j=0; j<dim; j++){
            if(v[j] > v[j+1]){
                int aux = v[j+1];
                v[j+1] = v[j];
                v[j] = aux;
            }
        }
    }

    int h=0;
    while(h<dim){
        cout<<v[h]<<" ";
        h++;
    }

    return 0;
}