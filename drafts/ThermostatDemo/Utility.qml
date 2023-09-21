import QtQuick 2.15

QtObject {
    function toRadians(angle) {
        return angle * (Math.PI/180)
    }

    function convertToAtan2Range(angle) {
        return angle >= 0 && angle < Math.PI ? angle : angle - 2 * Math.PI
    }

    function convertFromAtan2Range(angle) {
        return angle < 0 ? (angle + 2*Math.PI) : angle
    }

    function isAngleWithinTrack(angle, startAngle, endAngle) {
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
