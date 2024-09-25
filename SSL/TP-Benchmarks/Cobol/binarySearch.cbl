       IDENTIFICATION DIVISION.
       PROGRAM-ID. BusquedaBinaria.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 ARREGLO.
               05 ELEMENTO PIC 9(6) OCCURS 100000 TIMES INDEXED BY IDX.
           01 CLAVE PIC 9(6).
           01 BAJO PIC 9(6) VALUE 1.
           01 ALTO PIC 9(6) VALUE 100000.
           01 MEDIO PIC 9(6).
           01 ENCONTRADO PIC X VALUE 'N'.
           01 ENTRADA-USUARIO PIC X(10).

       PROCEDURE DIVISION.
           DISPLAY "Ingrese el valor a buscar:"
           ACCEPT ENTRADA-USUARIO
           MOVE FUNCTION NUMVAL(ENTRADA-USUARIO) TO CLAVE

           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 100000
               MOVE IDX TO ELEMENTO(IDX)
           END-PERFORM

           MOVE 1 TO BAJO
           MOVE 100000 TO ALTO

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
