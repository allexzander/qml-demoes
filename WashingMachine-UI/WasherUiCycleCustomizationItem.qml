import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    implicitWidth: label.implicitWidth + modeToggle.implicitWidth + contentLeftMargin
    implicitHeight:label.implicitHeight + modeToggle.implicitHeight + labelTopMargin + contentLeftMargin

    property alias modeName: label.text
    property alias modeNameFont: label.font
    property alias modeNameColor: label.color

    property alias textFirstState: modeToggle.textFirstState
    property alias textSecondState: modeToggle.textSecondState
    property alias toggleFont: modeToggle.font
    property alias toggleTextColor: modeToggle.textColor

    property alias bgGradientColorStart: gradientStart.color
    property alias bgGradientColorStop: gradientStart.color

    readonly property int contentLeftMargin: 15
    readonly property int labelTopMargin: 15
    readonly property int toggleTopMargin: 30

    LinearGradient {
        source: root
        anchors.fill: root

        gradient: Gradient {
            id: gradient
            GradientStop {
                id: gradientStart
                position: 0.0;
                color: "#414856"
            }
            GradientStop {
                id: gradientStop
                position: 1.0;
                color: "#444c5b"
            }
        }
    }

    Text {
        id: label
        text: root.modeName
        font: root.modeNameFont
        color: root.modeNameColor
        anchors.left: root.left
        anchors.top: root.top
        anchors.topMargin: root.labelTopMargin
        anchors.leftMargin: root.contentLeftMargin
    }

    WasherUiCycleToggle {
        id: modeToggle
        textFirstState: root.textFirstState
        textSecondState: root.textSecondState
        font: root.toggleFont
        textColor: root.toggleTextColor

        anchors.left: root.left
        anchors.top: label.top
        anchors.topMargin: root.toggleTopMargin
        anchors.leftMargin: root.contentLeftMargin
    }
}
