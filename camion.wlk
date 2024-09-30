object camion {
    const property cargamento = []
    
    method cargar(unElemento) {
        cargamento.add(unElemento)
    }
    method descargar(unElemento) {
        cargamento.remove(unElemento)
    }

    method peso() = 1000 + self.pesoDelCargamento()

    method pesoDelCargamento() = cargamento.sum({elemento => elemento.peso()}) 

    method todosLosPesosSonImpares() = cargamento.all({elemento => elemento.peso().odd()})

    method hayAlgoQuePesa(unPeso) = cargamento.any({elemento => elemento.peso() == unPeso})

    method primerElementoConPeligrosidad(unaPeligrosidad) = 
        cargamento.find({elemento => elemento.peligrosidad() == unaPeligrosidad})

    method todosLosElementosConMayorNivelDePeligrosidad(unaPeligrosidad) =
        cargamento.filter({elemento => elemento.peligrosidad() > unaPeligrosidad})
    
    method todosLosElementosConMayorNivelDePeligrosidadQue(unaCosa) =
        cargamento.filter({elemento => elemento.peligrosidad() > unaCosa.peligrosidad()})
    
    method estaExcedidoEnPeso() = self.peso() > 2500

    method puedeCircularEnRuta(unValor) = 
        not self.estaExcedidoEnPeso() and self.todosLosElementosConMayorNivelDePeligrosidad(unValor).isEmpty()
    
    method tieneAlgoQuePeseEntre(unMin,unMax) = cargamento.any({elemento => elemento.peso().between(unMin, unMax)})
    
    method elementoConMayorPeso() = cargamento.max({elemento => elemento.peso()})

}