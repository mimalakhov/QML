import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: window
    title: qsTr("Hello World")
    width: 640
    height: 480
    visible: true

    StackView {
        id: stack
        initialItem: question
        anchors.fill: parent

        Component {
            id: question
            ColumnLayout {
                spacing: 1
                Label {
                    id: label
                    Layout.alignment: Qt.AlignCenter
                    font.pixelSize: 42
                    text: qsTr("Вопрос?")
                }

                ButtonGroup { id: radioButtonsGroup }
                RadioButton {
                    text: qsTr("Неправильный ответ")
                    ButtonGroup.group: radioButtonsGroup
                    Layout.alignment: Qt.AlignCenter
                    onPressed: incorrect_answer()
                }
                RadioButton {
                    text: qsTr("Правильный ответ")
                    ButtonGroup.group: radioButtonsGroup
                    Layout.alignment: Qt.AlignCenter
                    onPressed: correct_answer()
                }
                RadioButton {
                    text: qsTr("Неправильный ответ")
                    ButtonGroup.group: radioButtonsGroup
                    Layout.alignment: Qt.AlignCenter
                    onPressed: incorrect_answer()
                }
                RadioButton {
                    text: qsTr("Неправильный ответ")
                    ButtonGroup.group: radioButtonsGroup
                    Layout.alignment: Qt.AlignCenter
                    onPressed: incorrect_answer()
                }

                function correct_answer() {
                    stack.push(answer, {a: qsTr("Верно!"), b: "images\\correct.png"})
                }
                function incorrect_answer() {
                    stack.push(answer, {a: qsTr("Неверно!"), b: "images\\incorrect.jpg"})
                }
            }
        }

        Item {
            id: answer

            property var a
            property var b

            ColumnLayout {
                id: comout
                spacing: 1

                Label {
                    id: textCond
                    Layout.alignment: Qt.AlignCenter
                    font.pixelSize: 42
                    text: answer.a
                }
                Image {
                    id: imageCond
                    Layout.alignment: Qt.AlignCenter
                    source: answer.b
                    width: 100
                    height: 100
                }
            }
        }
    }
}