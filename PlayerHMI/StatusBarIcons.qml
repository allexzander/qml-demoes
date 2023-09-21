import QtQuick 2.15
import QtQuick.Layouts 1.15

RowLayout {
    id: root

    Repeater {
        model: [
            "qrc:/icons/info-icons/info-mute.svg",
            "qrc:/icons/info-icons/info-charge.svg",
            "qrc:/icons/info-icons/info-mail.svg",
            "qrc:/icons/info-icons/info-bluetooth.svg",
            "qrc:/icons/info-icons/info-gps.svg",
            "qrc:/icons/info-icons/info-signal.svg"
        ]
        delegate: Image {
            source: model.modelData
            sourceSize.width: 16
            sourceSize.height: 16

            Layout.preferredWidth: sourceSize.width
            Layout.preferredHeight: sourceSize.height
        }
    }
}
