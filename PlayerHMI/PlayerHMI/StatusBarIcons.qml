import QtQuick 2.15
import QtQuick.Layouts 1.15

RowLayout {
    id: root

    Repeater {
        model: [
            "qrc:/icons/info-icons/info-mute.png",
            "qrc:/icons/info-icons/info-charge.png",
            "qrc:/icons/info-icons/info-mail.png",
            "qrc:/icons/info-icons/info-bluetooth.png",
            "qrc:/icons/info-icons/info-gps.png",
            "qrc:/icons/info-icons/info-signal.png"
        ]
        delegate: Image {
            source: model.modelData
            sourceSize.width: 12
            sourceSize.height: 12

            Layout.preferredWidth: sourceSize.width
            Layout.preferredHeight: sourceSize.height
        }
    }
}
