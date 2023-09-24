import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    implicitHeight: 35
    Rectangle {
        id: background
        color: "#ffffff"
        anchors.fill: parent
    }

    SearchInput {
        id: searchField
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: activeFocus ? 150 : 50
    }

    AccountMessages {
        id: accountMessages
        source: "qrc:/icons/icon-envelope.svg"
        sourceSize.width: root.height * 0.5
        sourceSize.height: root.height * 0.5
        anchors.right: accountNotifications.left
        anchors.rightMargin: 30
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: accountNotifications
        source: "qrc:/icons/icon-bell.svg"
        sourceSize.width: parent.height * 0.5
        sourceSize.height: parent.height * 0.5
        anchors.right: accountAvatar.left
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
    }

    Image {
        id: accountAvatar
        source: accountsModel.get(accountsSelector.currentIndex).icon
        sourceSize.width: parent.height
        sourceSize.height: parent.height
        anchors.right: accountsSelector.left
    }

    ListModel {
        id: accountsModel
        ListElement {
            accountName: "Alrando Johm"
            icon: "qrc:/account-avatars/account-icon-man.svg"
        }
        ListElement {
            accountName: "Max Weismann"
            icon: "qrc:/account-avatars/account-icon-man-1.svg"
        }
        ListElement {
            accountName: "Samantha Adams"
            icon: "qrc:/account-avatars/account-icon-woman.svg"
        }
    }

    AccountsSelectorComboBox {
        id: accountsSelector
        model: accountsModel
        anchors.right: parent.right
        anchors.rightMargin: 20
        width: 120
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }
}
