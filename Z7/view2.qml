import QtQuick
import QtQuick.Window
import QtQuick.Controls
import myModule

Window {
    id: window
    visible: true
    width: Screen.width / 2
    height: Screen.height / 1.8
    title: qsTr("lalala")
    
    MyListString {
        id: myListString
        slist: []
        onListChanged: stroka.text = myListString.list_to_str()
    }

    Column {
        id: col
        anchors.fill: parent
        spacing: 3

        Label {
            id: stroka
            width: parent.width
            height: 30 
            text: ""
        }

        TextField {
            id: itemToSave
            width: parent.width
            height: 30
            placeholderText: "Введите строку"
            validator: RegularExpressionValidator { regularExpression: /[a-zA-Z]+/ }
        }

        Button {
            id: save
            text: qsTr("Добавить элемент")
            width: parent.width
            height: 30            
            onClicked: {
                myListString.add_to_list(itemToSave.text)
            }
        }

        Button {
            id: deleteStr
            text: qsTr("Удалить элемент")
            width: parent.width
            height: 30            
            onClicked: {
                myListString.pop_from_list()
            }
        }
    }
}
