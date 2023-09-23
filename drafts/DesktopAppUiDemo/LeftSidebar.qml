import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    implicitWidth: 40
    property int layoutIconWidth: 24
    Rectangle {
        id: background
        anchors.fill: parent
        color: "#001334"
    }

    Image {
        id: mainIcon
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter
        sourceSize.width: 16
        sourceSize.height: 16
        source: "qrc:/icons/left-sidebar-main-icon.svg"
    }

    ColumnLayout {
        id: icons
        anchors.top: mainIcon.bottom
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.right: parent.right
        height: root.layoutIconWidth * 4 + spacing * 3

        spacing: 20

        Image {
            sourceSize.width: root.layoutIconWidth
            sourceSize.height: root.layoutIconWidth
            source: "qrc:/icons/left-sidebar-list-icon-facebook.svg"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: root.layoutIconWidth
            Layout.preferredHeight: root.layoutIconWidth
        }
        Image {
            sourceSize.width: root.layoutIconWidth
            sourceSize.height: root.layoutIconWidth
            source: "qrc:/icons/left-sidebar-list-icon-airbnb.svg"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: root.layoutIconWidth
            Layout.preferredHeight: root.layoutIconWidth
        }
        Image {
            sourceSize.width: root.layoutIconWidth
            sourceSize.height: root.layoutIconWidth
            source: "qrc:/icons/left-sidebar-list-icon-dropbox.svg"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: root.layoutIconWidth
            Layout.preferredHeight: root.layoutIconWidth
        }
        Image {
            sourceSize.width: root.layoutIconWidth
            sourceSize.height: root.layoutIconWidth
            source: "qrc:/icons/left-sidebar-list-icon-youtube.svg"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: root.layoutIconWidth
            Layout.preferredHeight: root.layoutIconWidth
        }
    }
}
