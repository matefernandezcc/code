/* //////////////////////////////// Base de Conocimientos //////////////////////////////// */

%usuario(nombre, suscriptores)
%subio(nombre, contenido)

%video(titulo, duracion[s], views[miles], likes)
%short(duracion[s], likes, filtros)
%stream()

/* ///////////// Punto 1 - Modelado ///////////// */
usuario(markitocuchillos, 45000).
usuario(sebaElDolar, 5000).
usuario(tiqtoqera, 40000).
usuario(user99018, 1).

subio(markitocuchillos, video("Gatito toca el piano", 45, 50, 1000)).
subio(markitocuchillos, video("Gatito toca el piano 2", 65, 2, 2)).

subio(sebaElDolar, video("300 ¿es el dólar o Esparta?", 60000, 2000, 1040500)).
subio(sebaElDolar, stream).

subio(tiqtoqera, short(15, 800000, [goldenHauer, cirugiaEstetica])).
subio(tiqtoqera, short(20, 0, [])).
subio(tiqtoqera, stream).


/* //////////////////////////////// Consultas pedidas //////////////////////////////// */

/* ///////////// Punto 2 ///////////// */
myTuber(Usuario):- subio(Usuario, _).

/* ///////////// Punto 3 ///////////// */
milenial(Usuario):- subio(Usuario, video(_, _, _, 1000)).
milenial(Usuario):- subio(Usuario, video(_, _, 1000, _)).

/* ///////////// Punto 4 ///////////// */
nuncaSubio(Usuario):-
    %usuario(Usuario, _).
    not(subio(Usuario, video(_,_,_,_))).

/* ///////////// Punto 5 ///////////// */
nivelEngagement(Usuario, Engagement):-
    myTuber(Usuario),
    findall(
        EngagementContenido,
        (subio(Usuario, Contenido), engagementContenido(Contenido, EngagementContenido)),
        EngagementContenidos
        ),
        sumlist(EngagementContenidos, Engagement).

engagementContenido(stream, 2000).
engagementContenido(short(_, Likes, _), Likes).
engagementContenido(video(_,_,Views,Likes), Engagement):-
    Engagement is Views+Likes.

/* ///////////// Punto 6 ///////////// */