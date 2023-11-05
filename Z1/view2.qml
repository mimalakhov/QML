import QtQuick
import QtQuick.Window
import QtQuick.Layouts

Window {
    id: win
    width: 1000
    height: 800
    visible: true
    title: qsTr("Hello World")

    MouseArea {
        anchors.fill: parent
        onClicked: moveSquareAnimation.start()
    }

    Rectangle {
        id: yellowSubmarine
        x: 200
        y: 200
        width: 150
        height: 150
        color: "yellow"
        radius: width / 2
    }

    SequentialAnimation {
        id: moveSquareAnimation
        NumberAnimation {
            target: yellowSubmarine
            property: "x"
            to: 500
            duration: 1000
        }
        NumberAnimation {
            target: yellowSubmarine
            property: "y"
            to: 500
            duration: 1000
        }
        NumberAnimation {
            target: yellowSubmarine
            property: "x"
            to: 200
            duration: 1000
        }
        NumberAnimation {
            target: yellowSubmarine
            property: "y"
            to: 200
            duration: 1000
        }
    }


}
