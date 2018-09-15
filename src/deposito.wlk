import transportes.*

object deposito {

	var deposito = []

	method recibirCosas(unaCosa) {
		deposito.addAll(unaCosa)
	}

	method sacarCosas(unaCosa) {
		deposito.removeAll(unaCosa)
	}

	method llenarCamion() {
		deposito.forEach({ unaCosa =>
			camion.cargarleCargas(unaCosa)
			self.sacarCosas(unaCosa)
		})
	}

}

object contenedorPortuario {

	var cargas = []
	const pesoFijo = 100

	method agregarleCargas(unaCarga) {
		cargas.add(unaCarga)
	}

	method removerleCargas(unaCarga) {
		cargas.remove(unaCarga)
	}

	method peso() {
		return pesoFijo + cargas.sum({ unaCosa => unaCosa.peso() })
	}

	method nivelPeligrosidad() {
		if (!cargas.isEmpty()) {
			return cargas.max({ unaCosa => unaCosa.nivelPeligrosidad() })
		} else {
			return 0
		}
	}

}

object embalajeSeguridad {

	method peso(unaCosa) {
		return unaCosa.peso()
	}

	method nivelPeligrosidad(unaCosa) {
		return unaCosa.nivelPeligrosidad()/2
	}

}

