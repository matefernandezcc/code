% receta(Nombre, Ingredientes)
% 	Ingrediente: [ingrediente(Nombre, Cantidad)]
receta(caramelo, [ingrediente(agua, 100), ingrediente(azucar, 100)]).
receta(flan, [ingrediente(agua, 100), ingrediente(azucar, 300)]).
receta(cazuelaDeMariscos, [ingrediente(agua, 100), ingrediente(mariscos, 100), ingrediente(casa, 1001), ingrediente(salsa, 100)]).
receta(vasoDeAgua, [ingrediente(agua, 500)]).


% rapida(Receta)
% tiene menos de 4 ingredientes
 rapida(Receta):-
    receta(Receta, Ingredientes),
    length(Ingredientes, Total),
    Total < 4.
    

% postre(Receta)
% Tiene mas de 250 de azucar
 postre(Receta):-
    receta(Receta, Ingredientes),
    member(ingrediente(azucar,Cantidad), Ingredientes),
    Cantidad > 250.


% dulce(Receta)
% findall(dulce(Receta), postre(Receta), Dulces).
            

% cantidadDePostes(Receta)
% Se cumple para el numero de recetas de postres en la base
cantidadDePostres(Cantidad):-
    findall(Nombre,postre(Nombre),Postres),
	length(Postres, Cantidad).


% trivial/1
% Se cumple para las recetas con un unico ingrediente
trivial(Receta):- receta(Receta, [_]).

% calorias/2
calorias(agua, 0).
calorias(azucar, 200).
calorias(caramelo, 500).
calorias(casa, 1000).
calorias(mariscos, 600).
calorias(salsa, 300).

% elPeor/2
% Relaciona una receta con su ingrediente más calórico
elPeorr([Peor],Peor).

elPeorr([Ingrediente|Otros], Ingrediente):-
    elPeor(Otros, OtrosIngredientes),
    calorias(OtrosIngredientes, CaloriasOtrosIngredientes),
    calorias(Ingrediente, CaloriasIngrediente),
    CaloriasIngrediente >= CaloriasOtrosIngredientes.

elPeorr([Ingrediente|Otros],OtrosIngredientes):-
    elPeor(Otros, OtrosIngredientes),
    calorias(OtrosIngredientes, CaloriasOtrosIngredientes),
    calorias(Ingrediente, CaloriasIngrediente),
    CaloriasIngrediente < CaloriasOtrosIngredientes.

elPeor(Ingredientes, Peor):-
    member(Peor, Ingredientes), calorias(Peor, CaloriasDelPeor),
    forall(
        member(Ingrediente, Ingredientes),
        (calorias(Ingrediente, Calorias), CaloriasDelPeor >= Calorias)
    ).
    
caloriasTotales(Receta, Total):-
    receta(Receta, Ingredientes),
    findall(Kcal, (member(Ing, Ingredientes),calorias(Ing,Kcal)), Kcals),
    sumlist(Kcals, Total).


% guasada(Receta)
% si tiene algun ingrediente con mas de mil kcal
guasada(Receta):-
    receta(Receta, Ingredientes),
    member(IngredienteEngordador, Ingredientes),
    calorias(IngredienteEngordador, Calorias),
    Calorias > 1000.











