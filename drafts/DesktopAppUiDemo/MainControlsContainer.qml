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
        onFilterIndexChanged: function(index) {
            switch(index) {
            case 0:
                tilesView.model = gridModel
                break
            case 1:
                tilesView.model = gridModelNew
                break
            case 2:
                tilesView.model = gridModelFeatured
                break
            case 3:
                tilesView.model = gridModelPopular
                break
            }
        }
    }

    ListModel {
        id: gridModelNew
        ListElement {
            providerName: "SalesForce"
            icon: "qrc:/icons/grid-icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Freshbooks"
            icon: "qrc:/icons/grid-icons/freshbooks-logo.svg"
        }
        ListElement {
            providerName: "Zoho"
            icon: "qrc:/icons/grid-icons/zoho-logo.svg"
        }
        ListElement {
            providerName: "Highrise"
            icon: "qrc:/icons/grid-icons/highrise-logo.png"
        }
    }

    ListModel {
        id: gridModelFeatured
        ListElement {
            providerName: "Highrise"
            icon: "qrc:/icons/grid-icons/highrise-logo.png"
        }
        ListElement {
            providerName: "RelateIQ"
            icon: "qrc:/icons/grid-icons/relateiq-logo.svg"
        }
        ListElement {
            providerName: "Teamgate"
            icon: "qrc:/icons/grid-icons/teamgate-logo.svg"
        }
        ListElement {
            providerName: "Invoice Sherpa"
            icon: "qrc:/icons/grid-icons/invoicesherpa-logo.png"
        }
        ListElement {
            providerName: "Xero"
            icon: "qrc:/icons/grid-icons/xero-logo.svg"
        }
    }

    ListModel {
        id: gridModelPopular
        ListElement {
            providerName: "SalesForce"
            icon: "qrc:/icons/grid-icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Zoho"
            icon: "qrc:/icons/grid-icons/zoho-logo.svg"
        }
        ListElement {
            providerName: "Xero"
            icon: "qrc:/icons/grid-icons/xero-logo.svg"
        }
    }

    ListModel {
        id: gridModel
        ListElement {
            providerName: "SalesForce"
            icon: "qrc:/icons/grid-icons/salesforce-logo.svg"
        }
        ListElement {
            providerName: "Freshbooks"
            icon: "qrc:/icons/grid-icons/freshbooks-logo.svg"
        }
        ListElement {
            providerName: "Zoho"
            icon: "qrc:/icons/grid-icons/zoho-logo.svg"
        }
        ListElement {
            providerName: "Highrise"
            icon: "qrc:/icons/grid-icons/highrise-logo.png"
        }
        ListElement {
            providerName: "RelateIQ"
            icon: "qrc:/icons/grid-icons/relateiq-logo.svg"
        }
        ListElement {
            providerName: "Teamgate"
            icon: "qrc:/icons/grid-icons/teamgate-logo.svg"
        }
        ListElement {
            providerName: "Invoice Sherpa"
            icon: "qrc:/icons/grid-icons/invoicesherpa-logo.png"
        }
        ListElement {
            providerName: "Xero"
            icon: "qrc:/icons/grid-icons/xero-logo.svg"
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
