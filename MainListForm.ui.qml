import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

Item {
    id: item1
    property alias button1: button1
    property alias button2: button2
    property alias button3: button3
    property alias button4: button4
    property alias listview: listview
    property alias rectangle1: rectangle1

    ColumnLayout {
        id: columnLayout1
        x: 20
        y: 65
        height: 330
        transformOrigin: Item.Top
        anchors.bottomMargin: 48
        anchors.topMargin: 48
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.fill: parent
        spacing: 25

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.maximumWidth: 400
            spacing: 1

            Button {
                id: button1
                text: "To Blank Screen"
                Layout.fillWidth: true
            }

            Button {
                id: button2
                text: qsTr("Push and Raise Error")
                Layout.fillWidth: true
            }

            Button {
                id: button3
                text: qsTr("Create Notification")
                Layout.fillWidth: true
            }

            Button {
                id: button4
                width: 400
                height: 40
                text: qsTr("Sensors")
                Layout.fillWidth: true
            }
        }

        Rectangle {
            id: rectangle1
            x: 125
            y: 200
            width: 200
            height: 184
            color: "#c9ddfb"
            transformOrigin: Item.Bottom
            Layout.minimumWidth: 350
            Layout.fillHeight: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

            ListView {
                clip: true

                id: listview
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                anchors.topMargin: 24
                anchors.fill: parent
                spacing: 10
                snapMode: ListView.SnapToItem
                boundsBehavior: Flickable.DragOverBounds
                antialiasing: false
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                keyNavigationWraps: true

                delegate: Item {
                    width: 80
                    height: 40
                    Row {
                        id: row1
                        spacing: 10

                        Text {
                            text: name
                            font.pointSize: 14
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            text: location
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: 14
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
                focus: true


                //Keys.onUpPressed: scrollBar.decrease()
                //Keys.onDownPressed: scrollBar.increase()
                ScrollBar {
                    id: scrollBar
                    wheelEnabled: true
                    active: true
                }
            }
        }

    }
}
