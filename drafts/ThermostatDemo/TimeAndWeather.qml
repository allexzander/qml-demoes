import QtQuick 2.15

Item {
    id: root
    readonly property int margin: 5
    implicitWidth: weatherIcon.implicitWidth + time.implicitWidth + margin
    implicitHeight: weatherIcon.implicitHeight + time.implicitHeight
    Text {
        id: time
        font.pixelSize: 14
        color: "#ffffff"
        text: "10:00 am"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        lineHeightMode: Text.FixedHeight
        verticalAlignment: Text.AlignVCenter
    }
    Image {
        id: weatherIcon
        source: "qrc:/icons/weather-icon.svg"
        sourceSize.width: 20
        sourceSize.height: 20
        anchors.leftMargin: margin
        anchors.left: time.right
        anchors.verticalCenter: parent.verticalCenter
    }
}
