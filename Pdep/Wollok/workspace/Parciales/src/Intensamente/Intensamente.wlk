class Persona {
	var property felicidad = 1000
	var emocionDominante
	var pensamientoCentral
	const property recuerdos = #{}
	
	method emocionDominante() = emocionDominante
	method pensamientoCentral() = pensamientoCentral
	
	method vivirEvento(descripcion) {
		recuerdos.add(new Recuerdo(
			fecha = new Date(),
			descripcion = descripcion,
			emocion = emocionDominante
		))
	}
	
	method convetirEnPensamientoCentral(recuerdo) {
		pensamientoCentral = recuerdo.descripcion()
	} 
	
	method disminuirFelicidad() {
		felicidad -= felicidad*0.1
	}
}


class Recuerdo{
	const property descripcion
	const fecha
	const emocion

	method asentar(persona) {
		emocion.asentar(persona, self)
	}
}

object alegria{
	method asentar(persona, recuerdo) {
		if(persona.felicidad() > 500)
			persona.convetirEnPensamientoCentral(recuerdo)
	}
}

object tristeza{
	method asentar(persona, recuerdo) {
		persona.convetirEnPensamientoCentral(recuerdo)
		persona.disminuirFelicidad()
	}
}

class EmocionApatica{
	method asentar(persona, recuerdo) {}
}