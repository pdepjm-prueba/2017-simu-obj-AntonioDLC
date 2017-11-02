class Rol{
	method arreglarMaquina(tarea, empleado){
		if( empleado.stamina() >= tarea.complejidadMaq() and self.herrsSuf(tarea) )
			empleado.tareasRealizadas().add(tarea)
		else
			throw new NoSePudoRepararExc("Faltan herramientas o stamina")
	}
	method defenderSector(tarea, empleado){
		if( empleado.fuerza() >= tarea.gradoDeAmenaza())
			empleado.tareasRealizadas().add(tarea)
		else
			throw new AmenazaDemasiadoPoderosa("La amenaza es demasiado para el empleado")

		empleado.pierdeStamina(self.staminaPerdidaEnDefensa(empleado))
	}
	method limpiarSector(tarea, empleado){
		if( tarea.staminaReq() <= empleado.stamina())
			empleado.tareasRealizadas().add(tarea)
		else
			throw new NoHaySufStamina("Le falta stamina al empleado")
			
		empleado.pierdeStamina(self.staminaPerdidaLimpiando(tarea.staminaReq()))
	}
	
	method herrsSuf(tarea)
	method staminaPerdidaEnDefensa(empleado)
	method staminaPerdidaLimpiando(stamAPerder) = stamAPerder
}

class AmenazaDemasiadoPoderosa inherits Exception{}
class NoHaySufStamina inherits Exception{}

class Soldado inherits Rol{
	var practica = 0
	
	method usarArma(){ practica +=2}	
	method fuerzaExtra() = self.danio()	
	method danio() = practica

	override method herrsSuf(tarea) = tarea.herrNecesarias().sizeof() == 0
	override method staminaPerdidaEnDefensa(e) = 0
	
}

class Obrero inherits Rol{
	const herramientas
	
	constructor(herr){
		herramientas= herr
	}

	override method herrsSuf(tarea) = tarea.herrNecesarias().forEach({herr => herramientas.contains(herr)})
	override method staminaPerdidaEnDefensa(e) = e.stamina()/2
}

class NoSePudoRepararExc inherits Exception{}

class Mucama inherits Rol{
	override method herrsSuf(tarea) = tarea.herrNecesarias().sizeof() == 0
	override method defenderSector(tarea, empleado){
		throw new MucamaNoDefiende("Las mucamas no pelean")
	}
	override method staminaPerdidaEnDefensa(e) = 0
	override method staminaPerdidaLimpiando(stamAPerder) =  0
}

class MucamaNoDefiende inherits Exception{}