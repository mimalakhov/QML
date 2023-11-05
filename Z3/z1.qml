import QtQuick 2.9
import QtQuick.Controls 2.2


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("List model")

    
    ListView {
        id: container
        width: parent.width
        height: parent.height
        spacing: 4
        model: ListModel {
            ListElement { backgroundColor: "white"; text: "white"; textColor: "black"; }
            ListElement { backgroundColor: "blue"; text: "blue"; textColor: "black"; }
            ListElement { backgroundColor: "red"; text: "red"; textColor: "white"; }
            //ListElement { backgroundColor: "white"; text: "white"; textColor: "black"; }
            ListElement { backgroundColor: "blue"; text: "blue"; textColor: "white"; }
            ListElement { backgroundColor: "yellow"; text: "yellow"; textColor: "black"; }
        }
        delegate: RectangleWithText {
            width: container.width
            backgroundColor: model.backgroundColor
            text: model.text
            textColor: model.textColor
        }

    }

}
