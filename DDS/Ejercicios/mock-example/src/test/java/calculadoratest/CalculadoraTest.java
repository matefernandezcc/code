package calculadoratest;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import calculadora.Calculadora;
import calculadora.Operacion;
import calculadora.Suma;

public class CalculadoraTest {
    
    /* 
    @Test
    public void sumamosDosMasDos(){
        Calculadora calculadoraMock = mock(Calculadora.class);

        when(calculadoraMock.sumar(2,2)).thenReturn(4);

        Assertions.assertEquals(4, calculadoraMock.sumar(2,2));
        verify(calculadoraMock).sumar(2,2);
    }
    */

    // Test real
    @Test
    public void operacionSumaTest(){
        Calculadora calculadora = new Calculadora();
        Operacion suma = new Suma();

        Assertions.assertEquals(4, calculadora.resolver(2,2,suma));
    }

    // Tests usando mocks
    @Test
    public void operacionRestaTest(){
        Calculadora calculadora = new Calculadora();
        Operacion resta = mock(Operacion.class);

        when(calculadora.resolver(2,1, resta)).thenReturn(1);

        Assertions.assertEquals(1, calculadora.resolver(2,1, resta));
    }
}