-- ========================================================================================
-- =                                       CLASE 2                                        =
-- ========================================================================================

-- Factorial
factorial 0 = 1
factorial n = (n-1)*n

-- Enesimo caracter
enesimoCaracter :: Int -> [a] -> a
enesimoCaracter n palabra = palabra !! n

-- Inferencia del tipo de una funcion
f:: Bool -> Bool -> Bool
f x y = x && not y

-- ============================================ Type Classes ============================================
-- Eq {==, /=}
-- Ord {>, <, >=, <=}
-- Num {+, -, *, ...}

doble :: Num a => a -> a
doble x = x*2

-- ====================== Ejs ======================

elMayorDeLosTres:: Ord a => a -> a -> a -> a
elMayorDeLosTres x y = max (max x y)

xor:: Bool -> Bool -> Bool
xor x y
    | x == y = x
    | otherwise = y

fibonacci:: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

-- (Ord a, Num a) => a -> a -> Bool
-- funcionRara::()=> -> ->
-- f:: Bool -> String -> Bool

-- ========================================================================================
-- =                                       CLASE 3                                        =
-- ========================================================================================

-- ============================================ DATAS ============================================
--  Sintaxis data <Nombre del Tipo> = <Constructor> <Tipo de los Campos>

-- Alu:: String -> String -> Int -> Alumno
data AlumnoV1 = AluV1 String String Int deriving(Show, Eq)

-- Variante compacta
data AlumnoV2 = AlumnoV2{
    nombreV2:: String,
    legajoV2:: String,
    notaV2:: Int
} deriving(Show,Eq)

-- ====================== Acceso a los datas ======================
nombreV1 (AluV1 elNombre _ _) = elNombre
legajoV1 (AluV1 _ elLegajo _) = elLegajo
notaV1 (AluV1 _ _ laNota) = laNota

promocionaV1:: AlumnoV1 -> Bool
promocionaV1 alumno = notaV1 alumno >= 8



-- ====================== TUPLAS ====================== Se usa muy poco, son como datas pero sin nombre por lo tanto son indistinguibles
segundoCampo:: (a,b,c) -> b
segundoCampo (_, x, _) = x



-- ============================================ PATTERN MATCHING AVANZADO ============================================
data Alumno = Alumno{
    legajo:: String,
    plan:: Int,
    notaFuncional:: Nota,
    notaLogico:: Nota,
    notaObjetos:: Nota
} deriving(Show, Eq)

data Nota = Nota{
    valor:: Int,
    detalle:: String
} deriving(Show, Eq)

-- Descomposicion con pattern matching
id:: Nota -> Nota
-- Version 1:   id (Nota elValor elDetalle) = Nota elValor elDetalle

-- Version 2: el simbolo @ recompone todo para poder usarlo del lado derecho de la igualdad sin tener que escribir todos los campos
id nota@(Nota valor observaciones) = nota

notaFinal:: Alumno -> Nota
notaFinal alumno = Nota ((valor (notaFuncional alumno) + valor (notaLogico alumno) + valor (notaObjetos alumno)) `div` 3) "Nota final"

aprobado:: Alumno -> Bool
aprobado alumno
    | plan alumno >= 1995 = valor (notaFinal alumno) >= 6
    | otherwise = valor (notaFinal alumno) >= 4



-- ============================================ MANEJO DE EFECTOS ============================================
subirUnPunto:: Nota -> Nota
subirUnPunto nota = nota {valor = valor nota + 1}

-- ====================== Ejercicio de Practica ======================
-- Rambo tiene dos armas una principal y una secundaria cada una con un cargador de cierta capacidad con alguna cantidad de balas
data Rambo = Rambo{
    armaPrincipal:: Arma,
    armaSecundaria:: Arma
} deriving(Show, Eq)

data Arma = Arma{
    cantidadDeBalas:: Int,
    capacidadCargador:: Int
} deriving(Show, Eq)

-- 1) Averiguar cuantas balas le quedan a Rambo en total
balasTotales:: Rambo -> Int
balasTotales rambo = cantidadDeBalas (armaPrincipal rambo) + cantidadDeBalas (armaSecundaria rambo)

-- 2) Dada un arma, disparar si tiene balas
dispararArma:: Arma -> Arma
dispararArma arma
    | cargadorLLeno arma = arma {cantidadDeBalas = cantidadDeBalas arma - 2}
    | tieneBalas arma = arma {cantidadDeBalas = cantidadDeBalas arma - 1}
    | otherwise = arma

cargadorLLeno :: Arma -> Bool
cargadorLLeno arma = cantidadDeBalas arma == capacidadCargador arma

tieneBalas:: Arma -> Bool
tieneBalas arma = cantidadDeBalas arma > 0

-- 3) Hacer que Rambo dispare todo a la vez
dispararTodo:: Rambo -> Rambo
dispararTodo rambo = Rambo (dispararArma (armaPrincipal rambo)) (dispararArma (armaSecundaria rambo))

rambo = Rambo{
    armaPrincipal = Arma 20 50,
    armaSecundaria = Arma 25 25
}


-- ========================================================================================
-- =                                       CLASE 4                                        =
-- ========================================================================================

-- ============================================ COMPOSICION DE FUNCIONES ============================================
-- nota:: Alumno -> Int
-- esMenorAOcho:: Int -> Bool
-- not:: Bool -> Bool

-- promociona:: Alumno -> Bool
-- promociona alumno = (not.esMenorAOcho.nota) alumno



-- ============================================ CURRIFICACION Y APLICACION PARCIAL ============================================

-- f:: a -> b -> c -> d == f:: a -> (b -> (c -> d)) Basicamente se puede postergar la aplicacion de una funcion

-- ============================================ NOTACION POINT FREE ============================================

-- promociona alumno = (not. (<8).nota) alumno

-- Variante POINT FREE
-- promociona = (not. (<8).nota)


-- ====================== Practica ======================

-- Inferencia
    -- a) (.):: (b->c)->(a->b)->(a->c)
    -- b) f = (>0).g.h.i.(*3)
    -- f:: Num a => a -> Bool

-- Para un dominio dado con Clientes y Productos definir
data Cliente = Cliente {
    saldo::Float,
    esVip::Bool,
    nombre::String
} deriving(Eq, Show)

data Producto = Producto{
    tipo:: String,
    precio:: Float
} deriving(Eq, Show)

cambiarSaldo cliente delta = cliente{
    saldo = saldo cliente + delta
}

nuevoClienteVIP:: String -> Cliente -- Ejemplo de aplicacion parcial, espera una funcion con el 3er parametro del cliente para instanciar un Cliente
nuevoClienteVIP = Cliente 0 True

comprar:: Producto -> Cliente -> Cliente
comprar producto cliente = (cambiarSaldo cliente.negate.precioNeto) producto
precioNeto:: Producto -> Float
precioNeto = (*1.21).precio

comprarEnPromocion:: Producto -> Producto -> Float -> Cliente -> Cliente -- Se puede hacer con flip tambien
comprarEnPromocion prod1 prod2 descuento = (`cambiarSaldo`descuento) . comprar prod2 . comprar prod1 -- Se usa cambiarSaldo como infija para acomodar los parametros



-- ========================================================================================
-- =                                       CLASE 5                                        =
-- ========================================================================================

-- ============================================ ORDEN SUPERIOR ============================================
data Carta = Carta{
    nombreCarta::String,
    tags::[String],
    velocidad:: Int,
    altura:: Int,
    peso:: Int,
    fuerza:: Int,
    peleas:: Int
} deriving(Eq, Show)

ganadoraSegun:: (Carta -> Int) -> Carta -> Carta -> Carta
ganadoraSegun criterio carta1 carta2
    | criterio carta1 > criterio carta2 = carta1
    | otherwise = carta2

-- ============================================ EXPRESIONES LAMBDA ============================================
ganadoraSegunIMC = ganadoraSegun (\carta -> peso carta `div` altura carta ^2)


-- ============================================ LISTAS ============================================

-- [a] solo admiten un unico tipo de dato por lista

-- Usando pattern matching retorno la cabeza o la cola de la lista
--head:: [a] -> a
--head (x:_) = x

--tail:: [a] -> [a]
--tail (_:xs) = xs

--null:: [a] -> Bool
--null [] = True
--null _ = False

tamanio:: [a] -> Int -- En haskell se llama length
tamanio [] = 0
tamanio (_:xs) = 1 + tamanio xs

elemento:: Eq a => a -> [a] -> Bool -- En haskell se llama elem
elemento _ [] = False
elemento x (y:ys) = y == x || elemento x ys

estaOrdenada:: Ord a => [a] -> Bool
estaOrdenada [] = True
estaOrdenada [x] = True
estaOrdenada (x:y:ys) = x < y && estaOrdenada (y:ys)


-- ============================================ LISTAS EN ALTO NIVEL ============================================

-- ====================== MAP ======================
-- Quiero el nombre de cada carta
nombres:: [Carta] -> [String]
nombres = map nombreCarta

-- Quiero la fuerza de cada carta
fuerzas:: [Carta] -> [Int]
fuerzas = map fuerza

-- Quiero la longitud del nombre de cada carta
longitudDeNombres:: [Carta] -> [Int]
longitudDeNombres = map (length . nombreCarta)

-- ====================== FILTER ======================
-- Quiero las cartas de superheroes sin peleas ganadas
nuevos:: [Carta] -> [Carta]
nuevos = filter ((==0).peleas)

-- Cartas con cuyos nombres tienen "X"
conX:: [Carta] -> [Carta]
conX = filter (elem 'X'.nombreCarta)

-- Cartas con mas peso que altura
pesadas:: [Carta] -> [Carta]
pesadas = filter (\carta -> peso carta > altura carta)

-- ====================== ALL y ANY ======================
-- Quiero saber si hay cartas de superheroes nuevos
hayNuevos:: [Carta] -> Bool
hayNuevos = any ((==0).peleas)

-- Si todos los nombres tienen 'X'
todosConX:: [Carta] -> Bool
todosConX = all (elem 'X'.nombreCarta)

-- Si existen cartas con mas peso que altura
hayPesada:: [Carta] -> Bool
hayPesada = any (\carta -> peso carta > altura carta)

-- ====================== FOLD ======================
-- Quiero saber el total de peleas ganadas
peleasTotales:: [Carta] -> Int
peleasTotales = foldr (\carta acum -> acum + peleas carta) 0

-- Todos los nombres de un string intercalados con ";"
nombresSeparados:: [Carta] -> String
nombresSeparados = foldr (\carta acum -> nombreCarta carta ++ ";" ++ acum) ""

-- La carta con la mayor fuerza
masFuerte:: [Carta] -> Carta
masFuerte cartas = foldr (ganadoraSegun fuerza) (head cartas) (tail cartas)

masFuerte1:: [Carta] -> Carta
masFuerte1 = foldr1 (ganadoraSegun fuerza)

-- El fold convierte 1:2:3:[] en 1+2+3+0
-- cambia los cons por la funcion reductora y la lista vacia por la semilla

-- ====================== PRACTICA ======================
ponerTag:: String -> Carta -> Carta
ponerTag tag carta = carta {tags = tag : tags carta}

quitarTag:: String -> Carta -> Carta
quitarTag tag carta = carta {tags = filter (/= tag) (tags carta)}

-- Punto 1
batiNombres:: [Carta] -> [String]
batiNombres = filter ((== "bat"). take 3) . map nombreCarta

-- Punto 2
hayCartasConTodosLosTagsMuyLargos:: [Carta] -> Bool
hayCartasConTodosLosTagsMuyLargos = any (all ((>10). length) . tags)

-- Punto 3
aliensCorregidos:: [Carta] -> [Carta]
aliensCorregidos = map (ponerTag "alien" . quitarTag "alguien") . filter (elem "alguien". tags)