# <span style="color: white;">📝 TP N4 - Micro C</span>

## Punto 1: <span style="color: orange;"> Compilador de Micro C</span> 💻 

### Descripción
Unificamos el código encontrado en el [Código fuente](./etc/compilador-del-lenguaje-micro-pas-explicado.pdf) y lo compilamos en un archivo compilador.out

### Uso del Compilador
- Para usar el compilador de Micro C hay que ejecutar el archivo compilador.out y pasarle como parámetro el archivo de MicroC.m que querramos compilar
  
  _Ejemplo:_
  ```bash
  > ./compilar.out test.m
  ```

## Punto 2: <span style="color: orange;"> Programas en Micro C</span> 📝

### [Sin errores](./correcto.m)

```c
inicio
    leer (a,b) ;
    c := a + (b-2) ;
    escribir (c, a+4) ;
fin
```

### [Error Léxico](./lexico.m)
```c
inicio
    leer (a,b)
    c := a + (b-2);
    escribir (c, a+4);
fin
```

### [Error Sintáctico](./syntax.m)
```c
inicio
    leer (a);
    # := a;
fin
```

### [Error Semántico](./syntax.m)
```c
inicio
    leer (abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz);
    escribir (abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz);
fin
```

## Punto 3: <span style="color: orange;"> Explicación Errores</span> 📝

- En el programa con el error Léxico, el error se da porque el código no sigue las reglas establecidas por el lenguaje para formar sentencias, se puede ver que en la primera línea de código falta un ";" que es necesario para que el programa sepa que termina una "oración" de la misma manera que el "." para el lenguaje Español.
  
- En el otro código los errores son sintácticos porque el código contiene ciertos carácteres "#" que no forman parte del lenguaje usado haciendo que el programa ya no tenga sentido sintáctico ni semántico en ese lenguaje.

- En el caso de el error semántico es un error que sucede cuando algo no "tiene sentido" dentro de un programa, en este caso léxica y sintácticamente es correcto pero el identificador es demasiado grande para lo que esperaría el programa, no tiene sentido un nombre tan grande entonces da error.
