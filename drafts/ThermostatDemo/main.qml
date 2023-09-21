import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true

    color: "#172168"
    Rectangle {
        id: container
        anchors {
            fill: parent
            leftMargin: 40
            rightMargin: 40
            topMargin: 80
            bottomMargin: 80
        }
        LinearGradient {
            id: gradientBackground
            source: container
            anchors.fill: parent

            gradient: Gradient {
                GradientStop {
                    position: 0.0;
                    color: "#7591ff"
                }
                GradientStop {
                    position: 1.0;
                    color: "#83c7fe"
                }
            }
        }

        CircularSlider {
            id: circularSlider
            startAngleDegrees: 180
            endAngleDegrees: 360
            trackGradientColorStart: "red"
            trackGradientColorStop: "blue"

            handleGradientColorStart: "lightgreen"
            handleGradientColorStop: "lightblue"

            anchors.margins: 80
            anchors.fill: parent
        }
        Text {
            anchors.top: circularSlider.bottom
            anchors.horizontalCenter: circularSlider.horizontalCenter
            anchors.topMargin: 20
            font.bold: true
            font.pixelSize: 14
            color: "#ffffff"
            id: valueDisplay
            text: circularSlider.value
        }
    }
}
