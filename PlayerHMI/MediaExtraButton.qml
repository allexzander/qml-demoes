import QtQuick 2.15

Item {
    id: root

    property string text
    property string iconSource

    property bool isToggled: false

    signal clicked(); // onClicked: print('onClicked')

    implicitWidth: 24
    implicitHeight: 24
    opacity: enabled && mouseArea.pressed || isToggled ? 1: 0.5

    Loader {
        active: text !== ""
        sourceComponent: Text {
            text: root.text
            font.pixelSize: 16
            anchors.centerIn: parent
            color: "white"
        }
    }


    Loader {
        active: iconSource !== ""
        sourceComponent: Image {
            id: icon
            source: iconSource
            sourceSize.width: root.width
            sourceSize.height: root.height
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        onClicked:  {
            isToggled = !isToggled
            root.clicked()
        }
    }
}
