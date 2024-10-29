/* //////////////////////////////////// PAS //////////////////////////////////// */

void Objetivo (void) {
    /* <objetivo> -> <programa> FDT */
    Programa();
    Match(FDT);
}

void Programa (void) {
    /* <programa> → INICIO <listaSentencias> FIN */
    Match(INICIO);
    ListaSentencias();
    Match(FIN);
}

/* ///////////// Producciones con repeticiones ///////////// */
void ListaSentencias (void) {
    /* <listaSentencias> -> <sentencia> {<sentencia>} */
    Sentencia();
    while (1) {
        switch (ProximoToken()) {
            case ID:
            case LEER:
            case ESCRIBIR: /* detectó token correcto */
                Sentencia(); /* procesa la secuencia opcional */
                break;
            default:
                return;
        }
    }
}

/* ///////////// Producciones con opciones ///////////// */
void Sentencia(void) {
    TOKEN tok = ProximoToken();
    switch (tok) {
        case ID: /* <sentencia> -> ID := <expresion>; */
            Match(ID); 
            Match(ASIGNACION); 
            Expresión(); 
            Match(PUNTOCOMA);
            break;
        case LEER: /* <sentencia> -> LEER ( <listaIdentificadores> ); */
            Match(LEER); 
            Match(ParentesisIZQ); 
            ListaIdentificadores();
            Match(ParentesisDER); 
            Match(PUNTOCOMA);
            break;
        case ESCRIBIR: /* <sentencia> -> ESCRIBIR (<listaExpresiones>); */
            Match(ESCRIBIR); 
            Match(ParentesisIZQ);
            ListaExpresiones();
            Match(ParentesisDER); 
            Match(PUNTOCOMA);
            break;
        default:
            ErrorSintactico(tok); 
            break;
    }
}

/* ///////////// PAS con Rutinas semánticas ///////////// */
void Expresion (REG_EXPRESION *resultado) { 
    /* <expresión> -> <primaria> {<operadorAditivo> <primaria> #gen_infijo} */ 

    REG_EXPRESION operandoIzq, operandoDer; 
    REG_OPERACION op; 
    token t; 

    Primaria(&operandoIzq); 
    for (t = ProximoToken(); t == SUMA || t == RESTA; t = ProximoToken()) { 
        OperadorAditivo(&op);
        Primaria(&operandoDer); 
        
        /* Probable generación de variables temporales */
        operandoIzq = GenInfijo(operandoIzq, op, operandoDer); 
    } 
    *resultado = operandoIzq; 
} 
