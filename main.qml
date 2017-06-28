import QtQuick 2.6
import QtQuick.Controls 2.1
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
        info.open()
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

    Dialog {
        id: info
        modal: true
        focus: true
        title: "Instrucciones"
        x: (window.width - width) / 2
        y: window.height / 4
        width: Math.min(window.width, window.height) / 3 * 2
        contentHeight: aboutColumn.height

        Column {
            id: aboutColumn
            spacing: 20

            Label {
                width: info.availableWidth
                text: "Aprende el vocabulario de la medicina"
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }

            Label {
                width: info.availableWidth
                text: "Para jugar presiona alguna de las cartas en la pantalla. Memoriza su contenido " +
                      "y luego presiona otra. El objetivo es conseguir las parejas entre imágenes y palabras." +
                      " ¡Adelante diviértete!"
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }
        }
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

    Button {
        id: boton
        text: "Ayuda 🛈"
        contentItem: Text {
            text: boton.text
            font: boton.font
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
        anchors.top: parent.top
        anchors.right: parent.right
        background: Rectangle {
            implicitWidth: 60
            implicitHeight: 35
            color: boton.down ? "#194060" : "#28679b"
            radius: 4
        }
        onClicked: {
            info.open()
        }
    }
}
