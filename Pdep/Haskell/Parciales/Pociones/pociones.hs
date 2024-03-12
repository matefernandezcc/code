import Text.Show.Functions
-- Enunciado: https://docs.google.com/document/d/e/2PACX-1vQX84Z8tKK_1tZtS27zFcqovm8zwTUSPDmPqJvyC5IoODbk9YQtLxxbfAftwLBwFH7a3J3WDz0BRg9k/pub
-- ================================= Harry Potter Pociones =================================
data Persona = Persona {
  nombrePersona :: String,
  suerte :: Int,
  inteligencia :: Int,
  fuerza :: Int
} deriving (Show, Eq)

data Pocion = Pocion {
  nombrePocion :: String,
  ingredientes :: [Ingrediente]
} deriving (Show)

type Efecto = Persona -> Persona

data Ingrediente = Ingrediente {
  nombreIngrediente :: String,
  efectos :: [Efecto]
} deriving (Show)

nombresDeIngredientesProhibidos = [
 "sangre de unicornio",
 "veneno de basilisco",
 "patas de cabra",
 "efedrina"]

maximoSegun :: Ord b => (a -> b) -> [a] -> a
maximoSegun _ [ x ] = x
maximoSegun  f ( x : y : xs)
  | f x > f y = maximoSegun f (x:xs)
  | otherwise = maximoSegun f (y:xs)

persona = Persona "Juan" 50 70 60
pocion = Pocion "Pocion de Fuerza" [Ingrediente "Piedra lunar" [\p -> p {fuerza = fuerza p + 10}, \p -> p {fuerza = fuerza p + 11}, \p -> p {fuerza = fuerza p + 12}]]
pocion2 = Pocion "Pocion de Suerte" [Ingrediente "Piedra lunar" [\p -> p {suerte = suerte p + 11}, \p -> p {suerte = suerte p + 12}]]
pocion3 = Pocion "Pocion de Inteligencia" [Ingrediente "Piedra lunar" [\p -> p {inteligencia = inteligencia p + 10}, \p -> p {inteligencia = inteligencia p + 11}, \p -> p {inteligencia = inteligencia p + 12}, \p -> p {inteligencia = inteligencia p + 2}, \p -> p {inteligencia = inteligencia p + 1}]]
pocion4 = Pocion "Pocion de Inteligencia 2" [Ingrediente "Piedra lunar" [\p -> p {inteligencia = inteligencia p + 10}, \p -> p {inteligencia = inteligencia p + 11}, \p -> p {inteligencia = inteligencia p + 12}, \p -> p {inteligencia = inteligencia p + 2}, \p -> p {inteligencia = inteligencia p + 1}]]
-- ================================= Punto 1 =================================
niveles:: Persona -> [Int]
niveles persona = [fuerza persona, suerte persona, inteligencia persona]

sumaDeNiveles:: Persona -> Int
sumaDeNiveles = sum . niveles

diferenciaDeNiveles:: Persona -> Int
diferenciaDeNiveles persona = maximoNivel persona - minimoNivel persona
maximoNivel :: Persona -> Int
maximoNivel = maximum . niveles
minimoNivel :: Persona -> Int
minimoNivel = minimum . niveles

nivelesMayoresA:: Int -> (Persona -> Int)
nivelesMayoresA n = length . filter (>n) . niveles

-- ================================= Punto 2 =================================
efectosDePocion:: Pocion -> [Efecto]
efectosDePocion = concatMap efectos . ingredientes -- los efectos no se pueden mostrar por consola ya que son funciones

-- ================================= Punto 3 =================================
pocionesHardcore:: [Pocion] -> [String]
pocionesHardcore =  map nombrePocion . filter ((>4).length.efectosDePocion) -- faltan los nombres [String] #TODO

pocionesProhibidas:: [Pocion] -> Int
pocionesProhibidas pociones = (. filter (\p -> tieneIngredienteProhibido (ingredientes p) )) pociones

tieneIngredienteProhibido:: [Ingrediente] -> Bool
tieneIngredienteProhibido ingredientes = (. concat nombresDeIngredientesProhibidos) ingredientes