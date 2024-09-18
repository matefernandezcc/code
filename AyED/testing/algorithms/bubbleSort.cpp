#include <iostream>
using namespace std;

int main(){
    int dim = 15;
    int v[dim] = {34, 76, 23, 89, 45, 12, 58, 97, 1, 42, 66, 20, 54, 31, 5};
    
    for(int i=0; i<dim; i++){
        for(int j=0; j<dim; j++){
            if(v[j] > v[j+1]){
                int aux = v[j];
                v[j] = v[j+1];
                v[j+1] = aux;
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