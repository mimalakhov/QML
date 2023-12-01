import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: qsTr("Quiz") //Квиз
    id: window

    ButtonGroup { 
        id: radioGroup
        onClicked: {
            stackPage.currentIndex = 1

            if (checkedButton.text === "7") 
                stackPage.flag = true
            else
                stackPage.flag = false
            checkedButton.checked = false
        }
    }

    StackLayout {
        id: stackPage
        height: parent.height
        width: parent.width
        currentIndex: 0
        property bool flag

        Column {
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("How many levels are there in the OSI model?") //Сколько уровней в модели OSI?
                wrapMode: Text.WordWrap
                width: parent.width - 100
                font.pointSize: 24
            }
            RadioButton {
                text: "3"
                ButtonGroup.group: radioGroup
                font.pointSize: 16
            }

            RadioButton {
                text: "5"
                ButtonGroup.group: radioGroup
                font.pointSize: 16
            }

            RadioButton {
                text: "7"
                ButtonGroup.group: radioGroup
                font.pointSize: 16
            }
            RadioButton {
                text: "6"
                ButtonGroup.group: radioGroup
                font.pointSize: 16
            }
        }

        Column {
            Label {
                id: label
                 width: parent.width
                 horizontalAlignment: Text.AlignHCenter
                 font.pointSize: 24
                 text: stackPage.flag ? qsTr("Congratulations! You won the dumplings!") //Поздравляем! Вы выиграли пельмени!
                    : qsTr("Man, Google it...") //Чел, загугли...
                 wrapMode: Label.WordWrap
            }
            Rectangle {
                color: window.color
                width: parent.width
                height: parent.height - label.height - btn.height
                Image {
                    anchors.centerIn: parent
                    width: parent.width - 20; height: parent.height - 20
                    fillMode: Image.PreserveAspectFit
                    source: stackPage.flag ? "./images/success.jpg" : "./images/failure.jpg"
                }
            }
            Button {
                id: btn
                text: qsTr("Try again") //Попробовать ещё раз
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: stackPage.currentIndex = 0
            }
        }
    }
    Component.onCompleted: console.log(Qt.locale())
}