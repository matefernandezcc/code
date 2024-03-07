// https://docs.google.com/document/d/1_SjhYafWzoMbXVYeRYEg8ajdnGGrriq2oq1JFLd7yiw/edit
//	 _____________________________________________________________________
//	|													  				  |
//	|						  	 USUARIOS					  			  |
//	|_____________________________________________________________________|

class Usuario{
	var suscripcion
	var plata = 100
	
	method suscripcion() = suscripcion
	method actualizarSuscripcion(unaSuscripcion){
			suscripcion = unaSuscripcion	
	}
	
	method puedeJugar(juego) = suscripcion.puedeJugar(juego)
	method costoSuscripcion() = suscripcion.costo()
	method pagarSuscripcion() {
		if(self.puedePagarSuscripcion()){
			plata -= self.costoSuscripcion()
		} else {
			self.error("No puedo pagar")
		}
	}
	
	method puedePagarSuscripcion() = self.costoSuscripcion() <= plata 
}

object premium {
	method puedeJugar(juego) = true
	method costo() = 50
}

object base {
	method puedeJugar(juego) = juego.esBarato()
	method costo() = 25
}

class SuscripcionSegunCategoria{
	method puedeJugar(juego) =
		juego.esDeCategoria(self.categoriaDeseada())
	
	method categoriaDeseada()
}

object infantil inherits SuscripcionSegunCategoria{
	override method categoriaDeseada() = "Infantil"
	method costo() = 10
}

object prueba inherits SuscripcionSegunCategoria{
	override method categoriaDeseada() = "Demo"
	method costo() = 0
}


//	 _____________________________________________________________________
//	|													  				  |
//	|						   		JUEGOS					  			  |
//	|_____________________________________________________________________|

class Juego {
	const nombre
	var property precio
	const property categoria
	
	method esDeCategoria(categoriaBuscada) = categoria == categoriaBuscada
	method seLlama(unNombre) = nombre == unNombre
	method esBarato(juego) = juego.precio() < 30
}

class NoExisteElJuegoError inherits Exception{}

object gameflix{
	const catalogoJuegos = #{}
	const usuarios = #{}
	
	method filtrarPorCategoria(categoria){
		catalogoJuegos.filter{juego => juego.esDeCategoria(categoria)}
	}
	
	method buscarJuego(juego){
		try{
			return catalogoJuegos.find{unJuego => unJuego.seLlama(juego)}
		} catch e: Exception {
			throw new NoExisteElJuegoError(message = "No hay juego con ese nombre")
		}
	}
	
	method recomendarJuego() = catalogoJuegos.anyOne()
	
	method cobrar(){
		usuarios.forEach {usuario => self.tratarDeCobrar(usuario)}
	}
	
	method tratarDeCobrar(usuario) {
		try {
			usuario.pagarSuscripcion()
		} catch e: Exception {
			usuario.actualizarSuscripcion(prueba)
		}
	}
}

