import camion2.*

object knightRider{
    const property peso = 500
    const property peligrosidad = 10 

    const property bultosAOcupar = 1

    method reaccionarCarga(){}
}

object bumblebee{
    const property peso = 800

    var property transformadoEnAuto = false

    method peligrosidad(){
        if(self.transformadoEnAuto()){
            return 15
        }
        else{
            return 30
        }
    }

    const property bultosAOcupar = 2

    method transformarAAuto(){
        transformadoEnAuto = true
    }

    method transformadoARobot(){
        transformadoEnAuto = false
    }

    method reaccionarACarga(){
        self.transformadoARobot()
    }
}

object ladrillos {
    var property cantidad = 10
    method peso() = 2 * cantidad
    const property peligrosidad = 2

    method bultosAOcupar(){
        if(self.cantidad() <= 100){
            return 1
        }
        else if(self.cantidad() >= 101 and self.cantidad() <= 300){
            return 2
        }
        else{
            return 3
        }
    }

    method reaccionarCarga(){
        cantidad += 12
    }
}

object arena {
    var property peso = 15
    const property peligrosidad = 1  

    method reaccionarCarga(){
        if(self.peso() < 10){
            peso -= peso
        }
        else{
            peso -= 10
        }
    }

    method bultosAOcupar() = 1
}

object bateriaAntiaerea {
    var property estaConLosMisiles = false

    method peso(){
        if(self.estaConLosMisiles()){
            return 300
        }
        else{
            return 200
        }
    }

    method peligrosidad(){
        if(self.estaConLosMisiles()){
            return 100
        }
        else{
            return 0
        }
    } 

    method bultosAOcupar(){
        if(not self.estaConLosMisiles()){
            return 1
        }
        else{
            return 2
        }
    }

    method cargarMisiles(){
        estaConLosMisiles = true
    }

    method descargarMisiles(){
        estaConLosMisiles = false
    }
    
    method reaccionarACarga(){
        self.cargarMisiles()
    }
}

object contenedor {
    const carga = [moto,bidonCombustible]

    method peso() = 100 + carga.sum{c => c.peso()}

    method peligrosidad(){
        if (carga.isEmpty()){    //compruebo si no esta vacio el contenedor primero
            return 0
        }

        return carga.max{c => c.peligrosidad()}.peligrosidad()  //el max si el contenedor esta vacio se rompe
    }

    method bultosAOcupar() = carga.sum{c => c.bultosAOcupar()}

    method reaccionarCarga() = carga.forEach{c => c.reaccionarCarga()}
}

object residuos {
    var property peso = 30
    const property peligrosidad = 200  
    const property bultosAOcupar = 1

    method reaccionarCarga(){
        peso += 15
    }
}

object embalajeSeguridad {
    var property lleva = residuos

    method peso() {
        return lleva.peso()
    }

    method peligrosidad(){
        return lleva.peligrosidad() / 2
    }

    const property bultosAOcupar = 2
}

//cosas adicionales
object moto {
    var property peso = 150
    const property peligrosidad = 5  
    const property bultosAOcupar = 2

    method reaccionarCarga(){
        peso += 20
    }
}

object bidonCombustible {

    var property peso = 20
    var property esInflamable = true

    method alternarInflamacion(){
        esInflamable = !esInflamable
    }

    method peligrosidad() {

        if(self.esInflamable()) {
            return 50
        }
        else {
            return 10
        }
    }

    method reaccionarCarga(){
        peso += 20
    }

    const property bultosAOcupar = 1
}


