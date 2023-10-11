import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

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

        TimeAndWeather {
            id: timeAndWeather
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.topMargin: 20
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

            TemperatureStatus {
                id: temperatureStatus

                anchors.bottom: temperatureDisplay.top
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TemperatureDisplay {
                id: temperatureDisplay
                anchors.bottom: temperatureLevelStatus.top
                anchors.horizontalCenter: parent.horizontalCenter
                text: Math.floor(circularSlider.value) + "°"
            }

            TemperatureLevelStatus {
                id: temperatureLevelStatus
                anchors.top: circularSlider.bottom
                anchors.topMargin: -20
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        RightSidebar {
            id: rightSidebar
            width: 70
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
        }

        OnOffToggle {
            id: onOffToggle
            property bool isOn: true
            icon.source: "qrc:/icons/propeller-icon.svg"
            text: isOn ? "On" : "Off"
            opacity: isOn ? 1.0 : 0.5
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            height: 60
            onClicked: {
                isOn = !isOn
            }
        }

        BottomSidebar {
            id: bottomSidebar
            anchors.bottom: parent.bottom
            anchors.left: onOffToggle.right
            anchors.right: rightSidebar.left
        }
    }
}
