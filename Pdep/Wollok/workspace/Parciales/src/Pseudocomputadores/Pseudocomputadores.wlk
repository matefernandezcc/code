object standard{
	method consumoDe(equipo) = equipo.consumoBase()
	method computoDe(equipo) = equipo.computoBase()
	
}

class Overclock{
	method consumoDe(equipo) = equipo.consumoBase()*2
	method computoDe(equipo) = equipo.computoBase() + equipo.computoExtraOverclock()
}

class AhorroDeEnergia{
	method consumoDe(equipo) = 200
	method computoDe(equipo) = equipo.consumo()/ equipo.consumoBase()*equipo.computoBase()
}


// EQUIPOS
class Equipo{
	var property modo = standard
	var property estaQuemado = false
	
	method estaActivo() = !estaQuemado and self.computo() > 0
	method consumo() = modo.consumoDe(self)
	method computo() = modo.computoDe(self)
	
	method consumoBase()
	method computoBase()
	method computoExtraOverclock()
}

class A105 inherits Equipo{
	override method consumoBase() = 300
	override method computoBase() = 600
	override method computoExtraOverclock() = self.computoBase()*0.3
}

class B2 inherits Equipo{
	const microsInstalados
	
	override method consumoBase() = 10 + 50*microsInstalados
	override method computoBase() = 800.min{100 *microsInstalados}
	override method computoExtraOverclock() = microsInstalados*20
}

class SuperComputadora {
	const equipos = []
	var totalDeComplejidadComputada=0

	method equiposActivos() = equipos.filter{equipo => equipo.estaActivo()}
	
	
	method estaActivo() = true
	method computo() = self.equiposActivos().sum{equipo => equipo.computo()}
	method consumo() = self.equiposActivos().sum{equipo => equipo.consumo()}
	
	method equipoActivoQueMas(criterio) = self.equiposActivos().max(criterio)
	
	method malConfigurada() =
		self.equipoActivoQueMas{equipo => equipo.consumo()} !=
		self.equipoActivoQueMas{equipo => equipo.computo()}
		
	method computar(problema){
		totalDeComplejidadComputada+= problema.complejidad()
	}
}
