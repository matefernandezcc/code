package calculadora;

public class Suma implements Operacion {
    @Override
    public int resolver(int unNumero, int otroNumero) {
        return unNumero+otroNumero;
    }
}
