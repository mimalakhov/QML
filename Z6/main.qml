import QtQuick
import QtQuick.Window
import QtQuick.LocalStorage
import QtQuick.Controls
import "Database.js" as JS

Window {
    id: window
    visible: true
    width: Screen.width / 2
    height: Screen.height / 1.8
    title: qsTr("База данных")
    
    Column {
        id: col
        anchors.fill: parent
        spacing: 3

        Label {
            id: sum
            text: ""
            width: parent.width
            height: 30
        }

        ListView {
            id: listView
            width: parent.width
            height: parent.height - (button.height + nameText.height + priceText.height + sum.height + col.spacing * 6)
            model: ListModel { id: noteModel }
            delegate: Rectangle {
                width: listView.width
                height: 30
                color: "skyblue"
                Text {
                    anchors.centerIn: parent
                    text: name + ": " + price
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: { 
                        JS.dbDeleteOne(rowid)
                        noteModel.remove(index)
                        JS.dbSum()
                    }
                }
            }
        }

        TextField {
            id: nameText
            width: parent.width
            height: 30
            placeholderText: "Введите название"
            validator: RegularExpressionValidator { regularExpression: /[a-zA-Z]+/ }
        }

        TextField {
            id: priceText
            width: parent.width
            height: 30
            placeholderText: "Введите цену"
            validator: RegularExpressionValidator { regularExpression: /[0-9]+/ }
        }

        Button {
            id: button
            text: qsTr("Добавить")
            width: parent.width
            height: 30            
            onClicked: {
                if (nameText.text!=""&&priceText.text!="") {
                    JS.dbInsert(nameText.text, priceText.text)
                    noteModel.append({"name": nameText.text, "price": priceText.text  })
                    JS.dbSum()
                }
            }
        }

        Component.onCompleted: {
            JS.dbInit()
            JS.dbReadAll()
            JS.dbSum()
            //JS.dbDelete()
        }
    }
}
