import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    property alias imagen: img.source
    property alias texto: nombre.text

    Rectangle{
        id: fondo
        anchors.centerIn: parent
        anchors.fill: parent
        color: "black"
        opacity: 0.5
        radius: 5
    }

    Rectangle{
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "lightblue"
            }

            GradientStop {
                position: 1
                color: "lightgreen"
            }
        }
        anchors.fill: img
    }

    Image {
        id: img
        width: parent.width * 0.9
        height: parent.height * 0.9
        anchors.centerIn: parent
    }

    Text {
        id: nombre
        anchors.centerIn: parent
        font.pixelSize: 30
        color: "#383838"
        font.weight: Font.ExtraBold
        scale: (parent.width / paintedWidth) - 0.3
    }
}
