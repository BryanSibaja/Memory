var datos = [];
var actual = null;

function ramdomizar(array) {
    var currentIndex = array.length, temporaryValue, randomIndex;
    while (0 !== currentIndex) {
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }
    return array;
}

function Timer() {
    return Qt.createQmlObject("import QtQuick 2.0; Timer {}", window);
}

function delay(duracion){
    var timer = new Timer();
    timer.interval = duracion;
    timer.repeat = false;
    timer.start();
}

function activado(carta){
    if(actual == null){
        actual = carta;
    }
    else{
        if(actual.valor !== carta.valor){
            actual.voltear = false;
            carta.voltear = false;
            carta.habilita = true;
            actual.habilita = true;
        }
        actual = null
    }
}

function iniciar() {
    var vector = [];
    for(var i = 0; i < datos.length; i++){
        var itemT = {val: i, texto: datos[i].ingles};
        var itemI = {val: i, imagen: datos[i].imagen};
        vector.push(itemT, itemI);
    }
    vector = ramdomizar(vector);
    for(var j = 0; j < vector.length; j++){
        repetidor.itemAt(j).valor = vector[j].val;
        if("texto" in vector[j]){
            repetidor.itemAt(j).texto = vector[j].texto;
        }
        if("imagen" in vector[j]){
            repetidor.itemAt(j).imagen = vector[j].imagen;
        }
    }
}
