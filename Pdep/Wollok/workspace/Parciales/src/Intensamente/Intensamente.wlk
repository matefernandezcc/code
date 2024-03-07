class Persona {
	var felicidad = 1000
	var emocionDominante
	
	const property recuerdos = #{}
	
	method vivirEvento(descripcion) {
		recuerdos.add(new Recuerdo(
			fecha = new Date(),
			descripcion = descripcion,
			emocion = emocionDominante
		))
	}
}


class Recuerdo{
	const descripcion
	const fecha
	const emocion
	
	method asentar() {}
}

object alegria{
	method asentar() {}
}

object tristeza{
	method asentar() {}
}

class EmocionApatica{
	method asentar() {}
}