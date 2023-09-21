import QtQuick 2.0

Canvas {
    id: root
    property int trackWidth: 5
    property real radius: height / 2 - trackWidth

    readonly property real centerX: parent.width / 2
    readonly property real centerY: parent.height / 2 + parent.height / 4
    property real startAngle: 0
    property real endAngle: 2 * Math.PI
    property real initialAngle: startAngle

    property real valueFactor: 100 / utils.angleDistance(startAngle, endAngle)
    property string trackGradientColorStart
    property string trackGradientColorStop
    property string trackColor: "#000000"

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
        ctx.arc(root.centerX, track.centerY, root.radius, root.startAngle, root.endAngle, false);
        ctx.stroke();
        console.log("Drawing arc from root.startAngle: " + root.startAngle + " to root.endAngle: " + root.endAngle);
    }

    Component.onCompleted: {
        let initialAngle = utils.convertToAtan2Range(root.initialAngle)
        let initialAngleTransformed = initialAngle
        handle.lastAngle = initialAngleTransformed;
        console.log("initialAngleTransformed is: " + initialAngleTransformed)
        let newPosition = utils.calculateItemPositionFromAngle(handle.lastAngle, track.centerX, track.centerY, track.radius, handle.width, handle.height)
        handle.x = newPosition.x;
        handle.y = newPosition.y;
    }

    QtObject {
        id: internal
    }

    Utility {
        id: utils
    }
}
