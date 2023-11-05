import QtQml.XmlListModel
import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: window
    width: 1080
    height: 640
    visible: true
    XmlListModel {
        id: xmlListModel
        source: "./cbr.xml"
        query: "/ValCurs/Valute"
        XmlListModelRole {
            name: "Nominal";
            elementName: "Nominal"
        }
        XmlListModelRole {
            name: "Name";
            elementName: "Name"
        }
        XmlListModelRole {
            name: "Value";
            elementName: "Value"
        }
    }
    ListView {
        anchors.fill: parent
        model: xmlListModel
        delegate: Rectangle {
            width: parent.width
            height: 20
            Text { 
                text: Nominal + " " + Name + " = " + Value + "руб."
                anchors.centerIn: parent
            }
        }
    }
}
