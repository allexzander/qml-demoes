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

                    }
                    Component.onCompleted: {
                        handle.lastAngle = angleStart/4;
                        handle.x = arcCanvas.centerX - arcCanvas.radius * Math.cos(angleStart/4);
                        handle.y = arcCanvas.centerY - arcCanvas.radius * Math.sin(angleStart/4);
                    }
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

                        var cosAngle = Math.cos(angle);
                        var sinAngle = Math.sin(angle);


                        var handleX = arcCanvas.centerX + arcCanvas.radius * cosAngle;
                        var handleY = arcCanvas.centerY + arcCanvas.radius * sinAngle;


                                            if (cosAngle - arcCanvas.capOffset < 0 && sinAngle + arcCanvas.capOffset > 0) {
                                                console.log("Left bound exceeded: " + Math.atan(angle));
                                                handleX = arcCanvas.centerX + arcCanvas.radius * -1 + arcCanvas.capOffset;
                                                handleY = arcCanvas.centerY + arcCanvas.radius * (0 + arcCanvas);
                                            }
                                            if (sinAngle + arcCanvas.capOffset > 0 && cosAngle + arcCanvas.capOffset > 0) {
                                                handleX = arcCanvas.centerX + arcCanvas.radius * (1 - arcCanvas.capOffset);
                                                handleY = arcCanvas.centerY + arcCanvas.radius * (0 - arcCanvas.capOffset);
                                            }

                                            console.log("Position change cos: " + cosAngle + " sin: " + sinAngle);
console.log("Position change startAngle: " + startAngle + " stopAngle: " + stopAngle);
                        console.log("Position change angle is: " + angle + " handleX: " + handleX + " handleY: " + handleY)

                                            handle.lastAngle = angle
                                            handle.x = handleX
                                            handle.y = handleY
                    }
                }
            }
        }

}
