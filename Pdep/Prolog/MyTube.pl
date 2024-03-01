% ============================= DATOS =============================
% usuario(Nickname, Suscriptores)
% subio(Nickname, Contenido)
usuario(markitoscuchillos, 45000).
usuario(sebaElDolar, 5000).
usuario(tiqtoqera, 40000).
usuario(user99018, 1).

% video(Nombre, Duracion (en segundos), Reproducciones (en miles), Likes)
% short(Duracion (en segundos), Likes, [Filtros])
% stream
subio(markitoscuchillos, video("Gatito toca el piano", 45, 50, 1000)).
subio(markitoscuchillos, video("Gatito toca el piano 2", 65, 2, 2)).

subio(sebaElDolar, video("300 ¿es el dólar o Esparta?", 60000, 2000, 1040500)).
subio(sebaElDolar, stream).

subio(tiqtoqera, short(15, 800000, [goldenHauer, cirugiaEstetica])).
subio(tiqtoqera, short(20, 0, [])).
subio(tiqtoqera, stream).


% ============================= Punto 2 =============================
% Saber cuáles usuarios son mytubers. Se considera mytuber a un usuario que subió al menos un contenido (de cualquier tipo).
myTuber(Nickname):- subio(Nickname, _).


% ============================= Punto 3 =============================
% Se desea saber quién es un milenial. Se cumple cuando el mytuber subió un video que tiene exactamente 1.000 likes o 1 millón de views (1.000 miles).
milenial(Nickname):- subio(Nickname, video(_, _, _, 1000)).
milenial(Nickname):- subio(Nickname, video(_, _, 1000, _)).


% ============================= Punto 4 =============================
% También queremos saber si un usuario nunca subió un video. Modelar como crea conveniente.
nuncaSubio(Nickname):- 
    usuario(Nickname, _),
    not(subio(Nickname, video(_,_,_,_))).


% ============================= Punto 5 =============================
nivelEngagement(Nickname, Engagement):-
    myTuber(Nickname),
    findall(
        EngagementContenido,
        (subio(Nickname, Contenido), engagementContenido(Contenido, EngagementContenido)),
        EngagementContenidos
    ),
    sumlist(EngagementContenidos, Engagement).

engagementContenido(video(_, _, Views, Likes), Engagement):- Engagement is Views+Likes.
engagementContenido(short(_, Likes, _), Likes).
engagementContenido(stream, 2000).


% ============================= Punto 6 =============================
puntaje(MyTuber, Puntaje):-
    myTuber(MyTuber),
    findall(
        PuntajeObjetivo,
        puntajeObjetivo(MyTuber, PuntajeObjetivo),
        PuntajesObjetivo
    ),
    sumlist(PuntajesObjetivo, Puntaje).

% =============== Objetivo 1 ===============
puntajeContenido(short(_, _, Filtros), 2):-
    Filtros \= [].

% =============== Objetivo 2 ===============
puntajeContenido(Contenido, 1):-
    engagementContenido(Contenido, Engagement), Engagement > 10000.

% =============== Objetivo 3 ===============
puntajeContenido(Contenido, 2):-
    videoLargo(Contenido).


% =============== Objetivo 4 ===============
puntajeObjetivo(MyTuber, PuntajeObjetivo):-
    subio(MyTuber, Contenido),
    puntajeContenido(Contenido, PuntajeObjetivo).

puntajeObjetivo(MyTuber, 1):-
    subio(MyTuber, Contenido),
    subio(MyTuber, OtroContenido), 
    Contenido \= OtroContenido.

% =============== Objetivo 5 ===============
puntajeObjetivo(MyTuber, 10):-
    nivelEngagement(MyTuber, Engagement), Engagement > 1000000.

videoLargo(video(_, Duracion, _, _)):-
    Duracion > 6000.


% ============================= Punto 7 =============================
elMejor(MyTuber):-
    puntaje(MyTuber, Puntaje),
    forall(
        (puntaje(OtroMyTuber, PuntajeOtro), OtroMyTuber \= MyTuber),
        Puntaje > PuntajeOtro
    ).


% ============================= Punto 8 =============================
administra(martin, sebaElDolar).
administra(martin, markitoscuchillos).
administra(iniaki, martin).
administra(iniaki, gaston).
administra(gaston, tiqtoqera).

representa(Manager, MyTuber):-
    administra(Manager, Mytuber).

representa(Manager, MyTuber):-
    administra(Manager, Otro),
    representa(Otro, MyTuber).

