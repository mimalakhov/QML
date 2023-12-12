import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("List model")

    Grid {
        id: container
        spacing: 2
        anchors.fill: parent
        columns: 2
        Repeater {
            model: ListModel {
                ListElement { name: qsTr("Mercury"); surfaceColor: "gray" }
                ListElement { name: qsTr("Venus"); surfaceColor: "yellow" }
                ListElement { name: qsTr("Earth"); surfaceColor: "blue" }
                ListElement { name: qsTr("Mars"); surfaceColor: "orange" }
                ListElement { name: qsTr("Jupiter"); surfaceColor: "orange" }
                ListElement { name: qsTr("Saturn"); surfaceColor: "yellow" }
                ListElement { name: qsTr("Uranium"); surfaceColor: "lightBlue" }
                ListElement { name: qsTr("Neptune"); surfaceColor: "lightBlue" }
            }
            PlanetItem {
                width: container.width / container.columns
                planetName: name
                planetColor: surfaceColor
            }
        }
    }
}
