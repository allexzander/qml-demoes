import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
Window {
    width: 640
    height: 480
    visible: true

    Rectangle {
        id: container
        anchors.fill: parent
        color: "#172168"
        LinearGradient {
            id: gradientBackground
            anchors {
                fill: parent
                leftMargin: 40
                rightMargin: 40
                topMargin: 80
                bottomMargin: 80
            }
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
            trackGradientColorStart: "red"
            trackGradientColorStop: "blue"

            handleGradientColorStart: "lightgreen"
            handleGradientColorStop: "lightblue"

            anchors.centerIn: parent
            width: 200
            height: 200
        }
    }
}
