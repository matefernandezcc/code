import Text.Show.Functions
import Data.List
-- ================================= Toy Story =================================
data Juguete = Juguete{
    nombre:: String,
    duenio:: String,
    facha:: Double,
    accesorios:: [Accesorio],
    vivo::Bool
} deriving Show

data Accesorio = Accesorio{
    efecto:: Efecto,
    eficacia:: Double
} deriving Show

type Efecto = Double -> Juguete -> Juguete

-- ================================= Punto 1 =================================
lucirAmenazante :: Efecto
lucirAmenazante eficacia = modificarFacha (10 + eficacia)

vieneAndy :: Efecto
vieneAndy _ juguete = juguete {vivo = False}

masSteel:: Efecto
masSteel eficacia juguete = cambiarNombre "Max Steel" . modificarFacha (eficacia * largoDeNombre juguete) $ juguete

quemadura:: Double -> Efecto
quemadura grado eficacia = modificarFacha fachaADisminuir
    where fachaADisminuir = -(grado*(eficacia+2))

largoDeNombre = genericLength . nombre

cambiarNombre nombre juguete = juguete {nombre = nombre}

modificarFacha cantidad juguete = juguete {facha = facha juguete + cantidad}



-- ================================= Punto 2 =================================
serpienteEnBota:: Accesorio
serpienteEnBota = Accesorio{
    efecto = lucirAmenazante,
    eficacia = 2
}

revolver:: Accesorio
revolver = Accesorio{
    efecto = masSteel,
    eficacia = 5
}

escopeta:: Accesorio
escopeta = Accesorio{
    efecto = masSteel,
    eficacia = 20
}

lanzaLlamas:: Accesorio
lanzaLlamas = Accesorio{
    efecto = quemadura 3,
    eficacia = 8.5
}



-- ================================= Punto 3 =================================
woody:: Juguete
woody = Juguete{
    nombre = "Woody",
    duenio = "Andy",
    vivo = True,
    facha = 100,
    accesorios = [serpienteEnBota, revolver]
}

soldado:: Juguete
soldado = Juguete{
    nombre = "Soldado",
    duenio = "Andy",
    vivo = True,
    facha = 5,
    accesorios = [lanzaLlamas]
}

barbie:: Juguete
barbie = Juguete{
    nombre = "Barbie",
    duenio = "Dany",
    vivo = False,
    facha = 95.5,
    accesorios = [lanzaLlamas, escopeta, revolver]
}



-- ================================= Punto 4 =================================