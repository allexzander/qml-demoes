import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    property alias textFirstState: firstState.text
    property alias textSecondState: secondState.text

    property alias font: firstState.font
    property color textColor

    readonly property int secondStateLeftMargin: 40

    implicitWidth: firstState.implicitWidth + secondState.implicitWidth + secondStateLeftMargin
    implicitHeight: firstState.implicitHeight + secondState.implicitHeight

    WasherUiButtonLink {
        id: firstState

        isToggled: true

        isToggleOnly: true

        anchors.left: root.left
        anchors.top: root.top

        text: "ON"
        font: root.font
        textColor: root.textColor

        onIsToggledChanged: {
            if (isToggled) {
                secondState.isToggled = false
            }
        }
    }

    WasherUiButtonLink {
        id: secondState

        isToggleOnly: true

        anchors.left: firstState.right
        anchors.verticalCenter: firstState.verticalCenter
        anchors.leftMargin: root.secondStateLeftMargin

        text: "OFF"
        font: root.font
        textColor: root.textColor

        onIsToggledChanged: {
            if (isToggled) {
                firstState.isToggled = false
            }
        }
    }
}
