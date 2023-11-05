import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ColumnLayout {
        spacing: 20
        Button {
            text: "Click me!"
            onPressed: buttonConfig.text = qsTr("Нажата")
            onReleased: buttonConfig.text = qsTr("Отпущена")
        }
        Label {
            id: buttonConfig
            text: qsTr("Click button to start")
            font.pixelSize: 22
        }
    }
}
