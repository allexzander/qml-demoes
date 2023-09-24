import QtQuick 2.15
import QtQuick.Layouts 1.15

GridLayout {
    id: root
    columns: 4

    columnSpacing: 15
    rowSpacing: 15

    property alias model: repeater.model

    Repeater {
        id: repeater
        delegate: Item {
            id: tilesDelegate
            Rectangle {
                opacity: 0.5
                anchors.fill: parent

                border.width: 1
                border.color: "red"
            }
            Layout.preferredWidth: root.width / 4 - root.columnSpacing
            Layout.preferredHeight: root.width / 4 - root.rowSpacing
            Layout.fillWidth: true
            ColumnLayout {
                anchors.fill: parent
                anchors.topMargin: 20
                anchors.bottomMargin: 20
                Text {
                    id: label
                    text: providerName
                    color: "#ffffff"
                    Layout.alignment: Qt.AlignHCenter
                }
                Text {
                    id: stars
                    text: "✩✩✩✩"
                    color: "#ffffff"
                    Layout.alignment: Qt.AlignHCenter
                }
                Image {
                    id: providerIcon
                    source: icon
                    sourceSize.width: tilesDelegate.width * 0.3
                    Layout.alignment: Qt.AlignHCenter
                }
            }

        }
    }
}