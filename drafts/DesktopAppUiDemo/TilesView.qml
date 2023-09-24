import QtQuick 2.15
import QtQuick.Layouts 1.15

GridLayout {
    id: root
    columns: 4


    property alias model: repeater.model

    Repeater {
        id: repeater
        delegate: Item {
            id: tilesDelegate
            Rectangle {
                opacity: mouseArea.containsMouse ? 1.0 : 0.5
                color: "#344a81"
                anchors.fill: parent
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
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
            }
        }
    }
}
