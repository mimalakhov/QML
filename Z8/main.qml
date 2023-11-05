import QtQuick 2.0
import QtQuick.Window

Window {
    id: window
    visible: true
    width: Screen.width / 2
    height: Screen.height / 1.8
    title: qsTr("lalala")

    ListModel {
        id: dataModel
    }

    ListView {
        id: view
        anchors.fill: parent
        spacing: 3
        model: dataModel
        delegate: Rectangle {
            width: window.width
            height: 30
            color: "skyblue"
            Text {
                anchors.centerIn: parent
                text: `${model.userID}: (${model.id}) ${model.title} (${model.comleted})`
            }
        }
    }

    Component.onCompleted: {
        getDataJSON()
    }

    function getDataJSON() {
        var request = new XMLHttpRequest()
        request.open('GET', 'https://jsonplaceholder.typicode.com/todos', true);
        request.onreadystatechange = function() {
            if (request.readyState === XMLHttpRequest.DONE) {
                if (request.status && request.status === 200) {
                    var result = JSON.parse(request.responseText)
                    for(let i=0; i<result.length;i++){
                        dataModel.append({
                            "userID": result[i].userId.toString(),
                            "id": result[i].id,
                            "title": result[i].title,
                            "comleted": result[i].completed.toString()
                        })
                    }
                } else {
                    console.log("HTTP:", request.status, request.statusText)
                }
            }
        }
        request.send()
    }
}
