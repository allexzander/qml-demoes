import QtQuick 2.15
import QtQuick.Layouts 1.15

Item {
    id: root
    implicitHeight: 40
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
    }
    RowLayout {
        id: buttonsLayout
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 250
        spacing: 10
        property int currentIndex: 0
        property int hoveredIndex: -1
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
                    opacity: hovered || buttonsLayout.currentIndex === index ? 1.0 : 0.5
                }
                Rectangle {
                    id: highlight
                    color: "#019bfa"
                    width: label.width + 10
                    height: 2
                    anchors.top: label.bottom
                    anchors.topMargin: 8
                    anchors.horizontalCenter: parent.horizontalCenter
                    visible: buttonsLayout.currentIndex === index || hovered
                    opacity: hovered && buttonsLayout.currentIndex !== index ? 0.5 : 1.0
                }
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: buttonsLayout.currentIndex = index
                }

                Layout.leftMargin: 5
                Layout.preferredWidth: implicitWidth
            }
        }
    }
}
