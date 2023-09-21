import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root

    color: "transparent"

    border.width: root.displayDebugBorders ? 1 : 0
    border.color: root.displayDebugBorders ? "red" : "transparent"

    /* clockwise degrees count */
    property int startAngleDegrees: 180
    property int endAngleDegrees: 20

    property real value: 40
    property real velueMin: 0
    property real valueMax: 100

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

    readonly property bool displayDebugBorders: true

    QtObject {
        id: internal
        function toRadians(angle) {
            return angle * (Math.PI/180)
        }

        function convertToAtan2Range(angle) {
            if (angle >= 0 && angle < Math.PI) {
                return angle;
            } else {
                return angle - 2 * Math.PI;
            }
        }

        function isWithinRange(angle, startAngle, endAngle) {
            if (startAngle <= endAngle) {
                return angle >= startAngle && angle <= endAngle;
            } else {
                return angle >= startAngle || angle <= endAngle;
            }
        }

        function angleDistance(startAngle, endAngle) {
            var distance = endAngle - startAngle;
            if (distance < 0) {
                distance += 2 * Math.PI;
            }
            return distance;
        }

        function calculateItemPositionFromAngle(angle, trackCenterX, trackCenterY, trackRadius, itemWidth, itemHeight) {
            let newX = trackCenterX + trackRadius * Math.cos(angle) - itemWidth / 2;
            let newY = trackCenterY + trackRadius * Math.sin(angle) - itemHeight / 2;
            return Qt.point(newX, newY);
        }

        readonly property real valueMiddle: valueMax / 2

        property real startAngle: toRadians(root.startAngleDegrees)
        property real endAngle: toRadians(root.endAngleDegrees)

        property real valueFactor: 100 / angleDistance(startAngle, endAngle)
    }

    Rectangle {
        id: controlContainer
        anchors.top: root.top
        anchors.bottom: root.bottom
        anchors.horizontalCenter: root.horizontalCenter
        width: height
        color: "transparent"
        border.width: root.displayDebugBorders ? 1 : 0
        border.color: root.displayDebugBorders ? "green" : "transparent"


        // Add a Canvas for drawing the arc
        Canvas {
            id: track
            anchors.fill: parent
            property real radius: height / 2 - root.trackWidth
            readonly property real dragValueChangeMax: internal.valueMiddle
            readonly property real centerX: parent.width / 2
            readonly property real centerY: parent.height / 2 + parent.height / 4

            readonly property real mouseXTranslation: -(root.width / 2 - controlContainer.width / 2)

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
                ctx.arc(track.centerX, track.centerY, track.radius, internal.startAngle, internal.endAngle, false);
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
                let newPosition = internal.calculateItemPositionFromAngle(handle.lastAngle, track.centerX, track.centerY, track.radius, handle.width, handle.height)
                handle.x = newPosition.x;
                handle.y = newPosition.y;
            }
        }
    }
    MouseArea {
        id: handleMouseArea
        anchors.fill: root
        property bool isDragging: false

        onPressed: {
            var mouseXTranslated = mouse.x + track.mouseXTranslation
            var mouseYTranslated = mouse.y
            console.log("Mouse pressed at parentx: " + parent.x + " mouseYTranslated: " + mouseYTranslated + " And handle.x is at: " + handle.x + " handle.y is at: " + handle.y)


            if (mouseXTranslated >= handle.x && mouseXTranslated <= handle.x + handle.width) {
                console.log("Dragging START!!!!!!!!!!")
                if (mouseYTranslated >= handle.y && mouseYTranslated <= handle.y + handle.height) {
                    isDragging = true
                }
            }
        }

        onReleased: {
            isDragging = false;
        }

        onPositionChanged: {

            if (!isDragging || !handleMouseArea.containsMouse) {
                return;
            }
console.log("Dragging!!!!!!!!!!")
            var angle = Math.atan2(mouse.y - track.centerY, mouse.x + track.mouseXTranslation - track.centerX);



            let startAngle = internal.startAngle
            let endAngle = internal.endAngle

            var angleAbsolute = angle < 0 ? (angle + 2*Math.PI) : angle;

            if (!internal.isWithinRange(angleAbsolute, startAngle, endAngle)) {
                if (root.value < internal.valueMiddle) {
                    angleAbsolute = internal.startAngle
                    angle = internal.convertToAtan2Range(internal.startAngle)
                } else {
                    angleAbsolute = endAngle
                    angle = internal.convertToAtan2Range(endAngle)
                }
            }

            let newValue = Math.abs(internal.valueFactor * (internal.angleDistance(internal.startAngle, angleAbsolute)))

            if (Math.abs(newValue - root.value) > internal.valueMiddle) {
                return
            }

            let newPosition = internal.calculateItemPositionFromAngle(angle, track.centerX, track.centerY, track.radius, handle.width, handle.height)
            handle.x = newPosition.x;
            handle.y = newPosition.y;
            handle.lastAngle = angle

            root.value = newValue
        }
    }
}
