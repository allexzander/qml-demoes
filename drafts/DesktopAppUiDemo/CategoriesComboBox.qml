import QtQuick 2.15
import QtQuick.Controls 2.15

ComboBox {
    id: control

    delegate: ItemDelegate {
        width: control.width
        height: 50
        contentItem: Text {
            text: modelData
            color: "#ffffff"
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        highlighted: control.highlightedIndex === model.index



        background: Rectangle {
            color: control.highlightedIndex === model.index ? "#444444" : "transparent" // Set the highlight color to gray
        }
    }

    indicator: Canvas {
        id: canvas
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() { canvas.requestPaint(); }
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0); // Start at the top-left corner
            context.lineTo(width / 2, height); // Draw a line to the bottom point
            context.lineTo(width, 0); // Draw a line to the top-right corner
            context.strokeStyle = control.pressed ? "#ffffff" : "#ffffff"; // Set the stroke color
            context.stroke(); // Draw the triangle outline
        }
    }

    contentItem: Text {
        leftPadding: 10
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        color: control.pressed ? "#ffffff" : "#ffffff"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        color: "#ffffff"
        opacity: 0.5
        border.color: control.pressed ? "#ffffff" : "transparent"
        border.width: control.visualFocus ? 2 : 1
        radius: 2
    }

    popup: Popup {
        id: controlPopup
        y: control.height - 1
        width: control.width
        implicitHeight: 150
        padding: 1

        contentItem: Column {
            clip: true
            Repeater {
                anchors.fill: parent
                model: control.popup.visible ? control.delegateModel : null
            }
        }

        background: Rectangle {
            border.color: "#ffffff"
            color: "#dddddd"
            radius: 2
        }
    }
}
