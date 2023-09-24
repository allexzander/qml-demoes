import QtQuick 2.15

Item {
    id: root

    property alias source: icon.source
    property alias sourceSize: icon.sourceSize

    implicitWidth: icon.implicitWidth + numMessagesContainer.implicitWidth

    SequentialAnimation on scale {
        id: messagesAnimation
        PropertyAnimation {
            from: 1.0
            to: 1.5
            duration: 500
            easing.type: Easing.InCubic
        }
        PropertyAnimation {
            from: 1.5
            to: 1.0
            duration: 250
            easing.type: Easing.OutCubic
        }
        loops: 1
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: messagesAnimation.running = true
    }


    Image {
        id: icon
        anchors.centerIn: parent

    }
    Rectangle {
        id: numMessagesContainer
        color: "#2293f4"
        readonly property int numMessagesLeftMargin: -3
        width: 14
        height: 14
        radius: width / 2
        anchors.left: icon.right
        anchors.leftMargin: numMessagesLeftMargin
        anchors.verticalCenter: icon.verticalCenter
        Text {
            id: numMessages
            text: "7"
            color: "#ffffff"
            font.pixelSize: 8
            anchors.centerIn: parent
        }
    }
}
