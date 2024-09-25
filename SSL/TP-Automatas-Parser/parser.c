#include "utils/structs.h"
#include "utils/parser.h"

/////////////////////////////////////////////////////////// PUNTO 2 ///////////////////////////////////////////////////////////
/**
 * Implementacion de una funcion que recibe un char de un numero '1' '2' '3' ,etc y lo devuelve a su equivalente numerico
 * 
 * Alcanza con hacer un corrimiento de indice sabiendo que si le resto a un char numerico su ASCII de '0' me da el numero normal en tipo int
 */ 
int to_int(char c) {
    return c - '0';
}

/////////////////////////////////////////////////////////// PUNTO 3 ///////////////////////////////////////////////////////////
/**
 * Ingresar cadena que represente una operación con  enteros  decimales y obtener  su  resultado,  se  debe  operar  con  +,_ ,/ y  *.
 * Ejemplo  =  3+4*7+3-8/4  = 32. Debe  poder operar con cualquier número de operandos y operadores respetando la precedencia de los operadores aritméticos.
 * La  cadena  ingresada  debe  ser  validada  previamente  preferentemente  reutilizando  las
 * funciones del ejercicio 1.
 * Para poder realizar la operación los caracteres deben convertirse a números utilizando la función 2.
 * La cadena debe ingresar por línea de comando o por archivo
 */ 

//////////////////// Función para manejar errores ////////////////////
void error(const char* msg) {
    printf("Error: %s\n", msg);
    exit(EXIT_FAILURE);
}

//////////////////// Avanza el carácter actual ////////////////////
void advance() {
    current_char = *input++;
}

//////////////////// Comprueba si el carácter actual es el esperado ////////////////////
void expect(char expected_char) {
    if (current_char == expected_char) {
        advance();
    } else {
        error("Carácter inesperado");
    }
}

//////////////////// Analiza y retorna un int ////////////////////
int parse_number() {
    int result = 0;
    while (isdigit(current_char)) {
        result = to_int(current_char); // Uso la funcion del punto 2 para convertir de char a int
        advance();
    }
    return result;
}

//////////////////// Números o expresiónes entre paréntesis ////////////////////
int parse_factor() {
    if (current_char == '(') {
        advance();  // Avanzar en caso de estar en un '('
        int result = parse_expression(); // Parsear dentro de los paréntesis
        expect(')');  // Luego del parse se espera un ')' 
        return result;
    } else if (isdigit(current_char)) {
        return parse_number();
    } else {
        error("Factor no válido");
        return 0;
    }
}

//////////////////// Multiplicación o división de factores ////////////////////
int parse_term() {
    int result = parse_factor();
    while (current_char == '*' || current_char == '/') {
        char op = current_char;
        advance();
        if (op == '*') {
            result *= parse_factor();
        } else if (op == '/') {
            int divisor = parse_factor();
            if (divisor == 0) {
                error("División por cero");
            }
            result /= divisor;
        }
    }
    return result;
}

//////////////////// Suma o resta de términos ////////////////////
int parse_expression() {
    int result = parse_term();
    while (current_char == '+' || current_char == '-') {
        char op = current_char;
        advance();
        if (op == '+') {
            result += parse_term();
        } else if (op == '-') {
            result -= parse_term();
        }
    }
    return result;
}

int parse(const char* expr) {
    input = expr;
    advance();
    return parse_expression();
}

int main(int argc, char* argv[]){
    if(argc == 1){
        char cadena[MAX_LEN + 1];
        char operandos[MAX_LEN + 1];

        leerArchivo("operandos.txt", cadena, sizeof(cadena));
        printf("Cadena leida del archivo: %s\n\n", cadena);

        printf("Resultado %d\n", parse(cadena));

        return 0;
    }
    else{
        const char* cadena = argv[1];
        printf("Cadena leida de argv[1]: %s\n\n", cadena);

        printf("Resultado %d\n", parse(cadena));

        return 0;
    }
}
