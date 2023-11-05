import QtQuick 2.0

Rectangle {
    property alias planetName: text.text
    property alias textColor: text.color
    height: 120
    radius: 3
    color: "white"
    width: 200
    Text {
        id: text
        anchors.centerIn: parent
        text: "Planet name"
    }
}
