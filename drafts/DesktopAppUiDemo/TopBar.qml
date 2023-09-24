import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    implicitHeight: 35
    Rectangle {
        id: background
        color: "#ffffff"
        anchors.fill: parent
    }

    TextField {
        id: searchField
        anchors.left: parent
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: activeFocus ? 150 : 50
        Behavior on width {
            PropertyAnimation{}
        }
        rightPadding: 10
        leftPadding: 32
        Image {
            id: searchLabel
            source: "qrc:/icons/icon-search-input.svg"
            sourceSize.width: 16
            sourceSize.height: 16
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        background: Rectangle {
            color: "#ffffff"
            border.width: 1
            border.color: "#dddddd"
        }
    }

}
