import QtQuick 2.4


LoginForm {
    id: login_form
    property alias login_button: login_form.login_button
    property alias username: login_form.username_field
    property alias password: login_form.password_field
    property alias server:   login_form.server_field

    function reset_fields() {
        username_field.text = ""
        password_field.text = ""
    }

    function validate_input() {
       return username_field.text.length > 0 && password_field.text.length > 0 && server_field.text.length > 0
    }

    username_field.onTextChanged:
        login_button.enabled = validate_input()

    password_field.onTextChanged:
        login_button.enabled = validate_input()

    server_field.onTextChanged:
        login_button.enabled = validate_input()
}
