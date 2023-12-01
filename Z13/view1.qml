import QtQuick 2.9
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello world")
   
    TabBar {
        id: tabbar
        width: parent.width
        TabButton { text: qsTr("Первое задание") }
        TabButton { text: qsTr("Второе задание") }
    }

    StackLayout {
        width: parent.width
        anchors.top: tabbar.bottom
        anchors.topMargin: 20
        currentIndex: tabbar.currentIndex
        Item { 
            id: firstTab 
            Column {
                spacing: 10
                anchors.fill: parent
                TextField {
                    id: radiusText
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 30
                    placeholderText: "Введите радиус"
                    validator: IntValidator{top: 100; bottom: 301}
                }

                Button {
                    text: "Пон"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        var radius = parseInt(radiusText.text);
                        circle.height = radius;
                        circle.width = radius;
                    }
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 300
                    height: 300
                    color: "white"
                    border { 
                        color: "blue"; 
                        width: 1
                    }
                    Rectangle {
                        id: circle
                        anchors.centerIn: parent
                        color: "yellow"
                        border { color: "blue"; width: 2 }
                        radius: height / 2
                    }
                }
            }
        }

        Item { 
            id: secondTab 
            Column {
                spacing: 10
                anchors.fill: parent
                TextField {
                    id: numberText
                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 30
                    placeholderText: "Введите число"
                    validator: IntValidator { bottom: 1; top: 9 }
                }

                Button {
                    text: "Пон"
                    anchors.horizontalCenter: parent.horizontalCenter
                    onClicked: {
                        var n = parseInt(numberText.text);
                        view.currentNum = n
                    }
                } 

                ListView {
                    id: view
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 200
                    height: 500
                    spacing: 1
                    model: 10
                    property int currentNum: 0
                    delegate: Rectangle {
                        width: 200
                        height: 30
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "white"
                        Label {
                            horizontalAlignment: Text.AlignHCenter
                            anchors.centerIn: parent
                            font.pointSize: 12
                            text: {
                                if (view.currentNum != 0) view.currentNum + " * " + (model.index + 1) + " = " + (model.index + 1) * view.currentNum
                                else ""
                            }
                        }
                        border { 
                            color: "gray"; 
                            width: 2 
                        }
                    }
                }
            }
        }
    }
}