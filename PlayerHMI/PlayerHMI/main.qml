import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.12
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 800
    height: 640
    visible: true
    title: qsTr("Media Player HMI")

    property int componentRectBorderWidth: 2


    Rectangle {
        id: rootBackground
        anchors.fill: parent
        color: "#bed4f0"
    }

    Rectangle {
        id: mainComponent
        anchors.centerIn: parent
        width: 650
        height: 350
        radius: 20

        border.width: componentRectBorderWidth
        border.color: "#d8eeff"

        LinearGradient {
            anchors.fill: mainComponent
            anchors.margins: componentRectBorderWidth
            source: mainComponent
            start: Qt.point(0, 0)
            end: Qt.point(300, 0)
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#a1c1db" }
                GradientStop { position: 1.0; color: "#7ebcda" }
            }
        }

        InfoBar {
            id: infoBar
            height: 60
            width: parent.width
        }

        MainControls {
            id: mainControls

            anchors.top: infoBar.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.bottomMargin: 60
            anchors.bottom: parent.bottom
        }
    }
}
