import QtQuick 2.15
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
    readonly property real valueMiddle: valueMax / 2

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

    readonly property bool displayDebugBorders: false

    readonly property int trackTopMargin: controlContainer.anchors.topMargin
    readonly property int trackBottomMargin: controlContainer.anchors.topMargin

    Utility {
        id: utils
    }

    QtObject {
        id: internal

        function convertMouseCoords(mouseCoords) {
            let mousePositionInControlContainer = controlContainer.mapFromItem(root, Qt.point(mouseCoords.x, mouseCoords.y))
            return mousePositionInControlContainer
        }
    }

    Rectangle {
        id: controlContainer
        anchors.top: root.top
        anchors.bottom: root.bottom
        anchors.horizontalCenter: root.horizontalCenter
        width: root.width
        anchors.topMargin: handle.height / 4
        anchors.bottomMargin: handle.height / 2
        color: "transparent"
        border.width: root.displayDebugBorders ? 1 : 0
        border.color: root.displayDebugBorders ? "green" : "transparent"

        TrackCanvas {
            id: track
            anchors.fill: parent

            readonly property real dragValueChangeMax: root.valueMiddle
            readonly property real valueMiddle: root.valueMax / 2

            trackGradientColorStart: root.trackGradientColorStart
            trackGradientColorStop: root.trackGradientColorStop

            initialAngle: startAngle + (root.value / valueFactor)

            startAngle: utils.toRadians(root.startAngleDegrees)
            endAngle: utils.toRadians(root.endAngleDegrees)

            CircularSliderHandle {
                id: handle

                radius: width / 2
                property real lastAngle: 0.0
                width: 20
                height: 20
                color: root.handleColor
                gradientColorStart: root.handleGradientColorStart
                gradientColorStop: root.handleGradientColorStop
                border.width: root.handleBorderWidth
                border.color: root.handleBorderColor

                Connections {
                    target: track
                    function onPaintFinished() {
                        console.log("Canvas paint finished!!!!!!!!")
                        let angleAbsolute = track.startAngle + (root.value / track.valueFactor)
                        let initialAngle = utils.convertToAtan2Range(angleAbsolute)
                        let initialAngleTransformed = initialAngle
                        handle.lastAngle = initialAngleTransformed;
                        console.log("initialAngleTransformed is: " + initialAngleTransformed)
                        let newPosition = utils.calculateItemPositionFromAngle(handle.lastAngle, track.centerX, track.centerY, track.radius, handle.width, handle.height)
                        handle.x = newPosition.x;
                        handle.y = newPosition.y;
                    }
                }
            }
        }
    }

    MouseArea {
        id: handleMouseArea
        anchors.fill: root
        property bool isDragging: false

        onPressed: {
            console.log("Pressed")
            let mousePositionInControlContainer = internal.convertMouseCoords(Qt.point(mouse.x, mouse.y))
            if (mousePositionInControlContainer.x >= handle.x && mousePositionInControlContainer.x <= handle.x + handle.width) {
                if (mousePositionInControlContainer.y >= handle.y && mousePositionInControlContainer.y <= handle.y + handle.height) {
                    isDragging = true
                    console.log("Start drag")
                }
            }
        }

        onReleased: {
            isDragging = false;
        }

        onPositionChanged: {
            if (!isDragging/* || !handleMouseArea.containsMouse*/) {
                return;
            }

            let startAngle = track.startAngle
            let endAngle = track.endAngle

            let mousePositionInControlContainer = internal.convertMouseCoords(Qt.point(mouse.x, mouse.y))
            var angle = Math.atan2(mousePositionInControlContainer.y - track.centerY, mousePositionInControlContainer.x - track.centerX);

            var angleAbsolute = angle < 0 ? (angle + 2*Math.PI) : angle;

            if (!utils.isAngleWithinTrack(angleAbsolute, startAngle, endAngle)) {
                if (root.value < root.valueMiddle) {
                    angleAbsolute = track.startAngle
                    angle = utils.convertToAtan2Range(track.startAngle)
                } else {
                    angleAbsolute = endAngle
                    angle = utils.convertToAtan2Range(endAngle)
                }
            }

            let newValue = Math.abs(track.valueFactor * (utils.angleDistance(track.startAngle, angleAbsolute)))

            if (Math.abs(newValue - root.value) > root.valueMiddle) {
                return
            }

            let newPosition = utils.calculateItemPositionFromAngle(angle, track.centerX, track.centerY, track.radius, handle.width, handle.height)
            handle.x = newPosition.x;
            handle.y = newPosition.y;
            handle.lastAngle = angle

            root.value = newValue
        }
    }
}
