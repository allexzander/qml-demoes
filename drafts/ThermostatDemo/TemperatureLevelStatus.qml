import QtQuick 2.15

Item {
    id: root
    readonly property int margin: 10
    implicitWidth: temperatureStatusIcon.implicitWidth + temperatureStatus.implicitWidth + margin
    implicitHeight: Math.max(temperatureStatusIcon.implicitHeight, temperatureStatus.implicitHeight)
    Image {
        id: temperatureStatusIcon
        source: "qrc:/icons/temperature-icon-tempstatus.svg"
        sourceSize.width: 32
        sourceSize.height: 32
        width: sourceSize.width
        height: sourceSize.height
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: temperatureStatus
        font.pixelSize: 18
        color: "#ffffff"
        text: "COOL 69°"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
    }
}
