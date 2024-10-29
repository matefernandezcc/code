# <span style="color: white;">📝 TP N3 - Flex y Bison</span>

## <span style="color: orange;"> Compilador de Micro C hecho con Flex y Bison</span> 💻 

### Descripción
Compilador de MicroC usando las herramientas de análisis léxico y parsing que tienen Flex y Bison 

### Uso del Compilador
- Para usar el compilador de Micro C hay que compilar los archivos dentro de la carpeta ./compilador 
- Usando el Makefile es más fácil. 
  - Escribiendo "make" en la terminal y "make clean" para eliminar los archivos compilados

Una vez compilado va a aparecer un archivo parser.out
  
  _Ejemplo de uso:_
  ```bash
  > ./parser.out < ./src/fileName.m
  ```
Siendo test.m el código fuente escrito en Micro C
