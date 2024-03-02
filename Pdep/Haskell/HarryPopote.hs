{- HLINT ignore "Redundant bracket" -}
{- HLINT ignore "Use const" -}
{- HLINT ignore "Eta reduce" -} 
{- HLINT ignore "Avoid lambda" -} 
import Text.Show.Functions
-- ================================= Harry Potter =================================

-- ================================= Punto 1 =================================
data Mago = Mago {
    nombre :: String,
    edad :: Int,
    salud :: Int,
    hechizos :: [Hechizo]
}

harry = Mago {
    nombre = "Harry Potter",
    edad = 19,
    salud = 10,
    hechizos = [Confundus, SectumSempra]
}

hermione = Mago {
    nombre = "Hermione",
    edad = 17,
    salud = 6,
    hechizos = [Confundus, SectumSempra, Obliviate 1]
}

data Hechizo = LagrimaFenix { cantidad :: Int }
             | SectumSempra
             | Obliviate { cantidadOlvidar :: Int }
             | Confundus


-- ================================= Punto 2 =================================
poder :: Mago -> Int
poder (Mago _ edad salud hechizos) = salud + edad * length hechizos

daño :: Mago -> Hechizo -> Int
daño _ (LagrimaFenix _) = 0
daño mago SectumSempra
    | salud mago > 10 = 10
    | otherwise = salud mago `div` 2
daño _ (Obliviate _) = 0
daño _ Confundus = 0

diferenciaDePoder :: Mago -> Mago -> Int
diferenciaDePoder mago1 mago2 = abs $ poder mago1 - poder mago2


-- ================================= Punto 3 =================================
data Academia = Academia {
 magos :: [Mago],
 examenDeIngreso :: Mago -> Bool
}

-- Saber si hay algún mago sin hechizos cuyo nombre sea “Rincenwind”
tieneNombreYSinHechizos :: Mago -> Bool
tieneNombreYSinHechizos (Mago "Rincenwind" _ _ []) = True
tieneNombreYSinHechizos _ = False

hayMagoSinHechizosRincenwind :: Academia -> Bool
hayMagoSinHechizosRincenwind (Academia magos _) = any tieneNombreYSinHechizos magos

-- Saber si todos los magos viejos son ñoños
esViejoÑoño :: Mago -> Bool
esViejoÑoño mago = edad mago > 50 && length (hechizos mago) > 3 * edad mago

todosViejosSonÑoños :: Academia -> Bool
todosViejosSonÑoños (Academia magos _) = all esViejoÑoño (filter ((>50) . edad) magos)

-- Conocer la cantidad de magos de la academia que no pasarían el examen de ingreso
magosNoPasarianExamen :: Academia -> Int
magosNoPasarianExamen (Academia magos examen) = length (filter (not . examen) magos)


-- ================================= Punto 4 ================================= dudas
f _ [y] = y
f x (y1:y2:ys)
     | x y1 y2 = f x (y1:ys)
     | otherwise = f x (y2 : ys)


-- La función f parece ser una implementación de un algoritmo de búsqueda que toma una función y una lista, y retorna un valor de esa lista que cumple cierta condición definida por la función.*/

mejorHechizoContra :: Mago -> Mago -> Hechizo
mejorHechizoContra atacante defensor = f (\h1 h2 -> daño defensor h1 >= daño defensor h2) (hechizos atacante)

mejorOponente :: Mago -> Academia -> Mago
mejorOponente mago (Academia magos _) = f (\m1 m2 -> diferenciaDePoder mago m1 >= diferenciaDePoder mago m2) magos


-- ================================= Punto 5 ================================= Error por el tipo data en vez de type hechizo
noPuedeGanarle :: Mago -> Mago -> Bool
noPuedeGanarle mago1 mago2 = salud mago1 == leTiraTodosLosHechizos mago1 mago2

leTiraTodosLosHechizos:: Mago -> Mago -> Int
leTiraTodosLosHechizos magoPrimero magoSegundo = salud (foldl (\acc x -> x acc) magoPrimero (hechizos magoSegundo))
