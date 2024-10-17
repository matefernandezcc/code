/* ///////////////////// Base de conocimientos ///////////////////// */
entretenimiento(cine).
entretenimiento(teatro).
entretenimiento(pool).
entretenimiento(parqueTematico).

costo(cine, 30).
costo(teatro, 40).
costo(pool, 15).
costo(parqueTematico, 50).


/* ///////////////////// Combinatoria ///////////////////// */

/**
 * Desarrollar un predicado entretenimientos/2 que relaciona una cantidad de dinero con los entretenimientos
 * posibles que se pueden realizar con esa cantidad.
 * 
*/

% creo una lista de entretenimientos con el findall y llamo a la combinatoria
entretenimiento(Dinero, ListaEntretenimientos):-
    findall(Entretenimiento, entretenimiento(Entretenimiento), Lista),
    combinatoria(Lista, Dinero, ListaEntretenimientos).

% Caso general: lista vacía.
combinatoria([], _, []).

% Caso cuando se puede incluir el elemento en el subconjunto.
combinatoria([Entretenimiento|Resto], Dinero, [Entretenimiento|RestoEntretenimientos]):-
    costo(Entretenimiento, Costo),
    Costo =< Dinero,
    DineroRestante is Dinero - Costo,
    combinatoria(Resto, DineroRestante, RestoEntretenimientos).

% Caso cuando se omite el elemento.
combinatoria([_|Resto], Dinero, Lista):-
    combinatoria(Resto, Dinero, Lista).



/* ///////////////////// Template ///////////////////// 

% Caso general: lista vacía.
combinatoria([], _, []).

% Caso cuando se puede incluir el elemento en el subconjunto.
combinatoria([Elemento|Resto], Condicion, [Elemento|RestoSeleccionados]):-
    satisface_condicion(Elemento, Condicion, NuevaCondicion),
    combinatoria(Resto, NuevaCondicion, RestoSeleccionados).

% Caso cuando se omite el elemento.
combinatoria([_|Resto], Condicion, Lista):-
    combinatoria(Resto, Condicion, Lista).

*/