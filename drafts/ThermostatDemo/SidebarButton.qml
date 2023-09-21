import QtQuick 2.15
import QtQuick.Controls 2.15

AbstractButton {
    id: root
    implicitWidth: 50
    implicitHeight: 50

    contentItem: Item {
        anchors.fill: parent
        Image {
            id: icon
            source: root.icon.source
            sourceSize.width: 32
            sourceSize.height: 32
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: label
            font.pixelSize: 12
            font.bold: true
            color: "#ffffff"
            text: root.text
            anchors.top: icon.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    background: Rectangle {
        color: "transparent"
    }
}
