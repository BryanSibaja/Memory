import QtQuick 2.6
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

import "logica.js" as Experto
import "datos.js" as Datos

Window {
    id: window
    visible: true
    width: 850
    height: 800
    title: qsTr("Memory Game")

    Component.onCompleted: {
        Experto.datos = Datos.datos
        Experto.iniciar()
    }

    function presinado(carta){
        Experto.activado(carta)
    }

    Image {
        id: fondo
        fillMode: Image.Tile
        anchors.fill: parent
        source: "imagenes/tree_bark.png"
    }

    Grid{
        property int tamaño: 200
        spacing: 15
        columns: 5
        anchors.centerIn: parent
        Repeater{
            id: repetidor
            model: Datos.datos.length * 2
            Card{}
        }
    }
}
