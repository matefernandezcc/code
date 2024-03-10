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
notaFinal alumno = Nota ((valor(notaFuncional alumno) + valor(notaLogico alumno) + valor(notaObjetos alumno)) `div` 3) "Nota final"

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

