import QtQuick 2.0

Item {
    id: root
    implicitWidth: advancedSettings.implicitWidth + buttonAdvancedSettings.implicitWidth
    implicitHeight: advancedSettings.implicitHeight + buttonAdvancedSettings.implicitHeight
    Text {
        id: advancedSettings
        text: "Advanced settings"
        font.pixelSize: 14
        opacity: 0.5
        anchors.right: buttonAdvancedSettings.left
        anchors.verticalCenter: buttonAdvancedSettings.verticalCenter
    }

    Item {
        id: buttonAdvancedSettings
        implicitWidth: 32
        implicitHeight: 32

        anchors.right: root.right
        anchors.bottom: root.bottom

        opacity: 0.4

        Image {
            source: "qrc:/icons/icon-gear.svg"
            sourceSize.width: 18
            sourceSize.height: 18
            anchors.centerIn: parent
        }
        MouseArea {
            id: mouseAreaButtonAdvancedSettings
            anchors.fill: parent
        }
    }
}
