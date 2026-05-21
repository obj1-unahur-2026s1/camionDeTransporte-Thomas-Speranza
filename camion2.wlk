import cosas2.*
object camion {
    var property bultos = 10

    const property pesoTara = 1000

    const carga = []

    method cargaActual() {
        return carga
    }

    method pesoTotal(){
        return pesoTara + carga.sum{c => c.peso()}
    }

    method cargar(unaCosa){
        if(carga.contains{unaCosa}){
            throw new Exception(message = "Este objeto ya se encuentra cargado en el camion" )
        }

        if(unaCosa.bultosAOcupar() > self.bultos()){
            throw new Exception(message = "Ya no hay capacidad disponible")
        }

        carga.add(unaCosa)

        bultos -= unaCosa.bultosAOcupar()

        unaCosa.reaccionarCarga()
 
    }

    method descargar(unaCosa){
        if(not carga.contains{unaCosa}){
            throw new Exception(message = "Este objeto no se encuentra en el camion" )
        }

        carga.remove{unaCosa}

        bultos += unaCosa.bultosAOcupar()
    }

    method todasSusCosasTienenPesoPar() = carga.all{c => c.peso() % 2 == 0}

    method hayAlgoQuePese_(unPeso) = carga.any{c => c.peso() == unPeso}

    method primerCosaConPeligrosidad_(unaPeligrosidad) = carga.find{c => c.peligrosidad() == unaPeligrosidad}

    method cosasConPeligrosidadSuperiorA_(unaPeligrosidad) =  carga.filter{c => c.peligrosidad() > unaPeligrosidad} 

    method cosasMasPeligrosasQue_(unaCosa) = carga.filter{c => c.peligrosidad() > unaCosa.peligrosidad()}

    method estaExcedidoDePeso() = self.pesoTotal() > 2500

    method puedeCircularEnRuta(peligrosidad){
        
        return 
        
        not self.estaExcedidoDePeso() and self.cosasConPeligrosidadSuperiorA_(peligrosidad) == 0

    }

    method hayAlgoQuePeseEntre_Y_(pesoMin,pesoMax) = carga.any{c => c.peso() < pesoMax and c.peso() > pesoMin}

    method cosaMasPesada() = carga.max{c => c.peso()}
}