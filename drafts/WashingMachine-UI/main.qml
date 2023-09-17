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
            id: controlPanel
            width: 450
            height: 250
            color: "#3a414e"
            anchors.centerIn: parent

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 8
                verticalOffset: 8
            }

            Text {
                id: title
                text: "New wash"
                font.pixelSize: 24
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
                        implicitWidth: label.implicitWidth
                        implicitHeight: label.implicitHeight
                        Text {
                            id: label
                            text: modelData
                            color: washTypes.currentIndex === index ? "#ffffff" : "#222222"
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
                width: 450
                height: 50
                color: "#3a414e"
                anchors.top: listContainer.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    horizontalOffset: 8
                }

                RowLayout {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top


                    Item {
                        implicitWidth: 150
                        implicitHeight: 50
                        Text {
                            id: modeName
                            anchors.top: parent.top
                            anchors.left: parent.left
                            text: "Rinsing"
                        }

                        Item {
                            id: modes
                            anchors.left: modeName.left
                            anchors.right: parent.right
                            anchors.top: modeName.top
                            Button {
                                id: firstMode
                                anchors.left: parent.left
                                text: "ON"
                                width: 20
                                height: 20
                            }
                            Button {
                                id: secondMode
                                anchors.left: firstMode.right
                                anchors.leftMargin: 20
                                text: "OFF"
                                width: 20
                                height: 20
                            }
                        }

                        ButtonGroup {
                            buttons: modes.children
                            onClicked: console.log("clicked:", button.text)
                        }

                        Layout.alignment: Qt.AlignVCenter

                    }
                }

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
                    font.pixelSize: 12
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

        }
    }
}
