import QtQuick 2.0

Rectangle {
    id: rectangle
    property alias backgroundColor: rectangle.color
    property alias text: text.text
    property alias textColor: text.color
    height: 50
    radius: 3
    color: "white"
    width: 200
    Text {
        id: text
        anchors.centerIn: parent
        text: "text"
    }
}
