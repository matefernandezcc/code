/* Operaciones con Listas
* size()
* head()
* filter(criterio)
* map(transformacion)
* all(criterio)
* any(criterio)
* (sum)
* add(elemento)
* remove(elemento)
* forEach(operacion)
*/

const lista = [1,2,3]

class Vaca {
	var energia = 0
	
	method estaContenta() {
		if(energia > 1){
			return 1
		}
		else{
			return 0
		}
	}
	
	method comer(){energia = self.energia() + 2}
	
	method ordeniar(){energia = self.energia() - 1}
	
	method energia() = energia
}

// Pasar metodos como parametro opcion 1
object criterioEstaContenta {
	method apply(vaca) = vaca.estaContenta()
}

object criterioOrdeniar {
	method apply(vaca) = vaca.ordeniar()
}

// Pasar metodos como parametro opcion 2 con bloques
// vacas.forEach{vaca => vaca.ordeniar()}


// Igualdad, identidad y mutabilidad


