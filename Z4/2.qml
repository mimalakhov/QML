import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ButtonGroup { id: radioButtonsGroup }
    ColumnLayout {
        spacing: 20
        RadioButton {
            text: "first"
            ButtonGroup.group: radioButtonsGroup
            onClicked: label.text = text
        }
        RadioButton {
            text: "second"
            ButtonGroup.group: radioButtonsGroup
            onClicked: label.text = text
        }
        RadioButton {
            text: "third"
            ButtonGroup.group: radioButtonsGroup
            onClicked: label.text = text
        }
        Label {
            id: label
            text: qsTr("")
            font.pixelSize: 22
            font.italic: true
        }
    }
}
