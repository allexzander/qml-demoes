import QtQuick 2.15
import QtQuick.Controls 2.15

ProgressBar {
    id: control

    property alias remainingProgressText: remainingProgress.text
    property alias totalProgressText: total.text

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 2
        color: "#89b3e2"
        radius: 3

        Text {
            id: remainingProgress
            color: "white"
            font.pixelSize: 10
            anchors.topMargin: 5
            anchors.top: parent.bottom
            anchors.left: parent.left
        }
        Text {
            id: total
            color: "white"
            font.pixelSize: 10
            anchors.topMargin: 5
            anchors.top: parent.bottom
            anchors.right: parent.right
        }
    }

    contentItem: Item {
        id: barItem
        implicitWidth: 200
        implicitHeight: 2

        Rectangle {
            id: barItemRect
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 2
            color: "#ffffff"
        }
    }
}
