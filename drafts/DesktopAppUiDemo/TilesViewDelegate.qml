import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    Rectangle {
        opacity: mouseArea.containsMouse ? 1.0 : 0.5
        color: "#344a81"
        anchors.fill: parent
    }
    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 20
        anchors.bottomMargin: 20
        Text {
            id: label
            text: providerName
            color: "#ffffff"
            Layout.alignment: Qt.AlignHCenter
        }
        Text {
            id: stars
            text: "✩✩✩✩"
            color: "#ffffff"
            Layout.alignment: Qt.AlignHCenter
        }
        Image {
            id: providerIcon
            source: icon
            sourceSize.width: root.width * 0.3
            Layout.alignment: Qt.AlignHCenter
        }
    }
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
