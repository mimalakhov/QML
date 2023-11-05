import QtQuick 2.0
import QtQuick.Window
import QtQuick.Controls

Window {
    id: window
    visible: true
    width: Screen.width / 2
    height: Screen.height / 1.8
    title: qsTr("lalala")
    Column {
        id: col
        anchors.fill: parent
        spacing: 3

        TextField {
            id: login
            width: parent.width
            height: 30
            placeholderText: "Введите логин"
        }

        TextField {
            id: password
            width: parent.width
            height: 30
            placeholderText: "Введите пароль"
        }

        Button {
            id: button
            text: qsTr("Добавить")
            width: parent.width
            height: 30            
            onClicked: {
                appendDataJSON()
            }
        }

        Text {
            id: label
            width: parent.width
            height: 30
            text: ""
        }
    }

    function appendDataJSON() {
        var xhr = new XMLHttpRequest();
        xhr.responseType = 'json';
        xhr.onreadystatechange = function() {
            print(xhr.readyState)
            var json = JSON.parse(xhr.responseText)
            if(json.error != null) label.text = "Ошибка:" + json.error
            else label.text = json.token
            print(xhr.response)
        }
        xhr.open("POST", "https://reqres.in/api/register");
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        var body = 'email=' + login.text +
        '&password=' + password.text;
        xhr.send(body);
    }
}