import QtQuick 2.4


LoginForm {
    id: login_form
    property alias login_button: login_form.login_button

    username_field.onTextChanged:
        login_button.enabled = username_field.text.length > 0 && password_field.text.length > 0 && server_field.text.length > 0;

    password_field.onTextChanged:
        login_button.enabled = username_field.text.length > 0 && password_field.text.length > 0 && server_field.text.length > 0;

    server_field.onTextChanged:
        login_button.enabled = username_field.text.length > 0 && password_field.text.length > 0 && server_field.text.length > 0;
}
