import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    property alias text: temperatureDisplay.text
    implicitWidth: temperatureDisplay.implicitWidth
    implicitHeight: temperatureDisplay.implicitHeight
    Text {
        id: temperatureDisplay
        anchors.left: parent.left
        font.pixelSize: 62
        color: "#ffffff"
        verticalAlignment: Qt.AlignBottom
    }
}
