import QtQuick 2.15

Item {
    id: root
    anchors.top: topBar.bottom
    implicitHeight: 150
    Rectangle {
        id: background
        color: "#f3f2f5"
        anchors.fill: parent
    }
}
