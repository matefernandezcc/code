/* ///////////////////// Base de conocimientos ///////////////////// */

% alumno(nombre).
alumno(nicolas).
alumno(malena).
alumno(raul).
alumno(carlos).
alumno(santiago).
alumno(messi).

% materia(nombre, año).
materia(algoritmos, 1).
materia(analisis1, 1).
materia(pdep, 2).
materia(sintaxis, 2).
materia(proba, 2).

% nota(alumno, materia, nota).
nota(nicolas, pdep, 10).
nota(nicolas, proba, 7).
nota(nicolas, sintaxis, 8).
nota(nicolas, analisis1, 7).
nota(malena, pdep, 6).
nota(malena, analisis1, 6).
nota(raul, pdep, 9).
nota(raul, analisis1, 9).
nota(raul, algoritmos, 7).
nota(messi, fulbo, 10).
nota(messi, ingles, 2).


/* ///////////////////// Funciones definidas ///////////////////// */
aprobo(Alumno, Materia):-
    nota(Alumno, Materia, Nota),
    Nota >= 6.

rindio(Alumno, Materia):-
    nota(Alumno, Materia, _).

% Ligo alumno y materia para que el predicado pueda ser totalmente inversible
noRindio(Alumno, Materia):-
    alumno(Alumno),
    materia(Materia, _),
    not(rindio(Alumno, Materia)).

% forall => para todo x (parametro1) se cumple que parametro2
%                      p(x) => q(x)
aproboAnio(Alumno, Anio):-
    alumno(Alumno),
    materia(_, Anio),
    forall(materia(Materia, Anio), aprobo(Alumno, Materia)).
