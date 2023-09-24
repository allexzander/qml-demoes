import QtQuick 2.15
import QtQuick.Layouts 1.15

GridLayout {
    id: root
    columns: 4


    property alias model: repeater.model

    Repeater {
        id: repeater
        delegate: TilesViewDelegate {
            id: tilesDelegate
            Layout.preferredWidth: root.width / 4 - root.columnSpacing
            Layout.preferredHeight: root.width / 4 - root.rowSpacing
            Layout.fillWidth: true
        }
    }
}
