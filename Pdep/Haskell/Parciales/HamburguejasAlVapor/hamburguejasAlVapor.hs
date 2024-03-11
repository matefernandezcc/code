-- ================================= Hamburguejas al vapor =================================

data Hamburguesa = Hamburguesa {
    nombreHamburguesa :: String,
    ingredientes :: [Ingrediente]
} deriving (Show, Eq)

data Bebida = Bebida {
    nombreBebida :: String,
    tamanioBebida :: Int,
    light :: Bool
} deriving (Show, Eq)

type Combo = (Hamburguesa, Bebida, Acompaniamiento)
type Ingrediente = String
type Acompaniamiento = String


hamburguesa (h, _, _) = h
bebida (_, b, _) = b
acompaniamiento (_, _, a) = a

informacionNutricional = [("Carne", 250), ("Queso", 50), ("Pan", 20), ("Panceta", 541), ("Lechuga", 5), ("Tomate", 7)]

condimentos = ["Barbacoa", "Mostaza", "Mayonesa", "Salsa big mac", "Ketchup"]

comboQyB =(qyb, cocaCola, "Papas")
cocaCola = Bebida "Coca Cola" 2 False
qyb = Hamburguesa "QyB" ["Pan", "Carne", "Queso", "Panceta", "Mayonesa", "Ketchup", "Pan"]

-- ================================= Punto 1 =================================
calorias:: Ingrediente -> Integer
calorias ingrediente = retornarCaloriasTupla (filter (\(a,b) -> ingrediente == a) informacionNutricional)

retornarCaloriasTupla:: [(String, Integer)] -> Integer
retornarCaloriasTupla [] = 10
retornarCaloriasTupla [(a,b)] = b

-- ================================= Punto 2 =================================
esMortal:: Combo -> Bool
esMortal combo = not (light (bebida combo) && acompaniamiento combo /= "Ensalada") || esUnaBomba (hamburguesa combo)

esUnaBomba:: Hamburguesa -> Bool
esUnaBomba hamburguesa =
    any (\ingrediente -> calorias ingrediente > 300) (ingredientes hamburguesa) ||
    ((>1000) . sum . map calorias) (ingredientes hamburguesa)


-- ================================= Punto 3 =================================
-- a) agrandarBebida
agrandarBebida:: Combo -> Combo
agrandarBebida (h,b,a) = (h, Bebida (nombreBebida b) (tamanioBebida b + 1) (light b), a)

-- b) cambiarAcompanamientoPor
cambiarAcompanamientoPor:: Acompaniamiento -> Combo -> Combo
cambiarAcompanamientoPor acompaniamiento (h,b,_) = (h,b,acompaniamiento)

-- c) peroSin
peroSin:: Criterio -> Integer -> Combo -> Combo
peroSin criterio valor (h,b,a) = (excluir criterio valor h, b, a)

type Criterio = String
excluir:: Criterio -> Integer -> Hamburguesa -> Hamburguesa
excluir criterio valor hamburguesa
    | criterio == "esCondimento" = hamburguesa {ingredientes = filter (not . esCondimento) (ingredientes hamburguesa)}
    | criterio == "masCaloricoQue" = hamburguesa {ingredientes = filter (not . masCaloricoQue valor) (ingredientes hamburguesa)}
    | criterio == "sinQueso" = hamburguesa {ingredientes = filter (/= "Queso") (ingredientes hamburguesa)}

esCondimento:: Ingrediente -> Bool
esCondimento ingrediente = ingrediente `elem` condimentos

masCaloricoQue:: Integer -> Ingrediente -> Bool
masCaloricoQue valor ingrediente = calorias ingrediente > valor


-- ================================= Punto 4 =================================
ejemploConsulta = (peroSin "sinQueso" 0 . peroSin "masCaloricoQue" 400. peroSin "esCondimento" 0. cambiarAcompanamientoPor "Ensalada" . agrandarBebida ) comboQyB
-- Para que esta consulta de al comboQyB como no mortal hace falta que el combo tenga una bebida light