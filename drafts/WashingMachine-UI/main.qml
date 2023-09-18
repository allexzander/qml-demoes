import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property int mainControlPanelWidth: 500
    property int mainControlPanelHeight: 290

    property int customizeWashControlPanelHorizontalOverflow: 60
    property int customizeWashControlPanelWidth: mainControlPanelWidth + customizeWashControlPanelHorizontalOverflow
    property int customizeWashControlPanelHeight: 80
    property int customizeWashControlPanelButtonWidth: 150

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

            Item {
                id: buttonStartWash

                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 20
                anchors.topMargin: 30

                implicitWidth: buttonLabel.width + button.width
                implicitHeight: Math.max(buttonLabel.height, button.height)

                Text {
                    id: buttonLabel
                    text: "Start wash"
                    font.pixelSize: 14
                    font.bold: true
                    color: "#ffffff"

                    anchors.right: button.left

                    anchors.rightMargin: 10

                }
                Item {
                    id: button
                    anchors.right: parent.right
                    anchors.verticalCenter: buttonLabel.verticalCenter
                    width: 30
                    height: 30


                    Rectangle {
                        color: "#cdff72"
                        radius: parent.width /2
                        anchors.fill: parent
                        opacity: enabled && mouseArea.pressed? 0.5: 1.0
                    }
                    Image {
                        source: "qrc:/icons/icon-play.png"
                        sourceSize.width: 32
                        sourceSize.height: 32
                        anchors.fill: parent
                        anchors.margins: 8
                    }

                    MouseArea {
                        id: mouseArea
                        anchors.fill: parent
                    }
                }
            }

            Flickable {
                id: listContainer
                anchors.topMargin: 20
                anchors.top: subtitle.top
                anchors.left: subtitle.left
                anchors.right: parent.right
                height: 40
                contentWidth: washTypes.contentWidth
                contentHeight: washTypes.contentHeight

                clip: true
                interactive: true
                flickableDirection: Flickable.HorizontalFlick

                ListView {
                    id: washTypes
                    anchors.fill: parent
                    spacing: 10
                    orientation: ListView.Horizontal
                    focus: true

                    model: [
                        "TOWELS",
                        "JEANS",
                        "SHIRTS",
                        "BEDLINEN",
                        "BOOTS",
                        "WHITE",
                        "COLORED",
                        "MIXED"
                    ]
                    delegate: Item {
                        id: washTypeDelegate
                        implicitWidth: label.implicitWidth
                        implicitHeight: label.implicitHeight
                        Text {
                            id: label
                            text: modelData
                            color: "#ffffff"
                            opacity: washTypes.currentIndex === model.index ? 1.0 : 0.5
                            font.bold: true
                            font.pixelSize: 30
                        }
                        MouseArea {
                            id: delegateMouseArea
                            anchors.fill: parent
                            onClicked: {
                                var mouseX = mouse.x
                                var mouseY = mouse.y
                                var delegateRightX = parent.x + parent.width
                                var delegateLeftX = parent.x
                                var containerWidth = controlPanel.width
                                var containerX = controlPanel.x
                                if (delegateRightX > containerWidth) {
                                    listContainer.flick(-700, 0)
                                } else if (delegateLeftX < containerX) {
                                    listContainer.flick(700, 0)
                                }

                                washTypes.currentIndex = index;
                            }
                        }
                    }
                }
            }

            Rectangle {
                id: washCustomizationControlPanel
                width: customizeWashControlPanelButtonWidth * 4
                height: customizeWashControlPanelHeight
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
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.rightMargin: 20
                width: 32
                height: 32

                opacity: 0.4

                Image {
                    source: "qrc:/icons/icon-gear.png"
                    sourceSize.width: 32
                    sourceSize.height: 32
                    anchors.fill: parent
                    anchors.margins: 8
                }
                MouseArea {
                    id: mouseAreaButtonAdvancedSettings
                    anchors.fill: parent
                }
            }
        }
    }
}
