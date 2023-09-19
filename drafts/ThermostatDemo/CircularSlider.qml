import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: root
    anchors.centerIn: parent
    implicitWidth: 200
    implicitHeight: 200

    property color handleColor: "#ffffff"
    property color handleBorderColor: "#ffffff"
    property int handleBorderWidth: 2
    property string trackColor: "#000000"
    property int trackWidth: 5
    property int handleWidth: 20
    property int handleHeight: 20
    property color handleGradientColorStart
    property color handleGradientColorStop
    property string trackGradientColorStart
    property string trackGradientColorStop

    // Add a Canvas for drawing the arc
    Canvas {
        id: track
        anchors.fill: parent
        property real radius: height / 2 - root.trackWidth
        readonly property real angleStart: Math.PI
        readonly property real angleStop: Math.PI * 2
        readonly property real tooMuchAngleChangeLimit: (angleStop - angleStart) * 0.3
        readonly property real centerX: parent.width / 2
        readonly property real centerY: parent.height / 2
        readonly property real capOffset: 0.0

        onPaint: {
            let ctx = getContext("2d");

            // Create a linear gradient for the arc stroke
            if (root.trackGradientColorStart !== "" && root.trackGradientColorStop !== "") {
                let gradient = ctx.createLinearGradient(0, height, width, height);
                gradient.addColorStop(0, root.trackGradientColorStart);
                gradient.addColorStop(1, root.trackGradientColorStop);
                ctx.strokeStyle = gradient;
            } else {
                ctx.strokeStyle = root.trackColor;
            }

            ctx.lineWidth = root.trackWidth;
            ctx.beginPath();
            ctx.arc(centerX, centerY, radius, angleStart, angleStop, false);
            ctx.stroke();
        }

        Rectangle {
            id: handle
            width: root.handleWidth
            height: root.handleHeight
            radius: width / 2

            property real lastAngle: 0.0

            property Gradient bgGradient: Gradient {
                GradientStop { position: 0.0; color: root.handleGradientColorStart }
                GradientStop { position: 1.0; color: root.handleGradientColorStop }
            }

            border.width: root.handleBorderWidth
            border.color: root.handleBorderColor

            color: !!gradient ? "" : handleColor

            gradient: !!root.handleGradientColorStart && !!root.handleGradientColorStop ? bgGradient : null
        }

        Component.onCompleted: {
            let capLeftAngleOriginal = track.angleStart + track.capOffset
            let capLeftAngleTranslated = capLeftAngleOriginal < 0 ? capLeftAngleOriginal + 2*Math.PI : capLeftAngleOriginal - 2*Math.PI
            handle.lastAngle = capLeftAngleTranslated;
            handle.x = track.centerX + track.radius * Math.cos(handle.lastAngle) - handle.width / 2;
            handle.y = track.centerY + track.radius * Math.sin(handle.lastAngle) - handle.height / 2;
        }
    }
    MouseArea {
        id: handleMouseArea
        anchors.fill: parent
        property bool isDragging: false

        onPressed: {
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

            var angleStartAtan2 = Math.atan2(track.centerX + track.radius, track.centerY - track.radius);
            var angleEndAtan2 = Math.atan2(track.centerX - track.radius, track.centerY - track.radius);

            var angle = Math.atan2(mouse.y - track.centerY, mouse.x - track.centerX);
            var angleInverse = Math.cos(angle);

            var maxAngle = track.angleStart + track.angleStop;
            var stopAngle = track.angleStop
            var startAngle = track.angleStart

            var angleMinus2Pi = angle < 0 ? (angle + 2*Math.PI) : (angle - 2*Math.PI);

            var capLeftAngleOriginal = startAngle + track.capOffset
            var capRightAngleOriginal = stopAngle - track.capOffset

            var capLeftAngleTranslated = capLeftAngleOriginal < 0 ? capLeftAngleOriginal + 2*Math.PI : capLeftAngleOriginal - 2*Math.PI
            var capRightAngleTranslated = capRightAngleOriginal > 0 ? capRightAngleOriginal - 2*Math.PI : capRightAngleOriginal + 2*Math.PI

            if (angleMinus2Pi - track.capOffset <=  startAngle) {
                console.log("Left bound exceeded angle: " + angle + "capLeftAngleTranslated: " + capLeftAngleTranslated);
                angle = capLeftAngleTranslated
            }
            if (angleMinus2Pi + track.capOffset >= stopAngle) {
                console.log("Right bound exceeded angle: " + angle + "c capRightAngleTranslated: " + capRightAngleTranslated);
                angle = capRightAngleTranslated
            }

            let lastAngleMinus2Pi = handle.lastAngle < 0 ? (handle.lastAngle + 2*Math.PI) : (handle.lastAngle - 2*Math.PI);

            if (Math.abs(angleMinus2Pi - lastAngleMinus2Pi) >= track.tooMuchAngleChangeLimit) {
                return
            }

            var cosAngle = Math.cos(angle);
            var sinAngle = Math.sin(angle);
            var handleX = track.centerX + track.radius * cosAngle;
            var handleY = track.centerY + track.radius * sinAngle;


            console.log("Position change cos: " + cosAngle + " sin: " + sinAngle);
            console.log("Position change startAngle: " + startAngle + " stopAngle: " + stopAngle);
            console.log("Position change angle is: " + angle + " angleMinus2Pi is: " + angleMinus2Pi + " handleX: " + handleX + " handleY: " + handleY)

            handle.lastAngle = angle
            handle.x = handleX - handle.width / 2
            handle.y = handleY - handle.width / 2
        }
    }
}
