import QtQuick 2.15
import QtQuick.Controls 2.15

AbstractButton {
    id: root
    implicitWidth: contentItem.implicitWidth
    implicitHeight: 40

    contentItem: Item {
        anchors.fill: parent
        implicitWidth: 100
        implicitHeight: contentItemContainer.implicitHeight
        Item {
            id: contentItemContainer
            readonly property int spacing: 5
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            implicitWidth: 100
            implicitHeight: Math.max(icon.implicitHeight, label.implicitHeight)
            Image {
                id: icon
                source: root.icon.source
                sourceSize.width: 24
                sourceSize.height: 24
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                id: label
                font.pixelSize: 20
                color: "#ffffff"
                text: root.text
                anchors.left: icon.right
                anchors.leftMargin: parent.spacing
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Rectangle {
            border.color: "red"
            border.width: 1
            color: "transparent"
        }
    }
    background: Rectangle {
        color: "transparent"
    }
}

