import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Templates 2.0

Item {
    id: item2
    width: 400
    height: 400

    GridLayout {
        id: gridLayout1
        width: 100
        height: 100
        columns: 3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: text1
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: text2
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: text3
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: text4
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: text5
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: text6
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: text7
            text: qsTr("Text")
            font.pixelSize: 12
        }

        Text {
            id: text8
            text: qsTr("Text")
            font.pixelSize: 12
        }

    }

    Label {
        id: label1
        text: qsTr("Label")
    }

}
