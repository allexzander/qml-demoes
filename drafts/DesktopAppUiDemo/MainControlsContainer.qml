import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    id: mainControlsContainer

    FiltersControl {
        id: filtersControl
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    ListModel {
        id: gridModel
        ListElement {
            providerName: "SalesForce"
            icon: "qrc:/icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Freshbooks"
            icon: "pics/portrait.png"
        }
        ListElement {
            providerName: "Zoho"
            icon: "pics/portrait.png"
        }
        ListElement {
            providerName: "Highrise"
            icon: "pics/portrait.png"
        }
        ListElement {
            providerName: "RelateIQ"
            icon: "pics/portrait.png"
        }
        ListElement {
            providerName: "Teamgate"
            icon: "pics/portrait.png"
        }
        ListElement {
            providerName: "Invoice Sherpa"
            icon: "pics/portrait.png"
        }
        ListElement {
            providerName: "Xero"
            icon: "pics/portrait.png"
        }
    }

    Flickable {
        id: scroller
        anchors.top: filtersControl.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        contentHeight: tilesView.height
        contentWidth: tilesView.width
        clip : true

        TilesView {
            id: tilesView

            columnSpacing: 15
            rowSpacing: 15

            width: mainControlsContainer.width
            height: 300
            model: gridModel
        }
    }
}
