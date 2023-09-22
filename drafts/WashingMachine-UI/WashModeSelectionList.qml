import QtQuick 2.0

Flickable {
    id: root
    implicitHeight: 40
    contentWidth: washTypes.contentWidth
    contentHeight: washTypes.contentHeight

    flickableDirection: Flickable.HorizontalFlick

    ListView {
        id: washTypes
        anchors.fill: parent
        spacing: 10
        orientation: ListView.Horizontal
        focus: true

        model: [
            "TOWELS",
            "JEANS",
            "SHIRTS",
            "BEDLINEN",
            "BOOTS",
            "WHITE",
            "COLORED",
            "MIXED"
        ]
        delegate: Item {
            id: washTypeDelegate
            implicitWidth: label.implicitWidth
            implicitHeight: label.implicitHeight
            Text {
                id: label
                text: modelData
                color: "#ffffff"
                opacity: washTypes.currentIndex === model.index ? 1.0 : 0.5
                font.bold: true
                font.pixelSize: 30
            }
            MouseArea {
                id: delegateMouseArea
                anchors.fill: parent
                onClicked: {
                    var mouseX = mouse.x
                    var mouseY = mouse.y
                    var delegateRightX = parent.x + parent.width
                    var delegateLeftX = parent.x
                    var containerWidth = controlPanel.width
                    var containerX = controlPanel.x
                    if (delegateRightX > containerWidth) {
                        root.flick(-700, 0)
                    } else if (delegateLeftX < containerX) {
                        root.flick(700, 0)
                    }

                    washTypes.currentIndex = index;
                }
            }
        }
    }
}
