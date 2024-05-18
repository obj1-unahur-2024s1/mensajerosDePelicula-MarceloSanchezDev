object bicicleta {
	const peso = 5

	method peso(){
		return peso
	}

}
object camioneta {
	var cantAcoplado = 0
	const peso = cantAcoplado * 500
	method peso(){
		return peso
	}
	method cantAcoplado(){
		return cantAcoplado
	}
	method setCantAcoplado(cant){
		cantAcoplado = cant
	}
	
}

