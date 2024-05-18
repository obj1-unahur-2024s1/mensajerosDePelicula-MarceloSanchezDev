object punteBrooklyn {
	const pesoMax = 1000
	method dejarPasar(mensajero){
		return mensajero.peso() < pesoMax
	}
}
object matrix {
	method dejarPasar(mensajero){
		return mensajero.recibeLlamado()
	}
}
