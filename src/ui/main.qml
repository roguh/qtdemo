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
    width: 640
    height: 480
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

    StackView {
        id: stackview
        anchors.fill: parent
        initialItem: page1

        Component {
            id: page1

            MainListForm {
                button1.onClicked: {
                    notificationClient.notification = "Starting download"
                    classReader.startDownload()
                }
                button2.onClicked: {
                    stackview.push(page1)
                }
                button3.onClicked: {
                    if (footer.footer_text !== "Sample error") {
                        footer.state = "error"
                        footer.footer_text.text = "Sample error"
                    }
                }
                button4.onClicked: {
                    stackview.push(sensors)
                }
                button5.onClicked: {
                    footer.state = ""
                    footer.footer_text.text = ""
                }
                Connections {
                    target: classReader
                    onClassesChanged: {
                        console.log('classes parsed:', classReader.classesAsVariant())
                        listview.model = classReader.classesAsVariant()
                    }
                }
            }
        }

        Component {
            id: sensors

            SensorsForm {

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
        footer_text.text: "All is quiet on the western front."
        state: ""

        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
    }
}
