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
		return tareasRealizadas.sizeof() + tareasRealizadas.sum({t=>t.dificultad()})
	}
	method fuerza() = (stamina/2 + 2 + rol.fuerzaExtra())*raza.factorDeFuerza()
	method realizar(tarea){
		rol.realizar(self, tarea)
	}
}

object ciclope{
	method factorDeFuerza() = 0.5
}
object biciclope{
	method factorDeFuerza() = 1
}