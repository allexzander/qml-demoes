import QtQuick 2.15

Item {
    id: root

    property string iconSource

    signal clicked();

    implicitWidth: 32
    implicitHeight: implicitWidth

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#87a6c2"
        opacity: root.enabled  &&  mouseArea.pressed? 1: 0.7
    }

    Image {
        id: icon
        source: iconSource
        sourceSize.width: root.width * 0.6
        sourceSize.height: root.height * 0.6
        anchors.centerIn: parent
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onClicked:  root.clicked()
    }
}
