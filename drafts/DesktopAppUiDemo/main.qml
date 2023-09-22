import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 600
    visible: true
    title: qsTr("Desktop App UI Demo")

    Rectangle {
        id: mainContainer
        anchors.fill: parent

        LinearGradient {
            id: mainBackground
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#23305c"}
                GradientStop { position: 0.0; color: "#304875"}
            }
        }

        Item {
            id: leftSidebar
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: 40
            Rectangle {
                id: leftSidebarBackground
                anchors.fill: parent
                color: "#001334"
            }
        }

        Item {
            id: topBar
            anchors.top: parent.top
            anchors.left: leftSidebar.right
            anchors.right: parent.right
            height: 35
            Rectangle {
                id: background
                color: "#ffffff"
                anchors.fill: parent
            }
        }

        Item {
            id: slideshowContainer
            anchors.top: topBar.bottom
            anchors.left: leftSidebar.right
            anchors.right: parent.right
            height: 150
            Rectangle {
                id: slideshowContainerBackground
                color: "#f3f2f5"
                anchors.fill: parent
            }
        }

        Item {
            id: slideshowPageControls
            anchors.top: slideshowContainer.bottom
            anchors.left: leftSidebar.right
            anchors.right: parent.right
            height: 30
            Text {
                text: "••••"
                font.bold: true
                font.pixelSize: 12
                color: "#ffffff"
                anchors.centerIn: parent
            }
        }

        Item {
            id: mainControlsContainer
            anchors.top: slideshowPageControls.bottom
            anchors.left: leftSidebar.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 20
            anchors.topMargin: 0
            Item {
                id: filtersControl
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                height: 40
                Rectangle {
                    color: "#ffffff"
                    opacity: 0.5
                    anchors.fill: parent
                }
            }

            ListModel {
                id: gridModel
                ListElement {
                    providerName: "SalesForce"
                    icon: "qrc:/icons/salesforce-logo.svg"
                }
                ListElement {
                    providerName: "Freshbooks"
                    icon: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Zoho"
                    icon: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Highrise"
                    icon: "pics/portrait.png"
                }
                ListElement {
                    providerName: "RelateIQ"
                    icon: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Teamgate"
                    icon: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Invoice Sherpa"
                    icon: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Xero"
                    icon: "pics/portrait.png"
                }
            }

            Flickable {
                id: scroller
                anchors.top: filtersControl.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                contentHeight: tilesView.height
                contentWidth: tilesView.width
                clip : true

            GridLayout {
                id: tilesView
                columns: 4

                columnSpacing: 15
                rowSpacing: 15

width: mainControlsContainer.width
height: 300

                Repeater {
                    model: gridModel
                    delegate: Item {
                        id: tilesDelegate
                        Rectangle {
                            opacity: 0.5
                            anchors.fill: parent

                            border.width: 1
                            border.color: "red"
                        }
                        Layout.preferredWidth: tilesView.width / 4 - tilesView.columnSpacing
                        Layout.preferredHeight: tilesView.width / 4 - tilesView.rowSpacing
                        Layout.fillWidth: true
                        ColumnLayout {
                            anchors.fill: parent
                            anchors.topMargin: 20
                            anchors.bottomMargin: 20
                            Text {
                                id: label
                                text: providerName
                                color: "#ffffff"
                                Layout.alignment: Qt.AlignHCenter
                            }
                            Text {
                                id: stars
                                text: "✩✩✩✩"
                                color: "#ffffff"
                                Layout.alignment: Qt.AlignHCenter
                            }
                            Image {
                                id: providerIcon
                                source: icon
                                sourceSize.width: tilesDelegate.width * 0.3
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }

                    }
                }
            }
            }
        }
    }
}
