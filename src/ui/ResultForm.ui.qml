import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0

Item {
    id: item1
    property alias status: status
    property alias sendmore_button: sendmore_button
    property alias logout_button: logout_button
    property alias response_text: response_text

    GridLayout {
        id: gridLayout1
        columns: 2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15

        Text {
            id: status
            text: qsTr("Status")
            font.pointSize: 20
            font.family: "Verdana"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 2
        }

        Button {
            id: sendmore_button
            text: qsTr("Send More Evidence?")
        }

        Button {
            id: logout_button
            text: qsTr("Logout")
        }

        Flickable {
            id: flickable1
            Layout.columnSpan: 2
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentHeight: response_text.implicitHeight
            contentWidth: response_text.implicitWidth
            clip: true
            boundsBehavior: Flickable.StopAtBounds

            Rectangle {
                id: rectangle1
                color: "#e2e2e2"
                height: response_text.implicitHeight
                width: response_text.implicitWidth

                Text {
                    id: response_text
                    text: ""
                    font.pixelSize: 12
                }
            }
        }
    }
}
