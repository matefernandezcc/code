/* ///////////////////// Base de conocimientos ///////////////////// */
jugador(maradona).
jugador(chamot).
jugador(balbo).
jugador(caniggia).
jugador(passarella).
jugador(pedemonti).
jugador(basualdo).

amigo(maradona, caniggia).
amigo(caniggia, balbo).
amigo(balbo, chamot).
amigo(balbo, pedemonti).

sustancia(Sustancia):-
    tomo(_, Sustancia).

tomo(maradona, sustancia(efedrina)).
tomo(maradona, sustancia(cafeVeloz)).
tomo(caniggia, sustancia(cocacola, 2)).
tomo(chamot, sustancia(cafeVeloz)).
tomo(balbo, sustancia(gatoreit, 2)).


/* ///////////////////// Consultas definidas ///////////////////// */

% passarella toma todo lo que no tome Maradona
tomo(passarella, Sustancia):-
    %sustancia(Sustancia), loopea porque para llamar a sustancia liga Sustancia con los hechos de tomo y vuelve a llamar a tomo(passarella, Sustancia)
    not(tomo(maradona, Sustancia)).

% pedemonti toma todo lo que toma Chamot y lo que toma Maradona
tomo(pedemonti, Sustancia):-
    sustancia(Sustancia),
    tomo(chamot, Sustancia),
    tomo(maradona, Sustancia).

puedeSerSuspendido(Jugador):-
    tomo(Jugador, Sustancia),
    prohibida(Sustancia).

prohibida(producto(Producto, Cantidad)):-
    %maximo(Producto, CantidadMaxima),
    Cantidad > CantidadMaxima.

seConocen(Jugador, OtroJugador):-
    amigo(Jugador, OtroJugador).

malaInfluencia(Jugador, OtroJugador):-
    %jugador(Jugador),
    %jugador(OtroJugador),
    puedeSerSuspendido(Jugador),
    puedeSerSuspendido(OtroJugador),
    seConocen(Jugador, OtroJugador).