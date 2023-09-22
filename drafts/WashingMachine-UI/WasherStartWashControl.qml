import QtQuick 2.0

Item {
    id: root

    implicitWidth: buttonLabel.width + button.width
    implicitHeight: Math.max(buttonLabel.height, button.height)

    Text {
        id: buttonLabel
        text: "Start wash"
        font.pixelSize: 14
        font.bold: true
        color: "#ffffff"

        anchors.right: button.left

        anchors.rightMargin: 10

    }
    Item {
        id: button
        anchors.right: parent.right
        anchors.verticalCenter: buttonLabel.verticalCenter
        width: 30
        height: 30


        Rectangle {
            color: "#cdff72"
            radius: parent.width /2
            anchors.fill: parent
            opacity: enabled && mouseArea.pressed? 0.5: 1.0
        }
        Image {
            source: "qrc:/icons/icon-play.svg"
            sourceSize.width: 12
            sourceSize.height: 12
            anchors.centerIn: parent
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
        }
    }
}
