import QtQuick 2.9
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 1000
    height: 700
    title: qsTr("Remembering")

    TabBar {
        id: bar
        width: parent.width
        TabButton { text: qsTr("Ex 1") }
        TabButton { text: qsTr("Ex 2") }
    }

    StackLayout {
        width: parent.width
        anchors.top: bar.bottom
        anchors.topMargin: 20
        currentIndex: bar.currentIndex
        Item { 
            id: firstTab 
            Column {
                spacing: 10
                anchors.fill: parent
                TextField {
                    id: num
                    width: parent.width / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 30
                    placeholderText: "Введите радиус (в диапазоне от 100 до 400)"
                    validator: IntValidator { bottom: 100; top: 400 }
                }

                Button {
                    text: "Ok"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        var number = parseInt(num.text);
                        if (number < 100 || number > 400){
                            labelError.visible = true
                            return;
                        } 
                        labelError.visible = false
                        circle.height = number;
                        circle.width = number;
                    }
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 500
                    height: 500
                    color: "white"
                    // anchors.horizontalCenter: parent.horizontalCenter
                    border { color: "black"; width: 5 }
                    Rectangle {
                        id: circle
                        anchors.centerIn: parent
                        color: "white"
                        border { color: "black"; width: 2 }
                        radius: height / 2
                    }
                }

                Label {
                    id: labelError
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 30
                    color: "red"
                    text: "Неверный ввод!"
                    visible: false
                }
            }
        }

        Item { 
            id: secondTab 
            Column {
                spacing: 10
                anchors.fill: parent
                TextField {
                    id: field
                    width: parent.width / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 30
                    placeholderText: "Введите n (в диапазоне от 1 до 9)"
                    validator: IntValidator { bottom: 1; top: 9 }
                }

                Button {
                    text: "Ok"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        var number = parseInt(field.text);
                        if (number < 1 || number > 9){
                            view.currentNum = 0
                            labelError2.visible = true
                            return;
                        } 
                        view.currentNum = number
                        labelError2.visible = false
                    }
                } 

                ListView {
                    id: view
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 200
                    height: 500
                    spacing: 5
                    model: 10
                    property int currentNum: 0
                    delegate: Rectangle {
                        width: 200
                        height: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "white"
                        Text {
                            horizontalAlignment: Text.AlignHCenter
                            anchors.centerIn: parent
                            font.pointSize: 14
                            text: {
                                view.currentNum > 0 ? view.currentNum + " х " + (model.index + 1) + " = " + (model.index + 1) * view.currentNum : ' '
                            }
                        }
                        border { color: "black"; width: 3 }
                    }
                }

                Label {
                    id: labelError2
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 30
                    color: "red"
                    text: "Неверный ввод!"
                    visible: false
                }
            }
        }
    }
    
}  