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
        width: 600
        height: 350
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

            width: 380
            height: 180
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50

            Text {
                id: statusLabel
                anchors.bottom: temperatureDisplay.top
                anchors.bottomMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 16
                color: "#ffffff"
                text: "AWAY"
            }

            Text {
                id: valueDegreeSymbol
                anchors.bottom: temperatureDisplay.top
                anchors.right: temperatureDisplay.right
                anchors.rightMargin: -15
                anchors.topMargin: -15
                font.pixelSize: 58
                height: 20
                width: 20
                color: "#ffffff"
                text: "°"
            }

            Text {
                id: temperatureDisplay
                anchors.bottom: temperatureStatus.top
                anchors.bottomMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 58
                color: "#ffffff"
                text: Math.floor(circularSlider.value)
            }

            Text {
                id: temperatureStatus
                anchors.bottom: circularSlider.bottom
                anchors.bottomMargin: circularSlider.trackBottomMargin - 15
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 18
                color: "#ffffff"
                text: "COOL 69°"
            }
        }
    }
}
