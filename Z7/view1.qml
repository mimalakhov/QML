import QtQuick
import QtQuick.Window
import myModule
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 250
    height: 120
    title: qsTr("Hello World")

    MyCounter {
        id: myCounter
        counter: 0
    }
    
    Column {
        anchors.fill: parent
        spacing: 10

        Label {
            id: label
            anchors.horizontalCenter: parent.horizontalCenter
            text: myCounter.counter
            font.pixelSize: 32
        }

        Button {
            id: increment
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Прибавить 1"
            onClicked: {
                myCounter.inc()
            }
        }

        Button {
            id: tozero
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Обнулить"
            onClicked: {
                myCounter.zero()
            }
        }
    }
}
