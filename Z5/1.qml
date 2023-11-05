import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    
    MenuBar {
        width: parent.width
        Menu {
            title: qsTr("File")
            Action { text: qsTr("New..."); onTriggered: label.text=text  }
            Action { text: qsTr("Open..."); onTriggered: label.text=text }
            Action { text: qsTr("Save"); onTriggered: label.text=text }
            Action { text: qsTr("Save As..."); onTriggered: label.text=text }
            MenuSeparator { }
            Action { text: qsTr("Quit"); onTriggered: label.text=text }
        }
        Menu {
            title: qsTr("Edit")
            Action { text: qsTr("Cut"); onTriggered: label.text=text }
            Action { text: qsTr("Copy"); onTriggered: label.text=text }
            Action { text: qsTr("Paste"); onTriggered: label.text=text }
        }
        Menu {
            title: qsTr("Help")
            Action { text: qsTr("About"); onTriggered: label.text=text }
        }
    }
    Label {
        id: label
        anchors.centerIn: parent
        font.pixelSize: 22
        text: qsTr("")
    }
}
