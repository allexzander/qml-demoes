import QtQuick 2.15
import QtQuick.Layouts 1.15

RowLayout {
    id: root
    spacing: 20
    implicitWidth: childrenRect.width

    property int buttonSize: 24


    MediaExtraButton {
        iconSource: "qrc:/icons/player-button-repeat.png"
        Layout.preferredWidth: buttonSize
        Layout.preferredHeight: buttonSize
    }

    MediaExtraButton {
        iconSource: "qrc:/icons/player-button-shuffle.png"
        Layout.preferredWidth: buttonSize
        Layout.preferredHeight: buttonSize
    }

    MediaExtraButton {
        iconSource: "qrc:/icons/player-button-favorites.png"
        Layout.preferredWidth: buttonSize
        Layout.preferredHeight: buttonSize
    }

    MediaExtraButton {
        text: "1x"
        Layout.preferredWidth: buttonSize
    }

    Item {
        id: spacer
        Layout.fillWidth: true
    }
}
