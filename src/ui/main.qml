// bug: clicking button 3 breaks footer text
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import QtPositioning 5.7
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

// notificationClient and classReader should be defined in main.cpp
import NMT.CREU2016.NotificationClient 1.0
import NMT.CREU2016.ClassReaders 1.0

ApplicationWindow {
    visible: true
    title: qsTr("Qt Demo")
    id: main

    NotificationClient {
        id: notificationClient
        onNotificationChanged: {
            footer.state = "notification"
            footer.footer_text.text = notification
        }
    }

    ClassReader {
        id: classReader
        onParsingError: {
            console.log(errorMessage) // TODO log to a debug log file
            notificationClient.notification = 'XML Parsing error: ' + errorMessage
        }
        onNetworkError: {
            console.log(errorMessage)
            notificationClient.notification = 'Network error: ' + errorMessage
        }
    }

    ColumnLayout {
        anchors.fill: parent
        Header {
            id: header
            anchors.fill: parent
            back_button.onClicked: stackview.pop()
        }

        StackView {
            id: stackview
            initialItem: evidence
            anchors.fill: parent
            anchors.top: parent.top
            anchors.topMargin: header.header_rectangle.height + 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5

            // for navigation using the back key
            focus: true
            Keys.onBackPressed: stackview.pop()

            Component {
                id: login
                Login {
                    login_button.onPressed:
                        stackview.push(evidence)
                }
            }

            Component {
                id: evidence
                EvidenceForm {
                    send_button.onPressed:
                        stackview.push(result)
                }
            }

            Component {
                id: result
                Result {
                }
            }
        }
    }

    footer: Footer {
        footer_text.text: "All is quiet on the western front."
        state: ""

        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }
}
