/* EJERCICIO 1
Desarrolle una funcion que retorne una lista ordenada a partir de la interseccion de 1 pila y 1 lista.
Defina usted las precondiciones y estructura de los nodos de la manera que considere mas conveniente y detallar.¿ 
*/

typedef struct {
    int valor;
    Nodo* sgte;
} nodo;

// Retorna un puntero al primer elemento de una TAD que searia la Union entre la pila y la lista

nodo* interseccion(nodo* lista, nodo* pila) {
    nodo* interseccion = NULL;
    nodo* auxLista = lista;
    nodo* auxPila = pila;

    // Recorrer la lista
    while (auxLista != NULL) {
        auxPila = pila;
        while (auxPila != NULL) {
            if (auxLista->valor == auxPila->valor) {
                interseccion = agregarNodo(interseccion, auxLista->valor);
                break;
            }
            auxPila = auxPila->sgte;
        }
        auxLista = auxLista->sgte;
    }

    return interseccion;
}