import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    property alias text: temperatureDisplay.text
    property int degreeSymbolMargins: 15
    implicitWidth: temperatureDisplay.width + valueDegreeSymbol.width
    implicitHeight: temperatureDisplay.height + valueDegreeSymbol.height
    Text {
        id: temperatureDisplay
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 58
        color: "#ffffff"
        renderType: Text.PlainText
        height: 30
        verticalAlignment: Qt.AlignVCenter
    }

    Text {
        id: valueDegreeSymbol
        anchors.bottom: temperatureDisplay.top
        anchors.left: temperatureDisplay.right
        anchors.rightMargin: root.degreeSymbolMargins
        anchors.bottomMargin: root.degreeSymbolMargins
        font.pixelSize: 58
        color: "#ffffff"
        text: "°"
        height: 20
    }
}
