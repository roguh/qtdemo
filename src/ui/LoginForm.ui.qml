import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.0

Item {
    id: item1
    width: 400
    height: 400
    property alias login_button: login_button

    Text {
        id: username_text
        y: 141
        width: 115
        height: 15
        text: "Username:"
        anchors.left: grid1.right
        anchors.leftMargin: -363
        font.pixelSize: 12
    }

    Text {
        id: password_text
        y: 170
        width: 60
        height: 14
        text: "Password:"
        anchors.left: grid1.right
        anchors.leftMargin: -363
        font.pixelSize: 12
    }

    Grid {
        id: grid1
        x: 104
        y: 80
        width: 400
        height: 400
    }

    TextField {
        id: username_field
        y: 141
        width: 200
        height: 21
        anchors.left: grid1.right
        anchors.leftMargin: -262
        placeholderText: "username"
    }

    TextField {
        id: password_field
        y: 170
        width: 200
        height: 22
        anchors.left: grid1.right
        anchors.leftMargin: -262
        placeholderText: "password"
        echoMode: TextInput.Password
    }

    TextField {
        id: server_field
        y: 273
        width: 200
        height: 20
        anchors.left: grid1.right
        anchors.leftMargin: -262
        placeholderText: "IP"
    }

    Text {
        id: text1
        y: 279
        text: qsTr("Server address:")
        anchors.left: grid1.right
        anchors.leftMargin: -376
        font.pixelSize: 12
    }

    Button {
        id: login_button
        y: 326
        text: qsTr("Login")
        anchors.left: password_text.right
        anchors.leftMargin: 182
    }
}
