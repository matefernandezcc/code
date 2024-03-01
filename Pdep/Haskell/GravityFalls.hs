-- ================================= Gravity Falls =================================

-- ================================= 1er Parte =================================
data Criatura = Criatura {
    peligrosidad:: Int,
    puedeDeshacerse:: Persona -> Bool
} deriving Show

siempreDetras = Criatura {
    peligrosidad = 0,
    puedeDeshacerse = (\_ -> False)
}

gnomos cantidad = Criatura {
    peligrosidad = 2^cantidad,
    puedeDeshacerse = (\_ -> False)
}
diezGnomos = gnomos 10


fantasma = Criatura {
    peligrosidad = podes * 20,
    puedeDeshacerse = (\_ -> False)
}
fantasmas = map fantasma [1..10]


type Persona = String