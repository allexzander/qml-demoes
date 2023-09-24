import QtQuick 2.15

Item {
    id: root

    property int currentPage: 0
    property int totalPages: 3

    property alias model: dotsRepeater.model

    implicitHeight: 30

    property int currentIndex: 0

    Row {
        anchors.centerIn: parent
        spacing: 2
        Repeater {
            id: dotsRepeater
            model: totalPages


            delegate: Item {
                width: height
                height: root.height * 0.25
                opacity: model.index === root.currentIndex ? 1.0 : 0.5
                Rectangle {
                    anchors.fill: parent
                    color: "#ffffff"

                    radius: width / 2
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.currentIndex = model.index
                    }
                }
            }
        }
    }
}
