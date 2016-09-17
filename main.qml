import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import QtPositioning 5.7
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt Demo")
    id: main

    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: page1

        Component {
            id: page1

            MainListForm {
                button1.onClicked: {
                    stackview.push(page2)
                    footer.footer_text.text = "CLICK 1!"
                    footer.state = ""
                }
                button2.onClicked: {
                    stackview.push(page1)
                    footer.footer_text.text = "CLICK 2!"
                    footer.state = "error"
                }
                button3.onClicked: {
                    footer.footer_text.text = "item added"
                    footer.state = "warning"
                }
                button4.onClicked: {
                    stackview.push(sensors)
                }

                listview.model: listmodel // defined in main.cpp
            }
        }

        Component {
            id: page2
            Page2Form {
            }
        }

        Component {
            id: sensors

            SensorsForm{

            }
        }

        // for navigation using the back key
        focus: true
        Keys.onBackPressed: stackview.pop()
    }
    header: Header {
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0

        back_button.onClicked: stackview.pop()
    }

    footer: Footer {
        id: footer

        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }
}
