import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: root
    anchors.centerIn: parent
    implicitWidth: 200
    implicitHeight: 200

    /* clockwise degrees count */
    property int startAngleDegrees: 180
    property int endAngleDegrees: 20

    property real value: 40

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

    QtObject {
        id: internal
        function toRadians(angle) {
            return angle * (Math.PI/180)
        }
        function toDegrees(radians) {
            return radians * (180 / Math.PI);
        }
        function convertToAtan2Range(angle) {
            if (angle >= 0 && angle < Math.PI) {
                return angle;
            } else {
                return angle - 2 * Math.PI;
            }
        }
        function isWithinRange(degree_value, start_degrees, end_degrees) {
            if (start_degrees <= end_degrees) {
                // Standard range where start_degrees <= end_degrees
                return degree_value >= start_degrees && degree_value <= end_degrees;
            } else {
                // Range that wraps around the unit circle
                return degree_value >= start_degrees || degree_value <= end_degrees;
            }
        }
        function absoluteRadiansBetweenClockwise(startAngleRadians, endAngleRadians) {
            let clockwiseRadians = endAngleRadians - startAngleRadians;
            if (clockwiseRadians < 0) {
                clockwiseRadians += 2 * Math.PI;
            }
            return clockwiseRadians;
        }
        property real startAngle: toRadians(root.startAngleDegrees)
        property real endAngle: toRadians(root.endAngleDegrees)

        property real valueFactor: 100 / absoluteRadiansBetweenClockwise(startAngle, endAngle)
    }

    // Add a Canvas for drawing the arc
    Canvas {
        id: track
        anchors.fill: parent
        property real radius: height / 2 - root.trackWidth
        readonly property real tooMuchAngleChangeLimit: (internal.endAngle - internal.startAngle) * 0.3
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
            ctx.arc(centerX, centerY, radius, internal.startAngle, internal.endAngle, false);
            ctx.stroke();
            console.log("Drawing arc from internal.startAngle: " + internal.startAngle + " to internal.endAngle: " + internal.endAngle);
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
            let angleAbsolute = internal.startAngle + (root.value / internal.valueFactor)
            let initialAngle = internal.convertToAtan2Range(angleAbsolute)
            let initialAngleTransformed = initialAngle
            handle.lastAngle = initialAngleTransformed;
            console.log("initialAngleTransformed is: " + initialAngleTransformed)
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

            var startAngleAtan2 = Math.atan2(track.centerX + track.radius, track.centerY - track.radius);
            var angleEndAtan2 = Math.atan2(track.centerX - track.radius, track.centerY - track.radius);

            var angle = Math.atan2(mouse.y - track.centerY, mouse.x - track.centerX);
            var angleInverse = Math.cos(angle);

            var maxAngle = internal.startAngle + internal.endAngle;
            var endAngle = internal.endAngle
            var startAngle = internal.startAngle

            var angleAbsolute = angle < 0 ? (angle + 2*Math.PI) : angle;


            var capLeftAngleOriginal = internal.startAngle + track.capOffset
            var capRightAngleOriginal = internal.endAngle - track.capOffset

            var capLeftAngleTranslated = capLeftAngleOriginal < 0 ? capLeftAngleOriginal + 2*Math.PI : capLeftAngleOriginal - 2*Math.PI
            var capRightAngleTranslated = capRightAngleOriginal > 0 ? capRightAngleOriginal - 2*Math.PI : capRightAngleOriginal + 2*Math.PI

            var angleMinus2Pi = angle < 0 ? (angle + 2*Math.PI) : (angle - 2*Math.PI);

            let clockwiseAngle = Math.PI - angle

            var clockwiseAngleAbsolute = clockwiseAngle < 0 ? (clockwiseAngle + 2*Math.PI) : clockwiseAngle;

            var angleAbsoluteDeg = internal.toDegrees(angleAbsolute)
            var angleStartDeg = internal.toDegrees(startAngle)
            var angleEndDeg = internal.toDegrees(endAngle)

            console.log("angleAbsoluteDeg is: " + angleAbsoluteDeg + " angleStartDeg: " + angleStartDeg + " angleEndDeg: " + angleEndDeg);

            let lowerBound = angleStartDeg < angleEndDeg ? angleStartDeg : angleEndDeg
            let upperBound = angleEndDeg > angleStartDeg ? angleEndDeg : angleStartDeg

            if (internal.isWithinRange(angleAbsoluteDeg, angleStartDeg, angleEndDeg)) {
                console.log("The degrees value is within the range")
            } else {
                if (root.value < 50) {
                    angleAbsolute = internal.startAngle
                    angle = internal.convertToAtan2Range(internal.startAngle)
                } else {
                    angleAbsolute = internal.endAngle
                    angle = internal.convertToAtan2Range(internal.endAngle)
                }
            }

            let newValue = Math.abs(internal.valueFactor * (internal.absoluteRadiansBetweenClockwise(internal.startAngle, angleAbsolute)))

            if (Math.abs(newValue - root.value) > 50) {
                return
            }

            var cosAngle = Math.cos(angle);
            var sinAngle = Math.sin(angle);
            var handleX = track.centerX + track.radius * cosAngle;
            var handleY = track.centerY + track.radius * sinAngle;


            console.log("Position change cos: " + cosAngle + " sin: " + sinAngle);
            console.log("Position change internal.startAngle: " + internal.startAngle + " internal.endAngle: " + internal.endAngle);
            console.log("Position change angle is: " + angle + " angleAbsolute is: " + angleAbsolute + " handleX: " + handleX + " handleY: " + handleY)

            handle.lastAngle = angle
            handle.x = handleX - handle.width / 2
            handle.y = handleY - handle.width / 2

            root.value = newValue

            console.log("Value is now: " + root.value)
        }
    }
}
