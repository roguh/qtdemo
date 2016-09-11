import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtPositioning 5.7
import QtQuick.Controls.Universal 2.0

Item {
    x: 5
    width: 80
    height: 40
    Row {
        id: row1
        layoutDirection: Qt.LeftToRight
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        spacing: 10

        Text {
            text: name
            font.pointSize: 11
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
        }
        Text {
            text: location
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 11
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    MouseArea {
        id: listitem_mousearea
        height: 100
        anchors.fill: parent
    }
}
