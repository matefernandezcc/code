-- ================================= Gravity Falls =================================

-- ================================= 1er Parte =================================
data Criatura = Criatura {
    peligrosidad:: Int,
    puedeDeshacerser:: Persona -> Bool
} deriving Show

siempreDetras = Criatura {
    peligrosidad = 0,
    puedeDeshacerser = (\_ -> False)
}

gnomos = Criatura {
    peligrosidad = 2^cantidad,
    puedeDeshacerser = (\_ -> False)
}


type Persona = String