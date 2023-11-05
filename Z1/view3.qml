import QtQuick
import QtQuick.Window
import QtQuick.Layouts

Window {
    id: win
    width: 1000
    height: 600
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: yellowSubmarine
        x: 100
        y: 100
        width: 150
        height: 150
        color: "yellow"
        radius: width / 2
        gradient: Gradient {
            GradientStop { position: 0.00;
            color: "red" }
            GradientStop { position: 0.148;
            color: "orange" }
            GradientStop { position: 0.285;
            color: "yellow" }
            GradientStop { position: 0.428;
            color: "green" }
            GradientStop { position: 0.571;
            color: "cyan" }
            GradientStop { position: 0.714;
            color: "blue" }
            GradientStop { position: 0.857;
            color: "violet" }
        }
        transform: [
            Rotation {
                id: rotation
                angle: 60
                origin.x: 200; origin.y: 200
            }
            ]
        }

    Timer {
        running: true
        interval: 16; repeat: true
        onTriggered: rotation.angle += 2
    }

}
