
#include "utils/structs.h"
#include "utils/parser.h"

void skipwhite(const char **p)
{
    while(isspace(**p))
        (*p)++;
}

int gettok(const char **p, int *vp)
{
    skipwhite(p);
    char c = **p;
    if(isdigit(c)) {
        char *p2;
        int v = strtoul(*p, &p2, 0);
        *p = p2;
        if(vp) *vp = v;
        return '1';
    }
    (*p)++;
    return c;
}

void ungettok(int op, const char **p)
{
    (*p)--;
}

int evalpri(const char **p)
{
    int v;
    int op = gettok(p, &v);
    switch(op) {
        case '1': return v;
        case '-': return -evalpri(p);
        case '(':
            v = evalexpr(p);
            op = gettok(p, NULL);
            if(op != ')') {
                fprintf(stderr, "missing ')'\n");
                ungettok(op, p);
            }
            return v;
    }
}

int evalterm(const char **p)
{
    int r = evalpri(p);
    while(1) {
        int op = gettok(p, NULL);
        switch(op) {
            case '*': r *= evalpri(p); break;
            case '/': r /= evalpri(p); break;
            default: ungettok(op, p); return r;
        }
    }
}

int evalexpr(const char **p)
{
    int r = evalterm(p);
    while(1) {
        int op = gettok(p, NULL);
        switch(op) {
            case '+': r += evalterm(p); break;
            case '-': r -= evalterm(p); break;
            default: ungettok(op, p); return r;
        }
    }
}

int eval(const char *expresion) {
    return evalexpr(&expresion);
}


int main(int argc, char* argv[]){
    if(argc == 1){
        char cadena[MAX_LEN + 1];
        char operandos[MAX_LEN + 1];

        leerArchivo("operandos.txt", cadena, sizeof(cadena));
        printf("Cadena leida del archivo: %s\n\n", cadena);

        printf("Resultado %d\n", eval(cadena));

        return 0;
    }
    else{
        const char* cadena = argv[1];
        printf("Cadena leida de argv[1]: %s\n\n", cadena);

        printf("Resultado %d\n", eval(cadena));

        return 0;
    }
}

// Fuentes
// Eval()
// https://stackoverflow.com/questions/14472680/how-to-get-and-evaluate-the-expressions-from-a-string-in-c

// Top Down Parsers
// https://www.youtube.com/watch?v=iddRD8tJi44

// Recursive descent parser
// https://en.wikipedia.org/wiki/Recursive_descent_parser

