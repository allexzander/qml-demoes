import QtQuick 2.15

Item {
    property alias sourceSize: icon.sourceSize
    property alias source: icon.source
    implicitWidth: icon.implicitWidth
    implicitHeight: icon.implicitHeight

    scale: mouseArea.containsMouse ? 1.25 : 1.0

    Behavior on scale {
        PropertyAnimation{}
    }

    Image {
        id: icon
        anchors.fill: parent
        source: "qrc:/icons/left-sidebar-list-icon-facebook.svg"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
