// This worker returns a failing status code.

WorkerScript.onMessage = function (message) {
    WorkerScript.sendMessage({
                                 status: 999,
                                 status_text: "Test failure",
                                 doc: null,
                                 doc_text: ""
                             })
}
