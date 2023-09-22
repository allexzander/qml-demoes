import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15

Window {
    width: 640
    height: 480
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
                    portrait: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Freshbooks"
                    portrait: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Zoho"
                    portrait: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Highrise"
                    portrait: "pics/portrait.png"
                }
                ListElement {
                    providerName: "RelateIQ"
                    portrait: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Teamgate"
                    portrait: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Invoice Sherpa"
                    portrait: "pics/portrait.png"
                }
                ListElement {
                    providerName: "Xero"
                    portrait: "pics/portrait.png"
                }
            }

            GridLayout {
                id: tilesView
                columns: 4

                anchors.top: filtersControl.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                Repeater {
                    model: gridModel
                    delegate: Item {
                        id: tilesDelegate
                        width: tilesView.cellWidth - 10
                        height: width
                        Rectangle {
                            color: "#ffffff"
                            opacity: 0.5
                            anchors.fill: parent

                            border.width: 1
                            border.color: "red"
                        }
                        Text {
                            id: label
                            text: providerName
                        }
                    }
                }
            }

            GridView {
                id: tilesView
                anchors.top: filtersControl.bottom
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom

                cellWidth: tilesView.width / 4
                cellHeight: cellWidth

                snapMode: GridView.SnapOneRow

                clip: true

                Rectangle {
                    color: "transparent"
                    border.width: 1
                    border.color: "green"
                    anchors.fill: parent
                }


                model: gridModel

                delegate: Item {
                    id: tilesDelegate
                    width: tilesView.cellWidth - 10
                    height: width
                    Rectangle {
                        color: "#ffffff"
                        opacity: 0.5
                        anchors.fill: parent

                        border.width: 1
                        border.color: "red"
                    }
                    Text {
                        id: label
                        text: providerName
                    }
                }
            }
        }
    }
}
