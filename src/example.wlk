import mensajeros.*
import destinos.*

object paquete {

	const precio = 50
	const pago = true
	var destino = ""

	method precio() {
		return precio
	}

	method setDestino(_destino) {
		destino = _destino
	}

	method paquetePagado() {
		return pago
	}

	method puedeSerEntregadoPor(mensajero) = pago and destino.dejarPasar(mensajero)

}
object paqueteNoPagado{
	const precio = 500
	const pago = false
	var destino = ""

	method precio() {
		return precio
	}

	method setDestino(_destino) {
		destino = _destino
	}

	method paquetePagado() {
		return pago
	}

	method puedeSerEntregadoPor(mensajero) = pago and destino.dejarPasar(mensajero)
}
object paquetito {

	const precio = 0
	const pago = true
	var destino = ""

	method precio() {
		return precio
	}

	method setDestino(_destino) {
		destino = _destino
	}

	method paquetePagado() {
		return pago
	}

	method puedeSerEntregadoPor(mensajero) = pago and destino.dejarPasar(mensajero)

}

object paquetonViajero {

	const destinos = []
	const precio = 100 * destinos.size()
	const pago = true

	method precio() {
		return precio
	}

	method setDestino(_destino) {
		destinos.add(_destino)
	}

	method destinos() {
		return destinos
	}

	method paquetePagado() {
		return pago
	}

	method puedeSerEntregadoPor(mensajero) {
		 return pago and destinos.any({ des => des.dejarPasar(mensajero) })
	}

}

object empresaMensajeria {

	const mensajeros = #{}
	const paquetesPendientes = []
	var totalGanado = 0

	method totalGanado() {
		return totalGanado
	}

	method mensajeros() {
		return mensajeros
	}
	method paquetesPendientes(){
		return paquetesPendientes
	}

	method contratarMensajero(mensajero) {
		mensajeros.add(mensajero)
	}

	method despedirMensajero(mensajero) {
		mensajeros.remove(mensajero)
	}

	method despedirTodos() {
		mensajeros.clear()
	}

	method esMensajeriaGrende() {
		return mensajeros.size() > 1
	}

	method elPimeroPuedeEntregarElPaquete(paq) {
		return paq.puedeSerEntregadoPor(mensajeros.asList().first())
	}

	method pesoUltimoMensajero() {
		return mensajeros.asList().last().peso()
	}

	method algunoPuedeEntregarPaquete(paq) {
		return mensajeros.any({ men => paq.puedeSerEntregadoPor(men) })
	}

	method cantPuedenEntregarPaquete(paq) {
		return mensajeros.filter({ men => paq.puedeSerEntregadoPor(men)}).size()
	}

	method tieneSobrePeso() {
		return mensajeros.sum({men => men.peso()}) > 500
	}

	method agregarPaquetePendiente(paquetePendiente) {
		paquetesPendientes.add(paquetePendiente)
	}

	method enviarPaquete(paq) {
		if(self.algunoPuedeEntregarPaquete(paq)){
			totalGanado += paq.precio()
		}else{
			self.agregarPaquetePendiente(paq)
		}
		return totalGanado
	}

	method enviarPaquetes(conj) {
		conj.forEach({ paq => self.enviarPaquete(paq)})
	}

	method enviarPendienteMasCaro() {
		const paq = paquetesPendientes.max({ paq => paq.precio() })
		if (self.algunoPuedeEntregarPaquete(paq)) {
			paquetesPendientes.remove(paq)
		}
	}

}

