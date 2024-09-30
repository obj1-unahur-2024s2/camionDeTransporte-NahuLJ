import camion.*
import cosas.*

object escenario1 {
    method preparar(){
        self.prepararElementos()
        camion.cargar(bumblebee)
        camion.cargar(arenaAGranel)
        camion.cargar(bateriaAntiaerea)
        camion.cargar(embalajeDeSeguridad)
    }

    method prepararElementos(){
        bumblebee.estaTransformado(true)
        arenaAGranel.peso(150)
        bateriaAntiaerea.estaConMisiles(true)
        embalajeDeSeguridad.objetoQueCubre(paqueteLadrillos)
        paqueteLadrillos.cantidadLadrillos(80)
    }
}