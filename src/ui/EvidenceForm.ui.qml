import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1
    clip: true
    property alias send_button: send_button
    property alias key_field: key_field

    GridLayout {
        id: grid_layout
        width: 400
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
        columns: 2

        Text {
            id: text1
            text: qsTr("Enter key:")
            font.pointSize: 14
        }

        Frame {
            id: frame1
            Layout.fillWidth: true

            TextField {
                id: key_field
                text: qsTr("")
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                font.bold: false
                font.pointSize: 12
            }
        }

        Button {
            id: qr_button
            text: qsTr("QR Code")
        }

        Item {
            id: item2
            Layout.minimumHeight: 64
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.columnSpan: 2

            Button {
                id: send_button
                text: qsTr("Send Evidence")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
