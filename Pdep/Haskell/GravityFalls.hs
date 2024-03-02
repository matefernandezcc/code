{- HLINT ignore "Redundant bracket" -}
{- HLINT ignore "Use const" -}
{- HLINT ignore "Eta reduce" -}  
import Text.Show.Functions
-- ================================= Gravity Falls =================================

-- ================================= 1er Parte =================================

    -- ================================= Punto 1 =================================
-- ================================= Modelado de Criaturas =================================
data Criatura = Criatura {
    peligrosidad:: Int,
    criterioParaDeshacer:: Persona -> Bool
} deriving Show

siempreDetras = Criatura {
    peligrosidad = 0,
    criterioParaDeshacer = (\_ -> False)
}

gnomos cantidad = Criatura {
    peligrosidad = 2 ^ cantidad,
    criterioParaDeshacer = tieneSopladorDeHojas
}
tieneItem item = elem item . items
tieneSopladorDeHojas = tieneItem "sopladorDeHojas"
diezGnomos = gnomos 10


fantasma asuntoPendiente poder = Criatura {
    peligrosidad = poder * 20,
    criterioParaDeshacer = asuntoPendiente
}
fantasmas = map (fantasma (tieneItem "agua bendita")) [1..10]

-- casper = fantasma comprarChicle 0
-- xds = fantasma (\_ -> True) 100

fantasmaDeLaB = fantasma (\persona -> nivelExperiencia persona > 1000) 10

-- ================================= Modelado de Persona =================================
type Item = String
data Persona = Persona {
    edad:: Int,
    items:: [Item],
    nivelExperiencia:: Int
} deriving Show

mabel = Persona {
    edad = 9,
    items = ["sopladorDeHojas", "chancho"],
    nivelExperiencia = 100
}

-- ================================= Punto 2 =================================
ganarExperiencia persona cantidad = 
    persona {
        nivelExperiencia = nivelExperiencia persona + cantidad
    }

enfrentarse persona criatura 
    | criterioParaDeshacer criatura persona  = ganarExperiencia persona (peligrosidad criatura)
    | otherwise = escaparse
    where escaparse = ganarExperiencia persona 1

-- ================================= Punto 3 =================================
enfrentarTodas persona = foldl enfrentarse persona -- voy iterando cada una de las criaturas con el acumulador persona, itero a mabel n veces

enfrentarse' = flip enfrentarse
enfrentarTodos persona criaturas = foldl (.) id (map enfrentarse' criaturas) persona