{- HLINT ignore "Redundant bracket" -}
{- HLINT ignore "Use const" -} 
import Text.Show.Functions
-- ================================= Gravity Falls =================================

-- ================================= 1er Parte =================================
-- ================================= Modelado de Criaturas =================================
data Criatura = Criatura {
    peligrosidad:: Int,
    criterioParaDeshacer:: Persona -> Bool
} deriving Show

siempreDetras = Criatura {
    peligrosidad = 0,
    criterioParaDeshacer = tieneSopladorDeHojas
}
tieneItem item = elem item . items
tieneSopladorDeHojas = tieneItem "sopladorDeHojas"

gnomos cantidad = Criatura {
    peligrosidad = 2 ^ cantidad,
    criterioParaDeshacer = (\_ -> False)
}
diezGnomos = gnomos 10


fantasma asuntoPendiente poder = Criatura {
    peligrosidad = poder * 20,
    criterioParaDeshacer = asuntoPendiente
}
fantasmas = map (fantasma (tieneItem "agua bendita")) [1..10]

-- ================================= Modelado de Persona =================================
type Item = String
data Persona = Persona {
    edad:: Int,
    items:: [Item],
    nivelExperiencia:: Int
} deriving Show

mabel = Persona {
    edad = 9,
    items = ["sopladorDeHojas"],
    nivelExperiencia = 1
}