import QtQuick 2.15

Rectangle {
    id: root
    implicitWidth: 50
    implicitHeight: 50

    property color gradientColorStart
    property color gradientColorStop
    property color borderColor
    property int borderWidth: 0
    property color color

    property Gradient bgGradient: Gradient {
        GradientStop { position: 0.0; color: root.gradientColorStart }
        GradientStop { position: 1.0; color: root.gradientColorStop }
    }

    border.width: root.borderWidth
    border.color: root.borderColor

    color: root.color

    //gradient: !!root.gradientColorStart && !!root.gradientColorStop ? bgGradient : null
}
