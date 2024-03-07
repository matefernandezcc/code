// https://docs.google.com/document/d/12Zz18WFOv4hVYSCtKFg4TPpQY6xi9zoDXtTYRCGnOL4/edit
//	 _____________________________________________________________________
//	|													  				  |
//	|						   ENFERMEDADES					  			  |
//	|_____________________________________________________________________|


class EnfermedadCelular {
	var property celulasAmenazadas = 1000
	
	method atenuar(celulas){
		celulasAmenazadas = (celulasAmenazadas - celulas).max(0)
	}
	
	method estaCurada() = celulasAmenazadas == 0
	
	method afectar(paciente)
}

object alopecia {
	method afectar(paciente){
		//No hace nada, ya esta pelado
	}
}

class EnfermedadInfecciosa inherits EnfermedadCelular {
	override method afectar(paciente){
		paciente.aumentarTemperatura(celulasAmenazadas / 1000)
	}
	
	method reproducirse(){
		celulasAmenazadas *= 2
	}
	
	method esAgresiva(paciente){
		return celulasAmenazadas >= 0.1 * paciente.celulas()
	}
}

class EnfermedadAutoinmune inherits EnfermedadCelular {
	var diasAfectando = 0
	
	override method afectar(paciente){
		paciente.destruirCelulas(celulasAmenazadas)
		diasAfectando += 1
	}
	
	method esAgresiva(paciente){
		return diasAfectando > 30
	}
}

object muerte{
	method afectar(paciente){
		paciente.congelar()
	}
	
	method atenuar(celulas) {
		// No se puede atenuar la muerte
	}
	
	method estaCurada() = false // No se puede curar la muerte
	
	method esAgresiva(paciente) = true	
}


//	 _____________________________________________________________________
//	|													  				  |
//	|						  	 PACIENTE				  			  	  |
//	|_____________________________________________________________________|


class Paciente {
	var property temperatura = 36
	var celulas = 100000
	const enfermedades = #{}
	
	method celulas() = celulas
	
	method aumentarTemperatura(cantidad){
		temperatura += cantidad
	}
	
	method destruirCelulas(cantidad){
		celulas -= cantidad
	}
	
	method contraerEnfermedad(enfermedad){
		enfermedades.add(enfermedad)
	}
	
	method vivir(){
		enfermedades.forEach {enfermedad => enfermedad.afectar(self)}
	}
	
	method curar(dosis){
		enfermedades.forEach {enfermedad => enfermedad.atenuar(dosis*15)}
	}
	
	method congelar(){
		temperatura = 0
	}
}


//	 _____________________________________________________________________
//	|													  				  |
//	|						  	 MEDICO					  			  	  |
//	|_____________________________________________________________________|

class Medico inherits Paciente {
	const dosis = 1
	
	method atender(paciente){
		paciente.curar(dosis)
	}
	
	override method contraerEnfermedad(enfermedad){
		super(enfermedad)
		self.atender(self)
	}
}

class JefeDeDepartamento inherits Medico {
	const subordinados = #{}
	
	method esJefeDe() = subordinados
	
	method agregarSubordinado(medico){
		subordinados.add(medico)
	}
	
	override method atender(paciente){
		try{
			subordinados.anyOne().atender(paciente)
		} catch e: Exception {}
	}
}




