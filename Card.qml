import QtQuick 2.0

Item {
    property alias imagen: frente.imagen
    property alias texto: frente.texto
    property alias habilita: mouse.enabled
    property alias voltear: flipable.flipped
    property int valor: 0
    id: carta
    width: 150
    height: 150
    Flipable {
        id: flipable
        anchors.fill: parent
        anchors.centerIn: parent

        property bool flipped: false

        front: Imagen{
            anchors.fill: parent
            imagen: "imagenes/pregunta.png"
        }

        back: Imagen{
            id: frente
            anchors.fill: parent
        }

        transform: Rotation {
            id: rotation
            origin.x: flipable.width/2
            origin.y: flipable.height/2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        states: State {
            name: "back"
            PropertyChanges { target: rotation; angle: 180 }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation { target: rotation; property: "angle"; duration: 400 }
        }

        Timer {
            id: reset
            interval: 500
            onTriggered: window.presinado(carta)
        }


        MouseArea {
            id: mouse
            anchors.fill: parent
            onClicked: {
                habilita = false
                flipable.flipped = !flipable.flipped
                reset.start()
            }
        }
    }
}
