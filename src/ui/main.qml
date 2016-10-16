import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

import QtQuick.Dialogs 1.1

import QtPositioning 5.7
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

// These are defined in main.cpp.
import NMT.CREU2016.NotificationClient 1.0
import NMT.CREU2016.ClassReaders 1.0

// These JavaScript files store and transform data.
import "qrc:/model/LoginData.js" as LoginData
import "qrc:/model/ResponseData.js" as ResponseData

ApplicationWindow {
    visible: true
    title: qsTr("Qt Demo")
    height: 550
    width: 450
    id: main

    // Print an error messages to the console and display them in a message dialog.
    function reportError(title, text) {
        messageDialog.title = title
        if (title.length > 0) {
            messageDialog.text = title + ": "
        }
        messageDialog.text += text
        messageDialog.open()
        console.log(title + ": " + text)
    }

    MessageDialog {
        id: messageDialog
        onAccepted: close()
    }

    // Create an XML parser for the class list.
    ClassReader {
        id: classReader
        onParsingError: reportError("XML Parsing Error", errorMessage)
    }

    ColumnLayout {
        anchors.fill: parent
        Header {
            id: header
            anchors.fill: parent
            // back_button.onClicked: stackview.pop()
        }
        StackView {
            id: stackview
            initialItem: login
            anchors.fill: parent

            // Keep header and content separate.
            anchors.top: parent.top
            anchors.topMargin: header.header_rectangle.height + 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5

            // This allows for navigation using the back key.
            // Keys.onBackPressed: stackview.pop()
            focus: true

            Component {
                id: login
                Login {
                    id: login_screen

                    // For ease of testing.
                    server_field.text: "http://localhost:8080"
                    username_field.text: "u"
                    password_field.text: "p"

                    // Create a JavaScript worker for sending requests
                    RequestSenderInterface {
                        id: request_sender
                        // If authentication succeeds, go to the next screen.
                        // Otherwise, show an error message.
                        onMessage: {
                            if (ResponseData.is_successful(messageObject)) {
                                stackview.push(evidence)
                            } else {
                                login_screen.reset_fields()
                                reportError("Unable to login",
                                            ResponseData.to_string(
                                                messageObject))
                            }
                        }
                    }

                    login_button.onPressed: {
                        // Save username and password.
                        LoginData.login_data.url = server_field.text
                        LoginData.login_data.auth = LoginData.encode_auth(
                                    username_field.text, password_field.text)

                        // Send a request to verify credentials.
                        request_sender.sendMessage({
                                                       login_data: LoginData.login_data,
                                                       method: "GET",
                                                       body: null
                                                   })
                    }
                }
            }

            Component {
                id: evidence
                EvidenceForm {
                    id: evidence_form
                    // Create a JavaScript worker for sending requests
                    RequestSenderInterface {
                        id: request_sender
                        // Go to the results screen after receiving a response.
                        onMessage: {
                            // Save the response object.
                            ResponseData.copy_response(messageObject,
                                                       ResponseData.response)
                            stackview.push(result)
                        }
                    }

                    send_button.onPressed: {
                        // Send a POST request with the key.
                        request_sender.sendMessage({
                                                       login_data: LoginData.login_data,
                                                       method: "POST",
                                                       body: evidence_form.key_field.text
                                                   })
                    }
                }
            }

            Component {
                id: result
                ResultForm {
                    // Set the status text based on the response status code.
                    function startupFunction() {
                        if (ResponseData.is_successful(ResponseData.response)) {
                            status.text = "Success!"
                        } else {
                            status.text = "Failure. " + ResponseData.to_string(
                                        ResponseData.response)
                        }
                    }
                    Component.onCompleted: startupFunction()

                    // Either go back to the login screen or to the evidence sending screen.
                    sendmore_button.onPressed: stackview.pop()
                    logout_button.onPressed: {
                        stackview.pop()
                        stackview.pop()
                    }
                }
            }
        }
    }
}
