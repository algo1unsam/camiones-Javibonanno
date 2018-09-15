object camion {

	var cargas = []
	var property cargaMaxima = 2500

	method cargarleCargas(unaCosa) {
		if (self.puedoCargar(unaCosa)) {
			cargas.add(unaCosa)
		} else {
			error.throwWithMessage("No hay peso disponible para hacer la carga")
		}
	}

	method descargarleCargas(unaCosa) {
		cargas.remove(unaCosa)
	}

	method tenesCargadoAlgo(unaCosa) {
		return cargas.contains(unaCosa)
	}

	method cargaActual() {
		return cargas.sum({ unaCosa => unaCosa.peso() })
	}

	method cargaDisponible() {
		return cargaMaxima - self.cargaActual()
	}

	method puedoCargar(unaCosa) {
		return unaCosa.peso() < self.cargaDisponible()
	}

	method cosaMasPeligrosa() {
		return cargas.max({ unaCosa => unaCosa.nivelPeligrosidad() })
	}

	method puedeCircularPor() {
		return cargas.all({ unaRuta => cargas.nivelPeligrosidad(unaRuta) > ruta.nivelPeligrosidad() })
	}

}

object ruta {

	var property nivelPeligrosidad = 10

}

object motoneta {

	var cargas = []
	var property cargaMaxima = 100

	method cargarleCargas(unaCosa) {
		if (self.puedoCargar(unaCosa)) {
			cargas.add(unaCosa)
		} else {
			error.throwWithMessage("No hay peso disponible para hacer la carga")
		}
	}

	method descargarleCargas(unaCosa) {
		cargas.remove(unaCosa)
	}

	method puedoCargar(unaCosa) {
		return unaCosa.nivelPeligrosidad()<=5 and unaCosa.peso() <= 100
	}

}

