       IDENTIFICATION DIVISION.
       PROGRAM-ID. BubbleSortExample.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ARRAY-SIZE          PIC 9(5) VALUE 10000.
       01  DISPLAY-LIMIT       PIC 9(2) VALUE 5.
       01  ARRAY.
           05  ELEMENTS OCCURS 10000 TIMES INDEXED BY IDX.
               10  ELEMENT-VALUE   PIC 9(5).
       01  I                     PIC 9(5).
       01  J                     PIC 9(5).
       01  TEMP                  PIC 9(5).

       PROCEDURE DIVISION.
           PERFORM INITIALIZE-ARRAY
           PERFORM SHUFFLE-ARRAY
           DISPLAY "Array Desordenado (Primeros 5 Elementos):"
           PERFORM DISPLAY-ARRAY
           PERFORM BUBBLE-SORT
           DISPLAY "Array Ordenado (Primeros 5 Elementos):"
           PERFORM DISPLAY-ARRAY
           STOP RUN.

       INITIALIZE-ARRAY.
           MOVE 1 TO I
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARRAY-SIZE
               MOVE I TO ELEMENT-VALUE (I)
           END-PERFORM
           EXIT PROGRAM.

       SHUFFLE-ARRAY.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARRAY-SIZE
               PERFORM VARYING J FROM I BY 1 UNTIL J > ARRAY-SIZE
                   IF FUNCTION RANDOM <= 0.5
                       MOVE ELEMENT-VALUE (I) TO TEMP
                       MOVE ELEMENT-VALUE (J) TO ELEMENT-VALUE (I)
                       MOVE TEMP TO ELEMENT-VALUE (J)
                   END-IF
               END-PERFORM
           END-PERFORM
           EXIT PROGRAM.

       BUBBLE-SORT.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARRAY-SIZE - 1
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > ARRAY-SIZE - I
                   IF ELEMENT-VALUE (J) > ELEMENT-VALUE (J + 1)
                       MOVE ELEMENT-VALUE (J) TO TEMP
                       MOVE ELEMENT-VALUE (J + 1) TO ELEMENT-VALUE (J)
                       MOVE TEMP TO ELEMENT-VALUE (J + 1)
                   END-IF
               END-PERFORM
           END-PERFORM
           EXIT PROGRAM.

       DISPLAY-ARRAY.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > DISPLAY-LIMIT
               DISPLAY "Elemento " I ": " ELEMENT-VALUE (I)
           END-PERFORM
           EXIT PROGRAM.
