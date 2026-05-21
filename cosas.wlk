import camion.*

object knightRider{
    const property peso = 500
    const property peligrosidad = 10 

    
}

object bumblebee{
    const property peso = 800

    var property transformadoEnAuto = false

    method transformar() {
        transformadoEnAuto = !transformadoEnAuto
    }

    method peligrosidad(){
        if(transformadoEnAuto){
            return 15
        }
        else{
            return 30
        }
    }

    
}

object ladrillos {
    var property cantidad = 10
    method peso() = 2 * cantidad
    const property peligrosidad = 2

}

object arena {
    var property peso = 15
    const property peligrosidad = 1  
}

object bateriaAntiaerea {
    var property estaConLosMisiles = false

    method alternarMisiles() {
        estaConLosMisiles = !estaConLosMisiles
    }

    method peso(){
        if(estaConLosMisiles){
            return 300
        }
        else{
            return 200
        }
    }

    method peligrosidad(){
        if(estaConLosMisiles){
            return 100
        }
        else{
            return 0
        }
    } 
}

object contenedor {
    const carga = [moto,garrafa,bidonCombustible]

    method peso() = 100 + carga.sum{c => c.peso()}

    method peligrosidad(){
        if (carga.isEmpty()){    //compruebo si no esta vacio el contenedor primero
            return 0
        }

        return carga.max{c => c.peligrosidad()}.peligrosidad()  //el max si el contenedor esta vacio se rompe
    }
}

object residuos {
    var property peso = 30
    const property peligrosidad = 200  
    
}

object embalajeSeguridad {
    var property lleva = residuos

    method peso() {
        return lleva.peso()
    }

    method peligrosidad(){
        return lleva.peligrosidad() / 2
    }

    
}

//cosas adicionales

object auto {
    const property peso = 250
    const property peligrosidad = 10  
}

object moto {
  const property peso = 150
  const property peligrosidad = 5  
}

object bidonCombustible {

    var property peso = 20
    var property esInflamable = true

    method alternarInflamacion(){
        esInflamable = !esInflamable
    }

    method peligrosidad() {

        if(esInflamable) {
            return 50
        }
        else {
            return 10
        }
    }
}

object garrafa {

    var property estaLlena = true

    method alternarCarga(){
        estaLlena = !estaLlena
    }

    method peso() {

        if(estaLlena) {
            return 30
        }
        else {
            return 15
        }
    }

    method peligrosidad() {

        if(estaLlena) {
            return 40
        }
        else {
            return 15
        }
    }
}
