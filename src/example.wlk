import mensajeros.*
import destinos.*
object paquete {
	const pago = true
	method paquetePagado(){
		return pago
	}	
	method puedeSerEntregadoEn_Por(destino,mensajero)= pago and destino.dejarPasar(mensajero)
}
object empresaMensajeria{
	const mensajeros = #{}
	method mensajeros(){
		return mensajeros
	}
	method contratarMensajero(mensajero){
		mensajeros.add(mensajero)
	}
	method despedirMensajero(mensajero){
		mensajeros.remove(mensajero)
	}
	method despedirTodos(){
		mensajeros.clear()
	}
	method esMensajeriaGrende(){
		return mensajeros.size() > 1
	}
	method elPimeroPuedeEntregarElPaquete(destino){
		return paquete.puedeSerEntregadoEn_Por(destino, mensajeros.asList().first())
	}
	method pesoUltimoMensajero(){
		return mensajeros.asList().last().peso()
	}
}