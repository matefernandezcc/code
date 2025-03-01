class Cuenta {
	var property tipo
	var property usuarioPrincipal
	
	method estado() {
		return "Tipo: " + tipo +
		", Usuario: " + usuarioPrincipal +
		", Horas restantes: " + tipo.detalleParticular()
	}
	
	method reproducirContenido(horas)
	method descargarContenido(gb)
}

class Basica inherits Cuenta {
	var property horasConsumidas
	var property limiteHoras
	
	method horasRestantes() = 
	limiteHoras - horasConsumidas

	method detalleParticular() = 
	", Horas restantes: " + self.horasRestantes()
	
	method limiteExcedido(horas) = 
	(horasConsumidas + horas) > limiteHoras
	
	override method reproducirContenido(horas) {
		if(self.limiteExcedido(horas)) {
			return "No se puede reproducir más contenido"
		}
		horasConsumidas += horas
		return 0
	}
	
	override method descargarContenido(gb) =
	"Tu plan no permite descargas"
}

class Premium inherits Cuenta {
	var property espacioConsumido
	var property limiteEspacio
	
	method espacioRestante() = 
	limiteEspacio - espacioConsumido

	method detalleParticular() = 
	", Espacio disponible: " + self.espacioRestante()
	
	method espacioExcedido(gb) = 
	(espacioConsumido + gb) > limiteEspacio
	
	override method reproducirContenido(horas) =
	"Contenido Reproducido"
	
	override method descargarContenido(gb) {
		if(self.espacioExcedido(gb)) {
			return "No hay espacio suficiente"
		}
		espacioConsumido += gb
		return 0
	}
}

class Familiar inherits Premium {
	const property perfiles = #{}
	
	method cantPerfiles() = 
	perfiles.size()

	override method detalleParticular() = 
	", Perfiles: " + self.cantPerfiles()
}
