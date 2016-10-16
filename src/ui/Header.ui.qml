import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

Item {
    id: item1

    property alias header_rectangle: header_rectangle

    Rectangle {
        id: header_rectangle
        height: 55
        color: "#0000ff"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.left: parent.left
        anchors.rightMargin: 0
    }
}
