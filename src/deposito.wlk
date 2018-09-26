import transportes.*

object deposito {

	var deposito = []

	// TODO el nombre del método es "recibirCosas", sin embardo, sólo recibe una sóla cosa por parámetro
	// efectivamente acá debería recibir una lista
	method recibirCosas(unaCosa) {
		deposito.addAll(unaCosa)
	}

	method sacarCosas(unaCosa) {
		deposito.removeAll(unaCosa)
	}

	method llenarCamion() {
		deposito.forEach({ unaCosa =>
			// TODO está bien el mensaje, pero el nombre es confuso
			camion.cargarleCargas(unaCosa)
			// TODO idem el nombre
			self.sacarCosas(unaCosa)
		})
	}

}

// TODO por qué esto no está en "cosasATransportar"?
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

	// TODO acá "la cosa" embalada debería ser un atributo, sino ambos mensajes
	// podrían responder diferente según el parámetro, y se supone que debe ser consistente	

	method peso(unaCosa) {
		return unaCosa.peso()
	}

	method nivelPeligrosidad(unaCosa) {
		return unaCosa.nivelPeligrosidad()/2
	}

}

