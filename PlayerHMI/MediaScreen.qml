import QtQuick 2.15

Rectangle {
    id: playerMediaScreen


    implicitWidth: 200
    implicitHeight: 200

    Image {
        source: "qrc:/icons/mieda-bg.jpg"
        anchors.fill: parent
        fillMode: Image.Stretch
    }
}
