import QtQuick 2.15
import QtQuick.Layouts 1.15

Grid {
    id: root
    columns: 4
    spacing: 10

    property alias model: repeater.model

    Repeater {
        id: repeater
        delegate: TilesViewDelegate {
            id: tilesDelegate
            property int spacingCorrectionForWidth: (index + 1) % columns === 0 ? 0 : root.spacing
            property int spacingCorrectionForHeight: root.spacing
            width: root.width / 4 - spacingCorrectionForWidth
            height: root.width / 4 - spacingCorrectionForHeight
        }
    }
}
