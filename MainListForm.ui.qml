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
    property alias listview: listview

    ColumnLayout {
        id: columnLayout1
        anchors.bottomMargin: 64
        anchors.topMargin: 64
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
        }

        Rectangle {
            id: rectangle1
            width: 200
            height: 200
            color: "#c9ddfb"
            Layout.minimumWidth: 350
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom

            ListView {
                clip: true

                id: listview
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                anchors.topMargin: 20
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
