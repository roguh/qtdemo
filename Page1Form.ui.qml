import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

Item {
    id: item1
    property alias button1: button1
    property alias button2: button2
    property alias button3: button3
    property alias listview: listview

    RowLayout {
        anchors.top: parent.top
        anchors.topMargin: 32
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -188
        anchors.horizontalCenterOffset: 0

        Button {
            id: button1
            text: "To Blank Screen"
        }

        Button {
            id: button2
            text: qsTr("Push and Raise Error")
        }

        Button {
            id: button3
            text: qsTr("Create Warning")
        }
    }

    ListView {
        id: listview
        x: 265
        y: 107
        width: 110
        height: 267
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        keyNavigationWraps: true

        delegate: ListItem { }
    }
}
