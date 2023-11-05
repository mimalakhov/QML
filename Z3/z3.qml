import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQml.XmlListModel



ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("List model")

    XmlListModel {
        id: dataModel
        source: "./data.xml"
        query: "/ValCurs/Valute"
        XmlListModelRole {
            name: "name";
            elementName: "Name"
        }
        XmlListModelRole {
            name: "nominal";
            elementName: "Nominal"
        }
        XmlListModelRole {
            name: "code";
            elementName: "CharCode"
        }
        XmlListModelRole {
            name: "value";
            elementName: "Value"
        }
    }
    ListView {
        //property int mywidth: container.width
        id: container
        width: parent.width
        height: parent.height
        spacing: 4
        model: dataModel
        delegate: Rectangle {
            height: 75
            radius: 3
            color: "white"
            width: container.width
            Column{
                width: parent.width
                Text {
                    //alignment: horizontalCenter
                    text: code + "  " + name
                }
                //Text {
                    //alignment: horizontalCenter
                //    text:
                //}
                Text {
                    //alignment: horizontalCente
                    text: "Стоимость: " + (parseFloat(value)/parseFloat(nominal))
                }
            }

        }

    }
}
