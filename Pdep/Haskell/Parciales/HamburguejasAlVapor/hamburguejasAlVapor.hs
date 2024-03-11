{- HLINT ignore "Redundant bracket" -}
{- HLINT ignore "Use const" -}
{- HLINT ignore "Eta reduce" -}  
import Text.Show.Functions
-- ================================= Hamburguejas al vapor =================================
type Ingrediente = String
data Hamburguesa = Hamburguesa {nombreHamburguesa :: String, ingredientes :: [Ingrediente]}
data Bebida = Bebida {nombreBebida :: String, tamanioBebida :: int, light :: Bool}
type Acompaniamiento = String
type Combo = (Hamburguesa, Bebida, Acompaniamiento)

hamburguesa (h, _, _) = h
bebida (_, b, _) = b
acompaniamiento (_, _, a) = a

informacionNutricional = [("Carne", 250), ("Queso", 50), ("Pan", 20), ("Panceta", 541), ("Lechuga", 5), ("Tomate", 7)]

condimentos = ["Barbacoa", "Mostaza", "Mayonesa", "Salsa big mac", "Ketchup"]

comboQyB =(qyb, cocaCola, "Papas")
cocaCola = Bebida "Coca Cola" 2 False
qyb = Hamburguesa "QyB" ["Pan", "Carne", "Queso", "Panceta", "Mayonesa", "ketchup", "Pan"]


-- ================================= Punto 1 =================================
calorias :: Ingrediente -> Int
calorias ingrediente
    | ingrediente elem (ingredientes combo) = informacionNutricional[(ingrediente, calorias)]
    | otherwise = 10

-- ================================= Punto 2 =================================
esMortal:: Combo -> Bool



-- ================================= Punto 3 =================================
agrandarBebida :: Combo -> Combo
agrandarBebida (_, (_, tamanioBebida, _), _) = (_, (_, tamanioBebida + 1, _), _)

cambiarAcompaniamientoPor :: Combo -> Acompaniamiento -> Combo
cambiarAcompaniamientoPor (_, _, AcompaniamientoViejo) Acompaniamiento = (_, _, Acompaniamieno)


esCondimento :: Ingrediente -> Bool
esCondimento ingrediente =
    
masCaloricoQue :: Ingrediente -> Int -> Bool
masCaloricoQue ingrediente maximo = False

peroSin :: Combo -> Condicion -> Combo
peroSin (_, _, _) Condicion
    | drop 
    |


-- ================================= Punto 4 =================================
agrandarBebida comboQyB
>
comboQyB =(qyb, cocaCola, "Papas")
cocaCola = Bebida "Coca Cola" 3 False
qyb = Hamburguesa "QyB" ["Pan", "Carne", "Queso", "Panceta", "Mayonesa", "ketchup", "Pan"]

cambiarAcompaniamientoPor comboQyB Ensalada

comboQyB =(qyb, cocaCola, "Ensalada")
cocaCola = Bebida "Coca Cola" 3 False
qyb = Hamburguesa "QyB" ["Pan", "Carne", "Queso", "Panceta", "Mayonesa", "ketchup", "Pan"]

peroSin comboQyB esCondimento

comboQyB =(qyb, cocaCola, "Ensalada")
cocaCola = Bebida "Coca Cola" 3 False
qyb = Hamburguesa "QyB" ["Pan", "Carne", "Queso", "Panceta", "Pan"]

peroSin comboQyB masCaloricoQue 400

comboQyB =(qyb, cocaCola, "Ensalada")
cocaCola = Bebida "Coca Cola" 3 False
qyb = Hamburguesa "QyB" ["Pan", "Carne", "Queso", "Pan"]

drop "Queso" Hamburguesa[]

peroSin comboQyB masCaloricoQue 400

comboQyB =(qyb, cocaCola, "Ensalada")
cocaCola = Bebida "Coca Cola" 3 False
qyb = Hamburguesa "QyB" ["Pan", "Carne", "Pan"]




