import QtQuick 2.4

FooterForm {
    transitions: [
        Transition {
            from: "*"
            to: "*"
            ColorAnimation {
                target: footer_rect
                duration: 500
            }
        }
    ]
}
