package calculadora;

public class Calculadora {

    public int resolver(int unNumero, int otroNumero, Operacion operacion){
        return operacion.resolver(unNumero, otroNumero);
    }
}
