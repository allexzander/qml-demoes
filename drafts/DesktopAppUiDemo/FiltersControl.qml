import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    implicitHeight: 40
    signal filterIndexChanged(int index)
    Rectangle {
        id: mainBackground
        color: "#ffffff"
        opacity: 0.5
        anchors.fill: parent
    }

    CategoriesComboBox {
        width: 150
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5
        model: [ "Collections", "Partnets", "Resources" ]
        onCurrentIndexChanged: root.filterIndexChanged(currentIndex)
    }

    FilterButtons {
        id: filterButtons
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 250
        spacing: 10
        onCurrentIndexChanged: root.filterIndexChanged(filterButtons.currentIndex)
    }
}
