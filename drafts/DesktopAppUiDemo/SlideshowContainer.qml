import QtQuick 2.15

Item {
    id: root
    anchors.top: topBar.bottom
    implicitHeight: 150
    property alias model: slideshowList.model
    property alias currentIndex: slideshowList.currentIndex
    function incrementCurrentIndex() { slideshowList.incrementCurrentIndex() }
    function decrementCurrentIndex() { slideshowList.decrementCurrentIndex() }
    function positionViewAtBeginning() { slideshowList.positionViewAtBeginning() }
    ListView {
        id: slideshowList

        clip: true

        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        highlightRangeMode: ListView.StrictlyEnforceRange

        maximumFlickVelocity: 700

        anchors.fill: parent

        delegate: Item {
            width: slideshowList.width
            height: slideshowList.height
            Rectangle {
                anchors.fill: parent
                color: "#f3f2f5"
            }

            Item {
                id: leftPart

                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 10
                anchors.bottomMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 40
                width: parent.width / 2

                Text {
                    id: header
                    color: "#62606e"
                    anchors.top: parent.top
                    font.pixelSize: 32
                    text: model.header
                }

                Text {
                    id: subHeader
                    anchors.top: header.bottom
                    color: "#62606e"
                    font.pixelSize: 8
                    text: model.subHeader
                    width: 250
                    wrapMode: Text.WordWrap
                }

                SlideshowDelegateButton {
                    id: actionButton
                    anchors.top: subHeader.bottom
                    anchors.topMargin: 10
                    font.pixelSize: 8
                    color: "#ffffff"
                    text: model.buttonLabel
                }

                Text {
                    id: subtitle
                    anchors.top: actionButton.bottom
                    anchors.topMargin: 10
                    color: "#79afe8"
                    font.pixelSize: 8
                    text: model.subtitle
                    width: actionButton.width
                    wrapMode: Text.WordWrap
                }
            }

            Item {
                id: rightPart
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.right: parent.right
                anchors.leftMargin: 5
                width: parent.width / 2 - 20

                Image {
                    id: icon
                    source: model.icon
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}
