{- HLINT ignore "Redundant bracket" -}
{- HLINT ignore "Use const" -}
{- HLINT ignore "Eta reduce" -}  
import Text.Show.Functions

-- ========================================================== Gravity Falls ==========================================================
        
-- ================================= Modelado de Estructuras =================================

-- ======================= Personas =======================
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

bart = Persona {
    edad = 13,
    items = ["patineta", "aguaBendita"],
    nivelExperiencia = 10
}


-- ======================= Criaturas =======================
data Criatura = Criatura {
    peligrosidad:: Int,
    criterioParaDeshacer:: Persona -> Bool
} deriving Show

siempredetras = Criatura {
    peligrosidad = 0,
    criterioParaDeshacer = (\_ -> False)
}

gnomos cantidad = Criatura {
    peligrosidad = 2 ^ cantidad,
    criterioParaDeshacer = tieneSopladorDeHojas
}

fantasma asuntoPendiente poder = Criatura {
    peligrosidad = poder * 20,
    criterioParaDeshacer = asuntoPendiente
}

fantasmaDeLaB = fantasma (\persona -> nivelExperiencia persona > 1000) 10

fantasmas = map (fantasma (tieneItem "aguaBendita")) [1..10]
diezGnomos = gnomos 10



-- ================================= Funciones Auxiliares =================================
tieneItem:: Item -> Persona -> Bool
tieneItem item = elem item . items

tieneSopladorDeHojas:: Persona -> Bool
tieneSopladorDeHojas = tieneItem "sopladorDeHojas"



-- ================================= Funciones Pedidas =================================
-- ======================= Punto 2 =======================
ganarExperiencia :: Persona -> Int -> Persona
ganarExperiencia persona cantidad =
    persona {
        nivelExperiencia = nivelExperiencia persona + cantidad
    }
    -- Esto crea una nueva mabel con sus campos nivelExperiencia modificados y todos los demas quedan iguales

enfrentarse:: Persona -> Criatura -> Persona
enfrentarse persona criatura    
    | criterioParaDeshacer criatura persona = ganarExperiencia persona (peligrosidad criatura)
    | otherwise = escaparse
    where escaparse = ganarExperiencia persona 1


-- ======================= Punto 3 =======================
enfrentarTodas :: Foldable t => Persona -> t Criatura -> Persona
enfrentarTodas persona = foldl enfrentarse persona


enfrentarse' :: Criatura -> Persona -> Persona
enfrentarse' = flip enfrentarse
enfrentarTodos :: Persona -> [Criatura] -> Persona
enfrentarTodos persona criaturas = foldr (.) id (reverse (map enfrentarse' criaturas)) persona