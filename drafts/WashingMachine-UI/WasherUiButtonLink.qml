import QtQuick 2.0

Item {
    id: root

    property alias text: label.text
    property alias font: label.font
    property alias textColor: label.color

    property bool isToggled: false

    implicitWidth: label.implicitWidth
    implicitHeight: label.implicitHeight

    property bool isToggleOnly: false

    opacity: mouseArea.pressed || isToggled ? 1: 0.5

    Text {
        id: label
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked:  {
            if (isToggleOnly) {
                root.isToggled = true;
                return;
            }

            root.isToggled = !root.isToggled
        }
    }
}
