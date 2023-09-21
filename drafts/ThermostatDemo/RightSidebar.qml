import QtQuick 2.15
import QtQuick.Layouts 1.12

Item {
    id: root

    Rectangle {
        id: background
        anchors.fill: parent
        color: "#7591ff"
        opacity: 0.5
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        spacing: 0
        SidebarButton {
            text: "Device"
            icon.source: "qrc:/icons/right-sidebar-icon-menu.svg"

            Layout.alignment: Qt.AlignCenter
        }
        SidebarButton {
            text: "Scenes"
            icon.source: "qrc:/icons/right-sidebar-icon-scenes.svg"

            Layout.alignment: Qt.AlignCenter
        }
        SidebarButton {
            text: "Alerts"
            icon.source: "qrc:/icons/right-sidebar-icon-alerts.svg"

            Layout.alignment: Qt.AlignCenter
        }
        SidebarButton {
            text: "Settings"
            icon.source: "qrc:/icons/right-sidebar-icon-settings.svg"

            Layout.alignment: Qt.AlignCenter
        }
    }
}
