import QtQuick 2.15

Item {
    id: root

    property string iconSource

    signal clicked();

    implicitWidth: 60
    implicitHeight: 24
    opacity:      enabled  &&  mouseArea.pressed? 1: 0.5 // disabled/pressed state

    Rectangle {
        id: background
        anchors.fill: parent
        color: "white"
        opacity: 0.5
    }

    Image {
        id: icon
        source: iconSource
        sourceSize.width: root.width * 0.25
        sourceSize.height: root.width * 0.25
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onClicked:  root.clicked()
    }
}
