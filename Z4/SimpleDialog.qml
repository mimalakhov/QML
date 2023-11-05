import QtQuick
import QtQuick.Controls

Dialog {
    title: "Dialog"
    standardButtons: Dialog.Ok | Dialog.Cancel
    height: 200
    width: 200

    property alias a: first.text
    property alias b: second.text

    Column {
        height: 100
        width: 100
        TextField {
            id: first
            width: parent.width
            height: 50
            placeholderText: qsTr("Введите число")
            validator: RegularExpressionValidator { regularExpression: /[1-9][0-9]*/ }
            text: ""
        }

        TextField {
            id: second
            height: 50
            width: parent.width
            placeholderText: qsTr("Введите число")
            validator: RegularExpressionValidator { regularExpression: /[1-9][0-9]*/ }
            text: ""
        }
    }
}
