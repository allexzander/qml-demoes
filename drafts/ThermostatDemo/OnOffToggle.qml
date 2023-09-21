import QtQuick 2.15

Item {
    id: root
    readonly property int margin: 5
    implicitWidth: statusIcon.implicitWidth + statusLabel.implicitWidth + margin
    implicitHeight: statusIcon.implicitHeight + statusLabel.implicitHeight
    Image {
        id: statusIcon
        source: "qrc:/icons/propeller-icon.svg"
        sourceSize.width: 32
        sourceSize.height: 32
        width: sourceSize.width
        height: sourceSize.height
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: statusLabel
        font.pixelSize: 24
        color: "#ffffff"
        text: "On"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }
}
