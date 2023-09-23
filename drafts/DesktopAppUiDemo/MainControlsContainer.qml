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
            icon: "qrc:/icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Zoho"
            icon: "qrc:/icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Highrise"
            icon: "qrc:/icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "RelateIQ"
            icon: "qrc:/icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Teamgate"
            icon: "qrc:/icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Invoice Sherpa"
            icon: "qrc:/icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Xero"
            icon: "qrc:/icons/salesforce-logo.svg"
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
