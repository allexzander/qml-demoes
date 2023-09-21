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
        width: 500
        height: 300
        anchors.centerIn: parent

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
            trackGradientColorStart: "#9f28be"
            trackGradientColorStop: "#6b91fb"

            handleColor: "#ffffff"
            handleBorderColor: "#9628b4"
            handleBorderWidth: 2

            width: 300
            height: 300
            anchors.centerIn: parent

            Text {
                id: statusLabel
                anchors.top: parent.top
                anchors.topMargin: 120
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 16
                color: "#ffffff"
                text: "AWAY"
            }

            Text {
                id: temperatureDisplay
                anchors.top: statusLabel.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 58
                color: "#ffffff"
                text: Math.floor(circularSlider.value)
            }

            Text {
                id: valueDegreeSymbol
                anchors.top: temperatureDisplay.top
                anchors.right: temperatureDisplay.right
                anchors.rightMargin: -30
                anchors.topMargin: -10
                font.pixelSize: 58
                color: "#ffffff"
                text: "°"
            }

            Text {
                id: temperatureStatus
                anchors.top: temperatureDisplay.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 18
                color: "#ffffff"
                text: "COOL 69°"
            }
        }
    }
}
