// ======================= LENGUAJES =======================
class Lenguajes {
	const property nombre
	const antiguo = false
	
	method esAntiguo() = antiguo
	method esModerno() = not self.esAntiguo()
}

// ======================= EMPLEADOS =======================
class Empleados{
	const lenguajesSabidos = #{}
	method lenguajesSabidos() = lenguajesSabidos.copy() // Getter
	
	method aprenderLenguaje(lenguaje){
		lenguajesSabidos.add(lenguaje)
	}
	
	method sabeProgramarLenguajeAntiguo() = lenguajesSabidos.any
		{ lenguaje => lenguaje.esAntiguo() }
		
	
	method estaInvitado() = self.esCopado() or self.rolEstaInvitado()
	
	method numeroMesa() = self.cantidadLenguajesModernos()
	method cantidadLenguajesModernos() = lenguajesSabidos.count
		{ lenguaje => lenguaje.esModerno() }
	
	// Metodos Abstractos
	method esCopado() 
	method rolEstaInvitado()
}


class Desarrollador inherits Empleados {
	override method rolEstaInvitado() =
		self.sabeProgramar(wollok) or self.sabeProgramarLenguajeAntiguo()
	
	
	method sabeProgramar(lenguaje) = lenguajesSabidos.any
		{ lenguajeSabido => lenguajeSabido.nombre() == lenguaje }
		
	override method esCopado() = 
	self.sabeProgramarLenguajeAntiguo() and self.sabeProgramarLenguajeModerno()
	
	method sabeProgramarLenguajeModerno() = lenguajesSabidos.any
		{ lenguaje => lenguaje.esModerno() }
}


class Infraestructura inherits Empleados {
	var property experiencia = 12
	
	override method rolEstaInvitado() = lenguajesSabidos.size() > 5
	
	override method esCopado() = self.tieneMuchaExperiencia()
	method tieneMuchaExperiencia() = experiencia > 10
}


class Jefes inherits Empleados {
	const genteACargo = #{}
	
	override method rolEstaInvitado() = 
		self.sabeProgramarLenguajeAntiguo() and
			self.tieneACargoSoloCopados()
			
	method tomarACargo(empleado) {
		genteACargo.add(empleado)
	}
			
	method tieneACargoSoloCopados() = genteACargo.all
		{ empleado => empleado.esCopado() }
		
	override method esCopado() = false
	
	override method numeroMesa() = 99
}


// ======================= EMPRESA Y FIESTA =======================
object acme {
	const property empleados = #{}
}

class Mesa{
	const numero
	const asistentes = #{}
	
	method agregar(asistente){
		asistentes.add(asistente)
	}
}

object fiesta {
	const mesas = #{}
	
	method invitados() =
		acme.empleados().filter{empleado => empleado.estaInvitado()}
		
	method asiste(persona) {
		if(self.estaInvitado(persona)){
			self.dejarEntrar(persona)
		} else
		self.error("No estas invitado")	
	}
	
	method dejarEntrar(persona) {
		self.mesa(persona.numeroMesa()).agregar(persona)
	}
	
	method mesa(numeroMesa) {
		try{
			return mesas.find{ mesa => mesa.numero() == numeroMesa}
		} catch e : Exception  {
			const mesa = new Mesa(numero = numeroMesa)
			mesas.add(mesa)
			return mesa
		}
	}
	
	method estaInvitado(persona) = self.invitados().contains(persona)
}



















