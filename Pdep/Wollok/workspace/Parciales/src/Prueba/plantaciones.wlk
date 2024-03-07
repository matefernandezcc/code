//	 _____________________________________________________________________
//	|													  				  |
//	|						  	 TERRENOS					  			  |
//	|_____________________________________________________________________|

class Terreno {
	const property cultivos = []
	
	method agregarCultivo(cultivo) {
		if(self.cumpleCondicionesDe(cultivo))
			cultivos.add(cultivo)
		else throw new Exception (message=
		"No se puede plantar " +cultivo+ " en " +self)
	}
	
	method cumpleCondicionesDe(cultivo) = 
		cultivos.size() < self.capacidadMaxima() and
		cultivo.puedePlantarseEn(self) 
	
	method mediaNutricional() =
		self.cultivos().sum{cultivo => cultivo.valorNutricionalEn(self)}
		
	method valorNeto()= (self.valorCultivos() - self.costo()).max(0) // No acepta numero negativos en cambio devuelve 0
	method valorCultivos() = 
		self.cultivos().sum{cultivo => cultivo.precioDeVentaEn(self)}
	
	method esCampoAbierto() = false
	
	// Metodos Abastractos
	method esRico()
	method costo()
	method capacidadMaxima()
}

class CampoAbierto inherits Terreno {
	const tamanio = 1000 // en Metros cuadrados
	const riquezaSuelo
	
	override method capacidadMaxima() = 4*tamanio
	override method costo() = 500*tamanio
	override method esRico() = riquezaSuelo > 100
	override method esCampoAbierto() = true
}

class Invernadero inherits Terreno {
	const costoBase = 50000
	var dispositivoInstalado
	const property capacidadMaxima // Capacidad maxima pasada como parametro
	
	override method costo() = costoBase + dispositivoInstalado.costoMantenimiento()
	
	method instalarDispositivo(dispositivo) {
		dispositivoInstalado = dispositivo
	}
	
	override method esRico() = 
		self.cultivosNoSuperanLaMitadDeCapacidad() or
		self.tieneReguladorNutricional() or
		self.humidificadorEntre20y40()
	
	method cultivosNoSuperanLaMitadDeCapacidad() = cultivos.size() <= capacidadMaxima/2
	method tieneReguladorNutricional() = dispositivoInstalado == reguladorNutricional
	method humidificadorEntre20y40() = dispositivoInstalado.humedad().between(20,40)
}

//	 _____________________________________________________________________
//	|													  				  |
//	|						  	 DISPOSITIVOS					  		  |
//	|_____________________________________________________________________|

object reguladorNutricional{
	method costoMantenimiento() = 2000
}

class Humidificador{
	const property humedad
	method costoMantenimiento() = if(humedad <= 30) 1000 else 4500
}

object panelesSolares{
	method costoMantenimiento() = -25000
}

//	 _____________________________________________________________________
//	|													  				  |
//	|						  	 CULTIVOS						  		  |
//	|_____________________________________________________________________|

class Cultivo {
	// Metodos Abstractos
	method puedePlantarseEn(terreno)
	method precioDeVentaEn(terreno)
	method valorNutricionalEn(terreno) 
}

class Papa inherits Cultivo{
	const valorNutricionalBase = 1500
	
	override method puedePlantarseEn(terreno) = true
	
	override method precioDeVentaEn(terreno) = 
		self.valorNutricionalEn(terreno)/2
	
	override method valorNutricionalEn(terreno) = 
		valorNutricionalBase + self.valorExtraPorTerrenoRico(terreno)
		
		method valorExtraPorTerrenoRico(terreno) = 
			if(terreno.esRico()) valorNutricionalBase else 0
}

class Algodon inherits Cultivo{
	override method puedePlantarseEn(terreno) = terreno.esRico()
	
	override method precioDeVentaEn(terreno) = 500
	
	override method valorNutricionalEn(terreno) = 0
}

class ArbolFrutal inherits Cultivo{
	const edad
	const fruta
	
	override method puedePlantarseEn(terreno) = terreno.esCampoAbierto()
	
	override method precioDeVentaEn(terreno) = fruta.precio()
	
	override method valorNutricionalEn(terreno) = if(edad*3 < 4000) edad*3 else 4000
}

class PalmeraTropical inherits ArbolFrutal {
	override method puedePlantarseEn(terreno) = super(terreno) and terreno.esRico()
	
	override method precioDeVentaEn(terreno) = super(terreno)*5

	override method valorNutricionalEn(terreno) = if(edad*2 < 7500) edad*2 else 7500
}	// No se me ocurre como sacar la repeticion de logica en el method valorNutricional de ArbolFrutal y Palmera

class Fruta{
	const property precio
}
