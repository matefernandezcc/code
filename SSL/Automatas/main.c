#include <stdio.h>
#include <string.h>
#include "DFA.h"
#include "DFA.c"

// Condiciones para transiciones
int isA(char c) {
    return c == 'a';
}

int isB(char c) {
    return c == 'b';
}

int isAnyChar(char c) {
    return 1; // Si ninguna otra condición se cumple, transiciona al estado por defecto
}

int main() {
    // Crear DFA
    DFA* dfa = dfa_createDFA();

    // Crear estados
    DFAState* state0 = dfa_createState(0, "Start");
    DFAState* state1 = dfa_createState(0, "Saw A");
    DFAState* state2 = dfa_createState(1, "Accepted B");

    // Agregar estados al DFA
    dfa_addState(dfa, state0);
    dfa_addState(dfa, state1);
    dfa_addState(dfa, state2);

    // Definir estado inicial
    dfa->startStateID = state0->ID;

    // Transiciones:
    // Desde state0: si 'a' -> state1
    dfa_addTransition(dfa, state0->ID, isA, state1->ID);

    // Desde state1: si 'b' -> state2
    dfa_addTransition(dfa, state1->ID, isB, state2->ID);

    // Transición por defecto (opcional)
    state0->defaultToStateID = state0->ID;  // Si no es 'a', se queda en state0
    state1->defaultToStateID = state0->ID;  // Si no es 'b', regresa a state0

    // Restablecer el DFA al estado inicial
    dfa_reset(dfa);

    // Cadena de entrada que queremos probar
    char input[] = "ab";
    printf("Input: %s\n", input);

    // Procesar la cadena de entrada
    for (int i = 0; i < strlen(input); i++) {
        dfa_makeNextTransition(dfa, input[i]);
    }

    // Verificar si se llegó al estado final
    DFAState* finalState = dfa->states[dfa->currentStateID];
    if (finalState->hasAction) {
        printf("Cadena aceptada. Llegó al estado: %s\n", finalState->actionName);
    } else {
        printf("Cadena rechazada. Estado actual: %s\n", finalState->actionName);
    }

    // Liberar memoria (no está implementado en este ejemplo, pero sería buena práctica)
    // free(dfa);

    return 0;
}
