import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root

    implicitWidth: 300
    implicitHeight: 300

    MediaInfoText {
        id: mediaInfoText
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    MediaInfoExtraControls {
        id: mediaInfoExtraControls
        anchors.bottom: mediaProgressBar.top
        anchors.bottomMargin: 20
        anchors.left: parent.left
        anchors.right: parent.right
    }

    MediaControlsProgressBar {
        id: mediaProgressBar
        value: 0.5
        remainingProgressText: "2:34"
        totalProgressText: "4:12"
        anchors.bottom: mediaInfoControlButtons.top
        anchors.bottomMargin: 30
        anchors.left: parent.left
        anchors.right: parent.right
    }
    MediaControlButtons {
        id: mediaInfoControlButtons
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

    }
}
