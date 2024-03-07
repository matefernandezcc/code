// https://docs.google.com/document/d/1_SjhYafWzoMbXVYeRYEg8ajdnGGrriq2oq1JFLd7yiw/edit
//	 _____________________________________________________________________
//	|													  				  |
//	|						  	 ARTISTAS					  			  |
//	|_____________________________________________________________________|

class Artista {
	const property estilos = #{}
	var instrumento
	
	method calidad() = self.calidadPorInstrumento() + self.calidadPorEstilos()
	
	method calidadPorEstilos() = self.cantidadDeEstilos()*5
	method cantidadDeEstilos() = estilos.size()

	method calidadPorInstrumento() = instrumento.calidad()
	
	method haceMetal(musico) = musico.estilos().contains("metal")
}


//	 _____________________________________________________________________
//	|													  				  |
//	|						  INSTRUMENTOS					  			  |
//	|_____________________________________________________________________|

class Instrumento{
	const property calidadBase
	
	method calidad() = calidadBase + self.calidadExtra()
	method calidadExtra()
}


// ======================= Guitarras =======================
class GuitarraCriolla inherits Instrumento(calidadBase = 10){
	var cuerdasSanas
	override method calidadExtra() = cuerdasSanas
}

class GuitarraElectrica inherits Instrumento(calidadBase = 15){
	var potenciaAmplificador
	override method calidadExtra() = potenciaAmplificador
}


// ======================= Bajo =======================
class Bajo inherits Instrumento(calidadBase = 5){
	const property color
	
	override method calidadExtra() = 0
}


// ======================= Bateria =======================
class Bateria inherits Instrumento{
	
}


// ======================= Voz =======================
class Voz inherits Instrumento{
	
}














