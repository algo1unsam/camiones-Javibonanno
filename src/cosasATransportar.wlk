import transportes.*

object knightrider {

	var property peso = 500
	const property nivelPeligrosidad = 10

}

object bumblebee {

	var property peso = 800
	var property estaTransformadoEn = robot

	method nivelPeligrosidad() {
		return estaTransformadoEn.nivelPeligrosidad()
	}

}

object paqueteLadrillos {

	var property cantidadLadrillos = 0
	const property nivelPeligrosidad = 2

	method peso() {
		return cantidadLadrillos * 2
	}

}

object auto {

	const property nivelPeligrosidad = 15

}

object robot {

	const property nivelPeligrosidad = 30

}

// TODO acá debería estar contenedor y embalaje

