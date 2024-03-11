-- Enunciado: https://docs.google.com/document/d/e/2PACX-1vRluMJi1uEVHvGh-c8PAq82yVUqjyHMVwhHWIW3G2CRVmferWQeE59Vpwqmmtvhew-UueX2rdvKALLD/pub
-- ====================== DATOS ======================
type Barrio = String
type Mail = String
type Requisito = Depto -> Bool
type Busqueda = [Requisito]

data Depto = Depto {
 ambientes :: Int,
 superficie :: Int,
 precio :: Int,
 barrio :: Barrio
} deriving (Show, Eq)

data Persona = Persona {
   mail :: Mail,
   busquedas :: [Busqueda]
}

ordenarSegun :: (a -> a -> Bool) -> [a] -> [a]
ordenarSegun _ [] = []
ordenarSegun criterio (x:xs) =
 (ordenarSegun criterio . filter (not . criterio x)) xs ++
 [x] ++
 (ordenarSegun criterio . filter (criterio x)) xs

between :: Ord a => a -> a -> a -> Bool
between cotaInferior cotaSuperior valor =
 valor <= cotaSuperior && valor >= cotaInferior

deptosDeEjemplo = [
 Depto 3 80 7500 "Palermo",
 Depto 1 45 3500 "Villa Urquiza",
 Depto 2 50 5000 "Palermo",
 Depto 1 45 5500 "Recoleta"]

-- ====================== Punto 1 ======================
-- 1.a
mayor :: Ord a => (t -> a) -> t -> t -> Bool
mayor f x y = f x > f y

menor :: Ord a => (t -> a) -> t -> t -> Bool
menor f x y = f x < f y

-- b
ejemploDeOrdenarSegun = ordenarSegun (mayor length) ["1", "esteTercero", "dos"]


-- ====================== Punto 2 ======================
-- 2.a
ubicadoEn:: [Barrio] -> Depto -> Bool
ubicadoEn barrios = (`elem` barrios) . barrio

--2.b