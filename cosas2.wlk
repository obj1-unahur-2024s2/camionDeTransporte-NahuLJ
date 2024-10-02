object knightRider {
    
    method peso() = 500

    method peligrosidad() = 10

    method bultos() = 1

    method reaccionar() {}
}

object bumblebee {
    var property estaTransformado = false
    
    method peso() = 800
    
    method peligrosidad() = if(estaTransformado) 15 else 30

    method bultos() = 2

    method reaccionar() {
        estaTransformado = true
    }
}

object paqueteLadrillos {
    var property cantidadLadrillos = 1

    method peso() = 2 * cantidadLadrillos

    method peligrosidad() = 2

    method bultos() =  if (cantidadLadrillos <= 100) {1}
                    else if (cantidadLadrillos.between(101, 300)) {2}
                    else {3}

    method reaccionar() {
        cantidadLadrillos += 12
    }
}

object arenaAGranel{
    var property peso = 1

    method peso() = peso

    method peligrosidad() = 1

    method bultos() = 1

    method reaccionar() {
        peso = 0.max(peso - 10)
    }
}

object bateriaAntiaerea {
    var property estaConMisiles = false

    method peso() = if(estaConMisiles) 300 else 200

    method peligrosidad() = if(estaConMisiles) 100 else 0

    method bultos() = if(estaConMisiles) 2 else 1

    method reaccionar() {
        estaConMisiles = true
    }
}

object contenedorPortuario {
    const property cosas = []

    method peso() = 100 + cosas.sum({cosa => cosa.peso()})

    method peligrosidad() = if (cosas.isEmpty()) 0 else self.listaDePeligrosidadDeLasCosas().max()

    method agregar(elemento){
        cosas.add(elemento)
    }

    method quitar(elemento){
        cosas.remove(elemento)
    }

    method listaDePeligrosidadDeLasCosas() = cosas.map({cosa => cosa.peligrosidad()})

    method bultos() = 1 + self.bultosDeLasCosas()

    method bultosDeLasCosas() = cosas.sum({cosa => cosa.bultos()})

    method reaccionar() {
        cosas.forEach({cosa => cosa.reaccionar()})
    }
}

object residuoRadioactivo {
    var property peso = 10

    method peligrosidad() = 200

    method bultos() = 1

    method reaccionar() {
        peso += 15
    }
}

object embalajeDeSeguridad {
    var property objetoQueCubre = bateriaAntiaerea
    
    method peso() = objetoQueCubre.peso()

    method peligrosidad() = objetoQueCubre.peligrosidad() * 0.5

    method bultos() = 2
}