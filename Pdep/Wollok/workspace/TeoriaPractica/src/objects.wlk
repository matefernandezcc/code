class Vaca {
	var litrosDeLeche = 1
	var energia = 100
	method litrosDeLeche() = litrosDeLeche
	method energia() = energia
	
	method estaContenta(){
		return (energia > 100)
	}
	
	method descansar(horas){
		energia = self.energia() + 10*horas
		litrosDeLeche = self.litrosDeLeche() + 1*horas
	}
	
	method ordeniar(litros){
		energia = self.energia() - 10*litros
		litrosDeLeche = self.litrosDeLeche() - 1*litros
	}
	
}

class Corral {
	const animales = []
	
	method lecheDisponible() = animales
	.filter{vaca => vaca.estaContenta()}
	.sum{vaca => vaca.litrosDeLeche()}
	
	method todasContentas() = animales
	.all{vaca => vaca.estaContenta()}
	
	method ordeniar(litros){
		animales.forEach{vaca =>
			if(vaca.estaContenta())
				vaca.ordeniar()
		}
	}
}














