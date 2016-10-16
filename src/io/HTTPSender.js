// This worker is responsible for sending data to the server.

WorkerScript.onMessage = function (message) {
    var method = message.method
    var url = message.login_data.url
    var auth = message.login_data.auth
    var body = message.body
    var request = new XMLHttpRequest()

    // Set URL
    // 'false' makes request.send() block
    request.open(method, url, false)

    // Set authorization
    request.setRequestHeader("Authorization", "Basic " + auth)

    if (method === "POST") {
        request.setRequestHeader("Content-type", "application/xml")
        request.setRequestHeader("Content-length", body.length)
    }

    // Send data and wait until a response arrives
    request.send(body)

    var doc = null

    // Check the status
    if (request.status === 200 && request.responseXML) {
        // Read the response document.
        doc = request.responseXML.documentElement
    }

    // Return the status and any document from the response.
    // This is like a return statement, but it sends the onMessage signal to QML.
    WorkerScript.sendMessage({
                                 status: request.status,
                                 status_text: request.statusText,
                                 doc: doc,
                                 doc_text: request.responseText
                             })
}
