import QtQuick 2.9
import QtQuick.Controls 2.2


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("List model")

    Column {
        anchors.fill: parent
        ListView {
            width: parent.width
            height: parent.height
            spacing: 4
            model: ListModel {
                ListElement {
                     backgroundColor: "skyblue"
                     textColor: "gray"
                }
                ListElement {
                     backgroundColor: "blue"
                     textColor: "black"
                }
                ListElement {
                     backgroundColor: "yellow"
                     textColor: "red"
                }
            }
            delegate: PlanetItem {
                width: parent.width; height: 70;
                planetName: model.backgroundColor
                textColor: model.textColor
                color: model.backgroundColor
            }
        }
    }
}
