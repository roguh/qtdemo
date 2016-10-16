// This worker always returns a successful status code.

WorkerScript.onMessage = function (message) {
    WorkerScript.sendMessage({
                                 status: 200,
                                 status_text: "OK",
                                 doc: null,
                                 doc_text: ""
                             })
}
