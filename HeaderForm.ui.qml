import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

Item {
    id: item1

    property alias back_button: back_button

    Rectangle {
        id: rectangle1
        height: 55
        color: "#022379"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.left: parent.left
        anchors.rightMargin: 0

        Image {
            id: back_image
            y: 3
            width: 68
            height: 25
            scale: 1
            antialiasing: true
            clip: false
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "assets/arrow.png"

            MouseArea {
                id: back_button
                scale: 1
                antialiasing: true
                enabled: true
                smooth: true
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.topMargin: 0
            }
        }
    }
}
