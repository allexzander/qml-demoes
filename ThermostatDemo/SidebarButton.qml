import QtQuick 2.15
import QtQuick.Controls 2.15

AbstractButton {
    id: root
    implicitWidth: 60
    implicitHeight: icon.implicitHeight + label.implicitHeight + labelTopMargin + padding

    readonly property int labelTopMargin: 5

    scale: hovered ? 1.25 : 1.0
    opacity: hovered ? 1.0 : 0.5
    padding: 5

    contentItem: Item {
        anchors.fill: parent
        anchors.margins: root.padding
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
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    background: Rectangle {
        color: "transparent"
    }
}
