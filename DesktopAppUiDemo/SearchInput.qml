import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: root

    Behavior on width {
        PropertyAnimation{}
    }

    rightPadding: 32
    leftPadding: 10

    background: Rectangle {
        color: "#ffffff"
        border.width: 0
        border.color: "transparent"
    }

    Image {
        id: searchLabel
        source: "qrc:/icons/icon-search-input.svg"
        sourceSize.width: 16
        sourceSize.height: 16
        anchors.right: parent.right
        anchors.rightMargin: 10
        opacity: 0.75
        anchors.verticalCenter: parent.verticalCenter
    }
    Rectangle {
        id: rightBorder
        anchors.left: parent.right
        width: 1
        height: parent.height
        color: "#dddddd"
    }
}
