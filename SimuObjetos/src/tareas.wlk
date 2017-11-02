
class Defender{
	const gradoDeAmenaza
	
	constructor(grado){
		gradoDeAmenaza = grado
	}
	
	method dificultad(raza) = gradoDeAmenaza*raza.factorDeAmenaza()
	method gradoDeAmenaza() = gradoDeAmenaza
}

class Reparar{
	const complejidad
	const herrNecesarias
	
	constructor(_complejidad, _herrNecesarias){
		complejidad = _complejidad
		herrNecesarias = _herrNecesarias
	}
	
	method dificultad(raza) = 2*complejidad
	method herrNecesarias()= herrNecesarias
	method complejidadMaq() = complejidad
}

class Limpiar{
	var dificultad = 10
	var esGrande

	constructor(_esGrande){
		esGrande = _esGrande
	}
	method staminaReq() = if(esGrande) 4 else 1

	method setDificultad(dif){
		dificultad=dif
	}

	method dificultad(raza) = dificultad
}