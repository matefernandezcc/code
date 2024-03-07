class Resumen {
	const property secciones = #{}
	var property introduccion
	
	method agregarSeccion(seccion) = secciones.add(seccion)
	
	method duracion() = self.duracionSecciones() + self.duracionIntro()
	method duracionSecciones() = secciones.sum{seccion => seccion.duracion()}
	method duracionIntro() = introduccion.words().size()*10

	method tieneCancion(cancion) = secciones.any{seccion => seccion.tieneCancion(cancion)}
	
	
	method referenciaA(resumen) {
		return secciones.any{seccion => seccion.referenciaA(resumen)}
	}
	
	method libreto() = (self.introduccion().words() + (self.secciones().map{seccion => seccion.speech()})).join(".")
}

class Seccion{
	const property duracion = 0
	const property speech = 0
	
	override method ==(otraSeccion){
		return duracion === otraSeccion.duracion() and speech === otraSeccion.speech()
	}
	
	method tieneCancion(cancion) = false
	method referenciaA(resumen) = false
}

class SeccionMusicalizada inherits Seccion {
	const cancion
	
	override method tieneCancion(nombre) = cancion == nombre
}

class SeccionConReferencia inherits Seccion{
	const referencia
	
	override method referenciaA(resumen) = referencia == resumen
}








