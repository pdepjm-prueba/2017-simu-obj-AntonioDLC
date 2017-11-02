class Rol{
	method arreglarMaquina(tarea, empleado){
		if( empleado.stamina() >= tarea.complejidadMaq() and self.herrsSuf(tarea) )
			empleado.tareasRealizadas().add(tarea)
		else
			throw new NoSePudoRepararExc("Faltan herramientas o stamina")
	}
	method defenderSector(tarea, empleado){
		
	}
	method limpiarSector(tarea, empleado){
		
	}
	
	method herrsSuf(tarea)
}

class Soldado inherits Rol{
	var practica = 0
	
	method usarArma(){ practica +=2}	
	method fuerzaExtra() = self.danio()	
	method danio() = practica

	override method herrsSuf(tarea) = tarea.herrNecesarias().sizeof() == 0
	
}

class Obrero inherits Rol{
	const herramientas
	
	constructor(herr){
		herramientas= herr
	}

	override method herrsSuf(tarea) = tarea.herrNecesarias().forEach({herr => herramientas.contains(herr)})
}

class NoSePudoRepararExc inherits Exception{}

class Mucama inherits Rol{
	override method herrsSuf(tarea) = tarea.herrNecesarias().sizeof() == 0
	override method defenderSector(tarea, empleado){
		throw new MucamaNoDefiende("Las mucamas no pelean")
	}
}

class MucamaNoDefiende inherits Exception{}