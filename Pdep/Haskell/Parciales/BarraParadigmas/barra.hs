import Text.Show.Functions
-- ================================= La barra Paradigmas =================================
data Persona = Persona {
  nombrePersona :: String,
  resistencia :: Float,
  ebriedad :: Float,
  tragosTomados :: [Trago]
} deriving (Show, Eq)

data Trago = Trago {
  nombreTrago :: String,
  componentes :: [Componente]
} deriving (Show, Eq)

data Componente = Componente {
  ingrediente :: Ingrediente,
  cc :: Float
} deriving (Show, Eq)

data Ingrediente = Ingrediente {
  nombreIng :: String,
  nivelAzucar:: Float,
  nivelAlcohol :: Float,
  nivelDeColor :: Float
} deriving (Show, Eq)

trago = Trago "Wiski" [Componente Ingrediente{nombreIng= "Agua", nivelAzucar = 1, nivelAlcohol = 0, nivelDeColor = 0 } 5,Componente Ingrediente{nombreIng= "Coca", nivelAzucar = 25, nivelAlcohol = 0, nivelDeColor = 3 } 10]
mateo = Persona "mateo" 1 1 []

cambiarIngrediente :: (Float, Float, Float) -> Ingrediente -> Ingrediente
cambiarIngrediente (azucar, alcohol, color) ingrediente = ingrediente {
    nivelAzucar = nivelAzucar ingrediente + azucar,
    nivelAlcohol = nivelAlcohol ingrediente + alcohol,
    nivelDeColor = nivelDeColor ingrediente + color }

mezclar :: Float -> Componente -> [Componente] -> Componente
mezclar float componente componentes = componente{cc = 2307}
-- Defini una funcion mezclar sin sentido para testear que funcione el codigo 


-- ================================= Punto 1 =================================
    -- 1.a
aporteDeAlcohol:: Ingrediente -> Float
aporteDeAlcohol ingrediente = nivelAlcohol ingrediente - min (nivelAzucar ingrediente) (nivelDeColor ingrediente)


    -- 1.b
alcoholEfectivo:: Trago -> Float
alcoholEfectivo trago = totalAlcohol trago / totalCC trago
-- Auxiliares
totalAlcohol:: Trago -> Float
totalAlcohol = sum . map (aporteDeAlcohol . ingrediente) . componentes
totalCC:: Trago -> Float
totalCC = sum . map cc. componentes


    -- 1.c
type Tiempo = Float
batir :: Tiempo -> [Componente] -> [Componente]
batir segundos componentes = componentes
-- falta implementar


-- ================================= Punto 2 =================================
type ArmadoraDeTragos = [Componente] -> [Componente]

hacerTrago:: Trago -> ArmadoraDeTragos -> Trago
hacerTrago trago armadora = trago {componentes = armadora (componentes trago)}



-- ================================= Punto 3 =================================
agregarComponentes :: Componente -> [Componente] -> [Componente]
agregarComponentes componenteAAgregar componentes = componentes ++ [componenteAAgregar]

    --1.a
directo:: Float -> ArmadoraDeTragos
directo cantidad = agregarComponentes (hielo cantidad)

    --1.b
licuadora:: ArmadoraDeTragos
licuadora = batir 120 . agregarComponentes azucar . agregarComponentes (hielo 5)
-- Falta agregar 10 de azucar a cada componente

   --1.c
--coctelera:: Float -> Bool -> ArmadoraDeTragos
--coctelera segundos flambeado componentes
--    | flambeado == True = cambiarIngrediente (2, (alcohol (take 1 componentes)) / 2, 5) (take 1 $ componentes)
--    | otherwise = agregarComponentes (hielo 2) componentes

-- Ejemplos para testear
hielo cantidad = Componente {
    ingrediente =
    Ingrediente {
        nombreIng= "Hielo",
        nivelAzucar= 0,
        nivelAlcohol= 0,
        nivelDeColor= 0
    },
    cc = 10*cantidad
}
azucar = Componente {
    ingrediente =
    Ingrediente {
        nombreIng= "Azucar",
        nivelAzucar= 10,
        nivelAlcohol= 0,
        nivelDeColor= 0
    },
    cc = 0
}

-- ================================= Punto 4 =================================
    -- 4.a
tomar:: Persona -> Trago -> Persona
tomar persona trago = persona {
    tragosTomados = tragosTomados persona ++ [trago],
    resistencia = min 100 (resistencia persona + 2),
    ebriedad = (ebriedad persona + alcoholEfectivo trago) - resistencia persona 
}

-- ejemplo de invocacion > tomar mateo trago
-- agrega el trago wiski a sus tragos tomados y aplica los efectos

    --4.b
degustar :: Persona -> Trago -> [ArmadoraDeTragos] -> Persona
degustar persona trago = 
    foldl (\p tragoArmado -> tomar p (hacerTrago trago tragoArmado)) persona


    --4.c
-- ejemploDeDegustar = degustar mateo trago [licuadora, directo 3, coctelera 10 True]
-- no puede hacer funcionar coctelera asi que no me compila el ejemplo

