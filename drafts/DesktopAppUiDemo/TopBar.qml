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

    TextField {
        id: searchField
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: activeFocus ? 150 : 50
        Behavior on width {
            PropertyAnimation{}
        }
        rightPadding: 10
        leftPadding: 32

        background: Rectangle {
            color: "#ffffff"
            border.width: 0
            border.color: "transparent"
        }

        Image {
            id: searchLabel
            source: "qrc:/icons/icon-search-input.svg"
            sourceSize.width: 16
            sourceSize.height: 16
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
        }
        Rectangle {
            id: rightBorder
            anchors.left: parent.right
            width: 1
            height: parent.height
            color: "#dddddd"
        }
    }

    Item {
        id: accountMessages
        anchors.right: accountNotifications.left
        anchors.rightMargin: 30
        anchors.verticalCenter: parent.verticalCenter

        implicitWidth: icon.implicitWidth + numMessagesContainer.implicitWidth

        Image {
            id: icon
            source: "qrc:/icons/icon-envelope.svg"
            sourceSize.width: root.height * 0.5
            sourceSize.height: root.height * 0.5
            anchors.centerIn: parent

        }
        Rectangle {
            id: numMessagesContainer
            color: "#2293f4"
            readonly property int numMessagesLeftMargin: -3
            width: 14
            height: 14
            radius: width / 2
            anchors.left: icon.right
            anchors.leftMargin: numMessagesLeftMargin
            anchors.verticalCenter: icon.verticalCenter
            Text {
                id: numMessages
                text: "7"
                color: "#ffffff"
                font.pixelSize: 8
                anchors.centerIn: parent
            }
        }
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
