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


        Rectangle {
                anchors.centerIn: parent
                width: 200
                height: 200

                // Add a Canvas for drawing the arc
                Canvas {
                    id: arcCanvas
                    anchors.fill: parent
                    property real radius: height / 2 - arcCanvas.lineWidth
                    readonly property real angleStart: Math.PI
                    readonly property real angleStop: Math.PI * 2
                    readonly property real centerX: parent.width / 2
                    readonly property real centerY: parent.height / 2
                    property bool firstPaint: true
                    readonly property real lineWidth: 5
                    readonly property real capOffset: 0.3

                    onPaint: {
                        var ctx = getContext("2d");

                        // Create a linear gradient for the arc stroke
                        var gradient = ctx.createLinearGradient(0, height, width, height);
                        gradient.addColorStop(0, "blue");
                        gradient.addColorStop(1, "red");

                        ctx.strokeStyle = gradient;
                        ctx.lineWidth = arcCanvas.lineWidth;


                        ctx.beginPath();
                        ctx.arc(centerX, centerY, radius, angleStart, angleStop, false);
                        ctx.stroke();

                        var cosAngle = Math.cos(handle.lastAngle);
                        var sinAngle = Math.sin(handle.lastAngle);

                        var handleX = centerX + arcCanvas.radius * cosAngle;
                        var handleY = centerY + arcCanvas.radius * sinAngle;

                        console.log("handle.lastAngle: " + handle.lastAngle);
                    }

                    Rectangle {
                        id: handle
                        width: 20
                        height: 20
                        radius: width / 2

                        property real lastAngle

                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "lightblue" }
                            GradientStop { position: 1.0; color: "lightgreen" }
                        }
                    }


                    Component.onCompleted: {
                        var capLeftAngleOriginal = arcCanvas.angleStart + arcCanvas.capOffset
                        var capLeftAngleTranslated = capLeftAngleOriginal < 0 ? capLeftAngleOriginal + 2*Math.PI : capLeftAngleOriginal - 2*Math.PI
                        handle.lastAngle = capLeftAngleTranslated;
                        handle.x = arcCanvas.centerX + arcCanvas.radius * Math.cos(handle.lastAngle) - handle.width / 2;
                        handle.y = arcCanvas.centerY + arcCanvas.radius * Math.sin(handle.lastAngle) - handle.height / 2;
                    }
                }
                MouseArea {
                    id: handleMouseArea
                    anchors.fill: parent
                    property bool isDragging: false


                    onPressed: {

                        var handleX = handle.x
                        var handleY = handle.y
                        var handleWidth = handle.width
                        var handleHeight = handle.height
                        if (mouse.x >= handle.x && mouse.x <= handle.x + handle.width) {
                            if (mouse.y >= handle.y && mouse.y <= handle.y + handle.height) {
                                isDragging = true
                            }
                        }
                    }

                    onReleased: {
                        isDragging = false;
                    }

                    onPositionChanged: {
                        if (!isDragging) {
                            return;
                        }

                        var angleStartAtan2 = Math.atan2(arcCanvas.centerX + arcCanvas.radius, arcCanvas.centerY - arcCanvas.radius);
                        var angleEndAtan2 = Math.atan2(arcCanvas.centerX - arcCanvas.radius, arcCanvas.centerY - arcCanvas.radius);

                        var angle = Math.atan2(mouse.y - arcCanvas.centerY, mouse.x - arcCanvas.centerX);
                        var angleInverse = Math.cos(angle);




                        var maxAngle = arcCanvas.angleStart + arcCanvas.angleStop;
                        var stopAngle = arcCanvas.angleStop
                        var startAngle = arcCanvas.angleStart




                        var angleMinus2Pi = angle < 0 ? (angle + 2*Math.PI) : (angle - 2*Math.PI);

                        var capLeftAngleOriginal = startAngle + arcCanvas.capOffset
                        var capRightAngleOriginal = stopAngle - arcCanvas.capOffset

                        var capLeftAngleTranslated = capLeftAngleOriginal < 0 ? capLeftAngleOriginal + 2*Math.PI : capLeftAngleOriginal - 2*Math.PI
                        var capRightAngleTranslated = capRightAngleOriginal > 0 ? capRightAngleOriginal - 2*Math.PI : capRightAngleOriginal + 2*Math.PI

                                            if (angleMinus2Pi - arcCanvas.capOffset <=  startAngle) {
                                                console.log("Left bound exceeded angle: " + angle + "capLeftAngleTranslated: " + capLeftAngleTranslated);
                                                angle = capLeftAngleTranslated
                                            }
                                            if (angleMinus2Pi + arcCanvas.capOffset >= stopAngle) {
                                                 console.log("Right bound exceeded angle: " + angle + "c capRightAngleTranslated: " + capRightAngleTranslated);
                                                angle = capRightAngleTranslated
                                            }

                                            if (Math.abs(angle) - Math.abs(handle.lastAngle) >= 1.0) {
                                                console.log("Too much angle change!!!!")
                                                return
                                            } else {
                                                console.log("NOT too much angle change!!!! angle: " + angle + " handle.lastAngle: " + handle.lastAngle)
                                            }

                                            var cosAngle = Math.cos(angle);
                                            var sinAngle = Math.sin(angle);
                                            var handleX = arcCanvas.centerX + arcCanvas.radius * cosAngle;
                                            var handleY = arcCanvas.centerY + arcCanvas.radius * sinAngle;


                                           //console.log("Position change cos: " + cosAngle + " sin: " + sinAngle);
//console.log("Position change startAngle: " + startAngle + " stopAngle: " + stopAngle);
                       // console.log("Position change angle is: " + angle + " angleMinus2Pi is: " + angleMinus2Pi + " handleX: " + handleX + " handleY: " + handleY)

                                            handle.lastAngle = angle
                                            handle.x = handleX - handle.width / 2
                                            handle.y = handleY - handle.width / 2
                    }
                }
            }
        }

}
