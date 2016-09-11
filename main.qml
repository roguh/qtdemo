import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt Demo")

    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: page1

        Component {
            id: page1

            Page1Form {
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
                   listview.model.add({name: "BLUE", location:"HERE"})
               }

               listview.model:  ListModel {
                   ListElement {
                       name: "Grey"
                       location: "Cramer 9001"
                   }

                   ListElement {
                       name: "Red"
                       location: "Cramer 42"
                   }

                   ListElement {
                       name: "Blue"
                       location: "Cramer 1945"
                   }

                   ListElement {
                       name: "Green"
                       location: "Cramer U239"
                   }
               }
            }
        }

        Component {
            id: page2
            Page2Form {
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
