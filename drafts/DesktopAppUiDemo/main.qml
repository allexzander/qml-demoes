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
            anchors.top: topBar.bottom
            anchors.left: leftSidebar.right
            anchors.right: parent.right
        }

        SlideshowPageControls {
            id: slideshowPageControls
            anchors.top: slideshowContainer.bottom
            anchors.left: leftSidebar.right
            anchors.right: parent.right
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
