       IDENTIFICATION DIVISION.
       PROGRAM-ID. BusquedaBinariaImpares.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 ARREGLO.
               05 ELEMENTO PIC 9(7) OCCURS 1000000 TIMES INDEXED BY IDX.
           01 CLAVE PIC 9(7) VALUE 777777.
           01 BAJO PIC 9(7) VALUE 1.
           01 ALTO PIC 9(7) VALUE 1000000.
           01 MEDIO PIC 9(7).
           01 ENCONTRADO PIC X VALUE 'N'.
           01 IMPAR PIC 9(7) VALUE 1.

       PROCEDURE DIVISION.
           DISPLAY "Buscando el valor: " CLAVE

           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 1000000
               MOVE IMPAR TO ELEMENTO(IDX)
               ADD 2 TO IMPAR
           END-PERFORM

           MOVE 1 TO BAJO
           MOVE 1000000 TO ALTO
           
           PERFORM UNTIL BAJO > ALTO OR ENCONTRADO = 'Y'
               COMPUTE MEDIO = (BAJO + ALTO) / 2
               IF ELEMENTO(MEDIO) = CLAVE THEN
                   MOVE 'Y' TO ENCONTRADO
               ELSE
                   IF ELEMENTO(MEDIO) > CLAVE THEN
                       MOVE MEDIO TO ALTO
                       SUBTRACT 1 FROM ALTO
                   ELSE
                       MOVE MEDIO TO BAJO
                       ADD 1 TO BAJO
                   END-IF
               END-IF
           END-PERFORM

           IF ENCONTRADO = 'Y'
               DISPLAY "CLAVE ENCONTRADA EN LA POSICIÓN " MEDIO
           ELSE
               DISPLAY "CLAVE NO ENCONTRADA".

           STOP RUN.
