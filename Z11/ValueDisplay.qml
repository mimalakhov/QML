import QtQuick
import QtQuick.Controls

Item {
    property alias label: validLabel.text
    property var value
    property bool valid: value

    height: textField.height

    Row {
        anchors.fill: parent
        Label {
            id: validLabel
        }

        TextField {
            id: textField
            anchors.right: parent.right
            text: valid ? "%1".arg(value) : ""
            readOnly: true
            width: parent.width * 0.75
        }
    }
}
