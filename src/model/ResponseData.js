// This object stores responses from a request sender.
var response = {
    status: "",
    status_text: "",
    doc: "",
    doc_text: ""
}

function copy_response(source, target) {
    target.status = source.status
    target.status_text = source.status_text
    target.doc = source.doc
    target.doc_text = source.doc_text
}

function is_successful(r) {
    return r.status === 200
}

function to_string(r) {
    return r.status_text + "(" + r.status + ")"
}
