// ======================= Tanque =======================
class Tanque {
	const armas = []
	const tripulantes = 2
	var salud = 100
	var property prendidoFuego = false
	
	method salud() = salud
	
	method emiteCalor() = prendidoFuego || tripulantes > 3
	
	method sufrirDanio(danio) {
		salud -= danio
	}
	
	method atacar(objetivo){
		armas.anyOne().dispararA(objetivo)
	}
}

class TanqueBlindado inherits Tanque {
	const blindaje = 200
	
	method blindaje() = blindaje
	
	override method emiteCalor() = false
	
	override method sufrirDanio(danio){
		if(danio > blindaje)
			super(danio - blindaje)
	}
}

// ======================= Armas =======================
class Misil {
	const potencia
	var agotada = false
	
	method agotada() = agotada
	
	method dispararA(objetivo){
		agotada = true
		objetivo.sufrirDanio(potencia)
	}
}

class MisilTermico inherits Misil {
	override method dispararA(objetivo){
		if(objetivo.emiteCalor()){
			super(objetivo)              // Busca y ejecuta el method desde la clase superior
		}
	}
}

class Recargable { 						// Herencia
	var cargador = 100
	method recargar() { cargador = 100 }
	method agotada() = cargador <= 0
}

class Rociador inherits Recargable {
	method dispararA(objetivo){
		cargador -= 20
		self.causarEfecto(objetivo)
	}
	
	method causarEfecto(objetivo)
}

class Lanzallamas inherits Rociador{
	override method causarEfecto(objetivo){
		objetivo.prendidoFuego(true)
	}
}

class Matafuego inherits Rociador {
	override method causarEfecto(objetivo){
		objetivo.prendidoFuego(false)
	}
}

class Metralla inherits Recargable {
	const calibre
	
	method dispararA(objetivo){
		cargador -= 10
		if(calibre > 50)
			objetivo.sufrirDanio(calibre/4)
	}
}









