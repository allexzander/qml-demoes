import QtQuick 2.15
import QtQuick.Layouts 1.15

RowLayout {
    id: root
    property int currentIndex: 0
    Repeater {
        model: [
            "ALL",
            "NEW",
            "FEATURED",
            "POPULAR"
        ]
        delegate: Item {
            implicitWidth: Math.max(label.implicitWidth, highlight.implicitWidth)
            implicitHeight: label.height
            property bool hovered: mouseArea.containsMouse
            Text {
                id: label
                text: modelData
                color: "#ffffff"
                font.pixelSize: 12
                opacity: hovered || root.currentIndex === model.index ? 1.0 : 0.5
            }
            Rectangle {
                id: highlight
                color: "#019bfa"
                width: label.width + 10
                height: 2
                anchors.top: label.bottom
                anchors.topMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                visible: root.currentIndex === index || hovered
                opacity: hovered && root.currentIndex !== index ? 0.5 : 1.0
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: root.currentIndex = index
            }

            Layout.leftMargin: 5
            Layout.preferredWidth: implicitWidth
        }
    }
}
