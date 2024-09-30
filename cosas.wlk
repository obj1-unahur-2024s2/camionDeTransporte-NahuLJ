object knightRider {
    
    method peso() = 500

    method peligrosidad() = 10
}

object bumblebee {
    var property estaTransformado = false
    
    method peso() = 800
    
    method peligrosidad() = if(estaTransformado) 15 else 30
}

object paqueteLadrillos {
    var property cantidadLadrillos = 1

    method peso() = 2 * cantidadLadrillos

    method peligrosidad() = 2
}

object arenaAGranel{
    var property peso = 1

    method peso() = peso

    method peligrosidad() = 1
}

object bateriaAntiaerea {
    var property estaConMisiles = false

    method peso() = if(estaConMisiles) 300 else 200

    method peligrosidad() = if(estaConMisiles) 100 else 0
}

object contenedorPortuario {
    const property cosas = []

    method peso() = 100 + cosas.sum({cosa => cosa.peso()})

    method peligrosidad() = self.listaDePeligrosidadDeLasCosas().max()

    method agregar(elemento){
        cosas.add(elemento)
    }

    method quitar(elemento){
        cosas.remove(elemento)
    }

    method listaDePeligrosidadDeLasCosas() = cosas.map({cosa => cosa.peligrosidad()})
}

object residuoRadioactivo {
    var property peso = 10

    method peligrosidad() = 200
}

object embalajeDeSeguridad {
    var property objetoQueCubre = bateriaAntiaerea
    
    method peso() = objetoQueCubre.peso()

    method peligrosidad() = objetoQueCubre.peligrosidad() * 0.5
}