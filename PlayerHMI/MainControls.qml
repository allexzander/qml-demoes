import QtQuick 2.15
import QtQuick.Layouts 1.15

RowLayout {
    id: root
    MediaControls {
        id: playerControls
        Layout.fillHeight: true
        Layout.preferredWidth: parent.width / 2
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }

    MediaScreen {
        id: mediaScreen
        Layout.fillHeight: true
        Layout.preferredWidth: height
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    }
}
