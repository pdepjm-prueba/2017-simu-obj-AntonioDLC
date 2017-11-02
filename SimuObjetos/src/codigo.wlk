/** Acá el código del simulacro */
class Empleado{
	var stamina
	const tareasRealizadas = []
	var rol
	const raza
	
	constructor(_rol, _raza){
		rol = _rol
		raza= _raza
		stamina = 10
	}
	
	method stamina() = stamina
	method rol()= rol
	method tareasRealizadas() = tareasRealizadas
	
	method comer(fruta){
		stamina += fruta.energia()
	}
	method experiencia(){
		return tareasRealizadas.sizeof() + tareasRealizadas.sum({t=>t.dificultad(raza)})
	}
	method fuerza() = (stamina/2 + 2 + rol.fuerzaExtra())*raza.factorDeFuerza()
	method realizar(tarea){
		rol.realizar(self, tarea)
	}
}

class Capataz inherits Empleado{
	const subordinados
	
	constructor(_rol, _raza, subord) = super(_rol, _raza){
		subordinados = subord
	}
	
	override method realizar(tarea){
		super(subordinados.findOrDefault({e=>e.experiencia()>self.experiencia()}, self))
	}
}

object ciclope{
	method factorDeFuerza() = 0.5
	method factorDeAmenaza() = 2
}
object biciclope{
	method factorDeFuerza() = 1
	method factorDeAmenaza() = 1
}