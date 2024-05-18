import vehiculos.*

object roberto {

	var vehiculo 
	var peso = 0
	const puedeLlamar = false

	method recibeLlamado() {
		return puedeLlamar
	}
	method peso(){
		return peso
	}
	method vehiculo(){
		return vehiculo
	}
	method setPeso(cant){
		peso = cant + vehiculo.peso()
	}
	method setVehiculo(_vehiculo){
		vehiculo = _vehiculo
	}
}

object chuckNorris {

	const peso = 80
	const puedeLlamar = true

	method recibeLlamado() {
		return puedeLlamar
	}
	method peso(){
		return peso
	}
	
}

object neo {
	const peso = 0
	var tieneCredito = true
	var puedeLlamar =  tieneCredito

	method recibeLlamado() {
		return puedeLlamar
	}
	method peso(){
		return peso
	}
	method cargarCredito(){
		tieneCredito = !tieneCredito
	}
}

