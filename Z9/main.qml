import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 300
    height: 99
    title: qsTr("Hello World")

    WorkerScript {
        id: myWorker
        source: "script.js"
        onMessage: number.text = messageObject.reply
    } 

    Column {
        anchors.fill: parent
        spacing: 3

        Label {
            id: number
            width: parent.width
            height: 30
            text: ''
        }
        
        TextField {
            id: num
            width: parent.width
            height: 30
            placeholderText: "Введите n"
            validator: IntValidator { bottom: 1; top: 30 }
        }

        Button {
            width: parent.width
            height: 30
            text: "Ввести"
            onClicked: {
                myWorker.sendMessage({ 'n': parseInt(num.text)})
            }
        }
    }
}
