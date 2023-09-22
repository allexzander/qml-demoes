import QtQuick 2.0
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    readonly property int customizeWashControlPanelButtonWidth: 150
    implicitWidth: customizeWashControlPanelButtonWidth * 4
    implicitHeight: 80
    color: "#3a414e"
    anchors.top: listContainer.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 10
    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 8
        verticalOffset: 8
    }

    RowLayout {
        anchors.fill: parent

        WasherUiCycleCustomizationItem {
            id: rinsingMode
            modeName: "Rinsing"
            modeNameFont.pixelSize: 10
            modeNameFont.bold: true
            modeNameColor: "#cdff72"

            bgGradientColorStart: "#414856"
            bgGradientColorStop: "#444c5b"

            textFirstState: "ON"
            textSecondState: "OFF"
            toggleFont.pixelSize: 16
            toggleFont.bold: true
            toggleTextColor: "#ffffff"
            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true
            Layout.preferredWidth: customizeWashControlPanelButtonWidth
        }

        WasherUiCycleCustomizationItem {
            modeName: "Drying"
            modeNameFont.pixelSize: 10
            modeNameFont.bold: true
            modeNameColor: "#cdff72"

            bgGradientColorStart: "#414856"
            bgGradientColorStop: "#444c5b"

            textFirstState: "ON"
            textSecondState: "OFF"
            toggleFont.pixelSize: 16
            toggleFont.bold: true
            toggleTextColor: "#ffffff"
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: customizeWashControlPanelButtonWidth
            Layout.fillWidth: true
        }

        WasherUiCycleCustomizationItem {
            modeName: "Load"
            modeNameFont.pixelSize: 10
            modeNameFont.bold: true
            modeNameColor: "#cdff72"

            bgGradientColorStart: "#414856"
            bgGradientColorStop: "#444c5b"

            textFirstState: "FULL"
            textSecondState: "1/2"
            toggleFont.pixelSize: 16
            toggleFont.bold: true
            toggleTextColor: "#ffffff"
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: customizeWashControlPanelButtonWidth
            Layout.fillWidth: true
        }

        WasherUiCycleCustomizationItem {
            modeName: "Power saving"
            modeNameFont.pixelSize: 10
            modeNameFont.bold: true
            modeNameColor: "#cdff72"

            bgGradientColorStart: "#414856"
            bgGradientColorStop: "#444c5b"

            textFirstState: "ON"
            textSecondState: "OFF"
            toggleFont.pixelSize: 16
            toggleFont.bold: true
            toggleTextColor: "#ffffff"
            Layout.alignment: Qt.AlignLeft
            Layout.preferredWidth: customizeWashControlPanelButtonWidth
            Layout.fillWidth: true
        }
    }
}
