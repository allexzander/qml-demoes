import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Window {
    width: 750
    height: 630
    visible: true
    title: qsTr("Desktop App UI Demo")

    Rectangle {
        id: mainContainer
        width: Math.max(parent.width, 750)
        height: Math.max(parent.height, 630)

        LinearGradient {
            id: mainBackground
            anchors.fill: parent
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#23305c"}
                GradientStop { position: 0.0; color: "#304875"}
            }
        }

        ListModel {
            id: slideshowModel
            ListElement {
                header: qsTr("Wunderlist Pro")
                subHeader: qsTr("Upgrade your Wunderlist experience and start accomplishing even more at home and in the office.")
                buttonLabel: "Upgrade to Wunderlist Pro"
                subtitle: "In the team? Go for Wunderlist for Business"
                icon: "qrc:/slideshowassets/image-laptopandsmartphone.png"
            }
            ListElement {
                header: qsTr("New Release")
                subHeader: qsTr("We've jsut released a new improved version. Now, even more productivity.")
                buttonLabel: "Check new version"
                subtitle: "In the team? Go for Wunderlist for Business"
                icon: "qrc:/slideshowassets/image-newrelease.svg"
            }
            ListElement {
                header: qsTr("Latest News")
                subHeader: qsTr("Significant market growth in IT is expected in the Q1 2024.")
                buttonLabel: "Upgrade to Wunderlist Pro"
                subtitle: "In the team? Go for Wunderlist for Business"
                icon: "qrc:/slideshowassets/image-news.png"
            }
        }

        LeftSidebar {
            id: leftSidebar
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
        }

        TopBar {
            id: topBar
            anchors.top: parent.top
            anchors.left: leftSidebar.right
            anchors.right: parent.right
        }

        SlideshowContainer {
            id: slideshowContainer
            model: slideshowModel
            anchors.top: topBar.bottom
            anchors.left: leftSidebar.right
            anchors.right: parent.right
            currentIndex: 0
            Component.onCompleted: {
                slideshowContainer.positionViewAtBeginning()
            }
        }

        SlideshowPageControls {
            id: slideshowPageControls
            model: slideshowModel
            anchors.top: slideshowContainer.bottom
            anchors.left: leftSidebar.right
            anchors.right: parent.right

            onCurrentIndexChanged: {
                slideshowContainer.currentIndex = currentIndex
            }
            Connections {
                target: slideshowContainer
                function onCurrentIndexChanged() {
                    slideshowPageControls.currentIndex = slideshowContainer.currentIndex
                }
            }
        }

        MainControlsContainer {
            id: mainControlsContainer

            anchors.top: slideshowPageControls.bottom
            anchors.left: leftSidebar.right
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 20
            anchors.topMargin: 0
        }
    }
}
