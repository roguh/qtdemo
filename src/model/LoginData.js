// This object stores the login data.
var login_data = {
    auth: "",
    url: ""
}

function encode_auth(username, password) {
    return Qt.btoa(username + ":" + password)
}
