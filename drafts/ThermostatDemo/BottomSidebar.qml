import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    implicitHeight: 60

    RowLayout {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 15
        anchors.rightMargin: 25
        spacing: 0
        BottomSidebarButton {
            text: "Cool"
            icon.source: "qrc:/icons/temperature-icon-tempstatus.svg"
            Layout.alignment: Qt.AlignCenter | Qt.AlignVCenter
        }
        BottomSidebarButton {
            text: "Auto"
            icon.source: "qrc:/icons/lightning-icon.svg"
            Layout.alignment: Qt.AlignCenter | Qt.AlignVCenter
        }
        BottomSidebarButton {
            text: "Heat"
            icon.source: "qrc:/icons/fire-icon.svg"
            Layout.alignment: Qt.AlignCenter | Qt.AlignVCenter
        }
    }
}
