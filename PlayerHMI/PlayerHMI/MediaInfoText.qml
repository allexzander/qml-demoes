import QtQuick 2.15

Item {
    id: root
    Text {
        id: mediaName
        text: "Panter"
        color: "white"
        font.pixelSize: 22
        font.bold: true
    }
    Text {
        id: mediaInfo
        anchors.top: mediaName.bottom
        text: "Eason"
        color: "white"
        font.pixelSize: 12
        font.bold: false
        opacity: 0.5
    }
    implicitHeight: mediaName.height + mediaInfo.height
}
