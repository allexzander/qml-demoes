import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

RowLayout {
    id: root

    spacing: 10

    implicitWidth: childrenRect.width

    property string playButtonIcon: "qrc:/icons/player-button-play.png"
    property string pauseButtonIcon: "qrc:/icons/player-button-pause.png"
    property string startButtonIcon: "qrc:/icons/player-button-start.png"
    property string endButtonIcon: "qrc:/icons/player-button-end.png"

    MediaControlButton {
        iconSource: startButtonIcon
        Layout.preferredWidth: 60
        Layout.preferredHeight: root.height
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
    MediaControlButton {
        property bool isPlaying: false
        iconSource: pauseButtonIcon
        Layout.preferredWidth: 60
        Layout.preferredHeight: root.height
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        onClicked: {
            isPlaying ? iconSource = pauseButtonIcon : iconSource = playButtonIcon
            isPlaying = !isPlaying
        }
    }
    MediaControlButton {
        iconSource: endButtonIcon
        Layout.preferredWidth: 60
        Layout.preferredHeight: root.height
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
}
