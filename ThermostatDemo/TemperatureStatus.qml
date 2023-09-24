import QtQuick 2.15

Item {
    id: root
    readonly property int margin: 10
    implicitWidth: statusIcon.implicitWidth + statusLabel.implicitWidth + margin
    implicitHeight: Math.max(statusIcon.implicitHeight, statusLabel.implicitHeight)
    Image {
        id: statusIcon
        source: "qrc:/icons/temperature-icon-status.svg"
        sourceSize.width: 20
        sourceSize.height: 20
        width: sourceSize.width
        height: sourceSize.height
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: statusLabel
        font.pixelSize: 16
        color: "#ffffff"
        text: "AWAY"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }
}
