import Text.Show.Functions
import System.Win32 (xBUTTON1)
--                  ========================================================================================
--                  =                                       CLASE 4                                        =
--                  ========================================================================================

--          ==============================================  TUPLAS ==============================================

-- persona nombre apellido edad
type Persona = (String,String,Integer)
edu = ("Edu", "Montecchia", 27)

----------------------------------------------- Operaciones de Acceso a Tuplas
nombre (n,_,_) = n
apellido (_,a,_) = a
edad (_,_,e) = e

----------------------- cumplirAnios
cumplirAnios:: Persona -> Persona
cumplirAnios persona = (nombre persona, apellido persona, edad persona + 1) -- Esto suma un solo año si quiero sumar dos hay que llamar multiples veces a la funcion

eduCon2AniosMas = (cumplirAnios . cumplirAnios) edu

----------------------- tieneNombreLargo
tieneNombreLargo:: Persona -> Bool
tieneNombreLargo = esNombreLargo . nombre

type Nombre = String
esNombreLargo:: Nombre -> Bool
esNombreLargo nombre = length nombre > 10


--                  ========================================================================================
--                  =                                       CLASE 7                                        =
--                  ========================================================================================

--          ==============================================  LISTAS ==============================================

----------------------------------------------- Recursividad en listas

-- reducir para permitir la definicion de funciones recursivas
reducirV1 [] semilla _ = semilla
reducirV1 (x:xs) semilla f = f x (reducirV1 xs semilla f)

ejemploDeUsoReducir = reducirV1 [4,2,8,1] 0 (+) -- Es equivalente a una sumatoria

-- Sumatoria
sumatoria lista = reducirV1 lista 0 (+)

-- Productoria
productoria lista = reducirV1 lista 1 (*)



--          ==============================================  FOLD ==============================================

----------------------------------------------- Reducir version fold
reducir _ casoBase [] = casoBase
reducir funcion casoBase (x:xs) = funcion x (reducir funcion casoBase xs)

-- Longitud
longitud = reducir (\_ acumulado -> 1 + acumulado) 0 -- la funcion lamba tiene que esperar si o si 2 parametros

----------------------------------------------- Fold
-- foldl funcion semilla lista


