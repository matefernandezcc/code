import Text.Show.Functions
-- Enunciado: https://docs.google.com/document/d/e/2PACX-1vQJX3IJvFA4MxrMj3faBbktGAllV_2_3r647kRwUTPGfwfC8TsIn23knLTzBV2jFpORjXpUmKAAPSL9/pub
-- ================================= Harry Potter =================================
data Mago = Mago{
    nombre:: String,
    edad:: Int,
    salud:: Int,
    hechizos::[Hechizo]
} deriving(Show)

harry = Mago {
    nombre = "Harry Potter",
    edad = 19,
    salud = 10,
    hechizos = [confundus, sectumSempra]
}

hermione = Mago {
    nombre = "Hermione",
    edad = 17,
    salud = 6,
    hechizos = [confundus, sectumSempra]
}

rincenwind = Mago {
    nombre = "Rincenwind",
    edad = 8,
    salud = 15,
    hechizos = []
}



-- ================================= Punto 1 =================================
type Hechizo = Mago -> Mago

lagrimaFenix :: Int ->  Hechizo
lagrimaFenix  = quitarVida
quitarVida:: Int -> Hechizo
quitarVida valor mago = mago{salud = salud mago - valor}


sectumSempra :: Hechizo
sectumSempra mago
    | salud mago > 10 = quitarVida 10 mago
    | otherwise = quitarVida (salud mago `div`  2) mago


obliviate :: Int -> Hechizo
obliviate cantHechizos mago = mago {hechizos = drop cantHechizos (hechizos mago)}


confundus :: Hechizo
confundus mago = primerHechizo mago mago
primerHechizo :: Mago -> Hechizo
primerHechizo = head.hechizos



-- ================================= Punto 2 =================================
poder:: Mago -> Int
poder mago = edad mago * cantidadHechizos mago + salud mago
cantidadHechizos:: Mago -> Int
cantidadHechizos = length . hechizos

daño:: Mago -> Hechizo -> Int
daño mago hechizo = salud (hechizo mago)

diferenciaDePoder:: Mago -> Mago -> Int
diferenciaDePoder mago1 mago2 = abs (poder mago1 - poder mago2)



-- ================================= Punto 3 =================================
data Academia = Academia {
 magos :: [Mago],
 examenDeIngreso :: Mago -> Bool
} deriving(Show)

    --3.a
rincenwindSinHechizos:: Academia -> Bool
rincenwindSinHechizos academia = estaRincenwind academia && sinHechizos rincenwind
estaRincenwind:: Academia -> Bool
estaRincenwind academia = any (\mago -> nombre mago == "Rincenwind") (magos academia)
sinHechizos:: Mago -> Bool
sinHechizos = null . hechizos

    --3.b
ñoños:: Academia -> Bool
ñoños academia = all esÑoño $ magosViejos academia
magosViejos:: Academia -> [Mago]
magosViejos academia = filter esViejo $ magos academia
esViejo:: Mago -> Bool
esViejo = (>50) . edad
esÑoño:: Mago -> Bool
esÑoño mago = ((3*edad mago <  ) . length . hechizos) mago

    --3.c
noPasanExamen:: Academia -> Int
noPasanExamen academia = length (filter (pasaExamen academia) (magos academia))
pasaExamen :: Academia -> Mago -> Bool
pasaExamen    = examenDeIngreso 

-- ================================= Punto 4 =================================
f x [y] = y
f x (y1:y2:ys)
     | x y1 >= x y2 = f x (y1:ys)
     | otherwise = f x (y2 : ys)

-- El codigo es una funcion que ordena los elementos de una lista de mayoar a menor dependiendo de un criterio dado
-- esto lo hace y con cada iteracion va reduciendo la lista hasta quedar un unico elemento que seria el mayor de toda la lista
-- es basicamente un maxSegun criterio lista

maxSegun:: Ord a1 => (a2 -> a1) -> [a2] -> a2
maxSegun criterio [y] = y
maxSegun criterio (y1:y2:ys)
     | criterio y1 >= criterio y2 = maxSegun criterio (y1:ys)
     | otherwise = maxSegun criterio (y2 : ys)


    --4.b
mejorHechizoContra :: Mago -> Mago -> Hechizo
mejorHechizoContra magoPrimero magoSegundo = maxSegun (saludDespuesDelHechizo magoPrimero) (hechizos magoSegundo)
saludDespuesDelHechizo :: Mago-> Hechizo  -> Int
saludDespuesDelHechizo  mago hechizo = salud (hechizo mago)

mejorOponente :: Mago -> Academia -> Mago
mejorOponente mago academia = maxSegun (diferenciaDePoder mago) (magos academia)

-- ================================= Punto 5 =================================
noPuedeGanarle :: Mago -> Mago -> Bool
noPuedeGanarle mago1 mago2 = salud mago1 == leTiraTodosLosHechizos mago1 mago2

leTiraTodosLosHechizos:: Mago -> Mago -> Int
leTiraTodosLosHechizos magoPrimero magoSegundo = salud (foldl (\acc x -> x acc) magoPrimero (hechizos magoSegundo))
