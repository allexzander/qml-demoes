import QtQuick 2.15

Item {
    id: root

    StatusBarIcons {
        id: infoIcons
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.rightMargin: 20
    }

    MediaNavigationButton {
        iconSource: "qrc:/icons/arrow-back.png"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }
}
