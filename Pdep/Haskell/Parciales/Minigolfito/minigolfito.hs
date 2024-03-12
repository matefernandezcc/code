import Text.Show.Functions

-- Enunciado: https://docs.google.com/document/d/1LeWBI6pg_7uNFN_yzS2DVuVHvD0M6PTlG1yK0lCvQVE/edit
-- ================================= Minigolfito  =================================

-- Modelo inicial
data Jugador = UnJugador {
  nombre :: String,
  padre :: String,
  habilidad :: Habilidad
} deriving (Eq, Show)

data Habilidad = Habilidad {
  fuerzaJugador :: Int,
  precisionJugador :: Int
} deriving (Eq, Show)

-- Jugadores de ejemplo
bart = UnJugador "Bart" "Homero" (Habilidad 25 60)
todd = UnJugador "Todd" "Ned" (Habilidad 15 80)
rafa = UnJugador "Rafa" "Gorgory" (Habilidad 10 1)

data Tiro = UnTiro {
  velocidad :: Int,
  precision :: Int,
  altura :: Int
} deriving (Eq, Show)

type Puntos = Int

-- Funciones útiles
between n m x = x `elem` [n .. m]

maximoSegun f = foldl1 (mayorSegun f)
mayorSegun f a b
  | f a > f b = a
  | otherwise = b

-- ================================= Punto 1  =================================
    -- 1.a
type Palo = Habilidad -> Tiro
putter:: Palo
putter habilidad = UnTiro {
    velocidad = 10, 
    precision = 2* precisionJugador habilidad, 
    altura = 0
}

madera :: Palo
madera habilidad = UnTiro {
    velocidad = 100, 
    precision = div (precisionJugador habilidad) 2, 
    altura = 5
}

hierro :: Int -> Palo
hierro n habilidad = UnTiro {
    velocidad = fuerzaJugador habilidad* n, 
    precision = div (precisionJugador habilidad) n, 
    altura = max 0 (n-3)
}

    -- 1.b
palos :: [Palo]
palos = [putter, madera] ++ map hierro [1..10]


-- ================================= Punto 2  =================================
golpe:: Jugador -> Palo -> Tiro
golpe jugador palo = (palo . habilidad) jugador

-- ================================= Punto 3  =================================