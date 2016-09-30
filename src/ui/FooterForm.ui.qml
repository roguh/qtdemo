import QtQuick 2.4
import QtQuick.Controls.Material 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Item {
    id: item1

    property alias footer_text: footer_text
    property alias footer_rect: footer_rect

    Rectangle {
        id: footer_rect
        y: 481
        height: 47
        color: "#022379"
        anchors.bottomMargin: -10000
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left


        Text {
            id: footer_text
            x: 180
            y: 40
            color: "#ffffff"
            text: qsTr("Text")
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 14
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
    states: [
        State {
            name: "error"

            PropertyChanges {
                target: footer_rect
                color: "#ff0000"
                anchors.bottomMargin: 0
            }
        },
        State {
            name: "notification"

            PropertyChanges {
                target: footer_rect
                color: "#0000ff"
                anchors.bottomMargin: 0
            }
        }
    ]
}
