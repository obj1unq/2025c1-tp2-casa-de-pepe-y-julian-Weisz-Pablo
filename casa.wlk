import cosas.*

object cuentaCorriente {
  var saldo = 0
  
  method nuevoSaldo(_nuevoSaldo) {
    saldo = _nuevoSaldo
  }
  
  method depositar(monto) {
    saldo += monto
  }
  
  method extraer(monto) {
    if (monto > saldo) {
      throw "No se puede extraer más de lo que hay en la cuenta"
    } else {
      saldo -= monto
    }
  }
  
  method saldoActual() = saldo
}

object cuentaConGastos {
  var saldo = 0
  var costoDeOperacion = 0
  
  method nuevoSaldo(_nuevoSaldo) {
    saldo = _nuevoSaldo
  }
  
  method costoDelMovimiento(_costoDelMovimiento) {
    costoDeOperacion = _costoDelMovimiento
  }
  
  method depositar(monto) {
    if (monto > 1000) {
      throw "No se puede depositar más de $1000"
    } else {
      saldo += monto - costoDeOperacion
    }
  }
  
  method extraer(monto) {
    saldo -= monto
  }
  
  method saldoActual() = saldo
}

object casaDePepeYJulian {
  const compras = []
  var cuenta = cuentaCorriente
  
  method asignarCuenta(_asignarCuenta) {
    cuenta = _asignarCuenta
  }
  
  method comprar(cosa) {
    cuenta.extraer(cosa.precio())
    compras.add(cosa)
  }
  
  method cantidadDeCosasCompradas() = compras.size()
  
  method tieneAlgun(categoria) = compras.any({ c => categoria.incluye(c) })
  
  method vieneDeComprar(categoria) = (!compras.isEmpty()) && categoria.incluye(
    compras.last()
  )
  
  method esDerrochona() = compras.sum({ c => c.precio() }) >= 9000
  
  method compraMasCara() = compras.max({ c => c.precio() })
  
  method comprados(categoria) = compras.filter({ c => categoria.incluye(c) })
  
  method malaEpoca() = (!compras.isEmpty()) && compras.all(
    { c => comida.incluye(c) }
  )
  
  method queFaltaComprar(lista) = lista.filter({ c => !compras.contains(c) })
  
  method faltaComida() = compras.count({ c => comida.incluye(c) }) < 2
  
  method categoriasCompradas() = compras.fold(
    [],
    { lista, c =>
      if (!lista.contains(c.categoria())) lista.add(c.categoria())
      return lista
    }
  )
  
  method cosasCompradas() = compras
}