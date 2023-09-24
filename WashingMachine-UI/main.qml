import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Washing Machin HMI")

    property int mainControlPanelWidth: 500
    property int mainControlPanelHeight: 290

    Rectangle {
        id: mainContainer
        anchors.fill: parent

        LinearGradient {
            source: mainContainer
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#3a414e" }
                GradientStop { position: 1.0; color: "#111111" }
            }
        }

        Rectangle {
            id: controlPanelShadow
            width: mainControlPanelWidth
            height: mainControlPanelHeight
            color: "#3a414e"
            anchors.centerIn: parent

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 8
                verticalOffset: 8
            }
        }

        Rectangle {
            id: controlPanel
            width: mainControlPanelWidth
            height: mainControlPanelHeight
            color: "#3a414e"
            anchors.centerIn: parent


            Text {
                id: title
                text: "New wash"
                font.pixelSize: 24
                font.bold: true
                color: "#ffffff"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 30
            }

            Text {
                id: subtitle
                text: "What do you want to wash?"
                font.pixelSize: 12
                color: "#cdff72"
                anchors.left: title.left
                anchors.top: title.top
                anchors.topMargin: 50
            }

            WasherStartWashControl {
                id: buttonStartWash

                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 20
                anchors.topMargin: 30
            }

            WashModeSelectionList {
                id: listContainer
                anchors.topMargin: 20
                anchors.top: subtitle.top
                anchors.left: subtitle.left
                anchors.right: parent.right
                clip: true
                interactive: true
            }

            WashCustomizationControlPanel {
                id: washCustomizationControlPanel
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
            }

            Text {
                id: remainingTimeLable
                text: "Washing time: 1:20"
                font.pixelSize: 14
                color: "#ffffff"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
            }

            WasherAdvancedSettingsControl {
                id: washerAdvancedSettingsControl
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.rightMargin: 20
            }
        }
    }
}
