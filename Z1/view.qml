import QtQuick
import QtQuick.Window
import QtQuick.Layouts

Window {
    id: win
    width: 1000
    height: 600
    visible: true
    title: qsTr("Hello World")
    GridLayout {
        columns: 3
        rows: 7
        height: parent.height
        width: parent.width

        Rectangle {
            id: r00
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 0
            Layout.column: 0
            Layout.rowSpan : 3
        }
        Text {
            Layout.rowSpan : 3
            Layout.row: 0
            Layout.column: 0
            text: "Вторник"
            font.pointSize: 20
            anchors {left: r00.horizontalCenter}
        }
        Rectangle {
            id: r01
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 3
            Layout.column: 0
            Layout.rowSpan : 2
        }
        Text {
            Layout.rowSpan : 2
            Layout.row: 3
            Layout.column: 0
            text: "Среда"
            font.pointSize: 20
            anchors {left: r01.horizontalCenter}
        }


        Rectangle {
            id: r11
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 0
            Layout.column: 1
        }
        Text {
            Layout.row: 0
            Layout.column: 1
            text: "1"
            font.pointSize: 20
            anchors {left: r11.horizontalCenter}
        }
        Rectangle {
            id: r12
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 0
            Layout.column: 2
        }
        Text {
            Layout.row: 0
            Layout.column: 2
            text: "Первая пара"
            font.pointSize: 20
            anchors {left: r12.horizontalCenter}
        }

        Rectangle {
            id: r21
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 1
        }
        Text {
            Layout.row: 1
            Layout.column: 1
            text: "2"
            font.pointSize: 20
            anchors {left: r21.horizontalCenter}
        }
        Rectangle {
            id: r22
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 2
        }
        Text {
            Layout.row: 1
            Layout.column: 2
            text: "Вторая пара"
            font.pointSize: 20
            anchors {left: r22.horizontalCenter}
        }

        Rectangle {
            id: r31
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 2
            Layout.column: 1
        }
        Text {
            Layout.row: 2
            Layout.column: 1
            text: "3"
            font.pointSize: 20
            anchors {left: r31.horizontalCenter}
        }
        Rectangle {
            id: r32
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 2
            Layout.column: 2
        }
        Text {
            Layout.row: 2
            Layout.column: 2
            text: "Третья пара"
            font.pointSize: 20
            anchors {left: r32.horizontalCenter}
        }






        Rectangle {
            id: r211
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 3
            Layout.column: 1
        }
        Text {
            Layout.row: 3
            Layout.column: 1
            text: "1"
            font.pointSize: 20
            anchors {left: r211.horizontalCenter}
        }
        Rectangle {
            id: r212
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 3
            Layout.column: 2
        }
        Text {
            Layout.row: 3
            Layout.column: 2
            text: "Первая пара"
            font.pointSize: 20
            anchors {left: r212.horizontalCenter}
        }

        Rectangle {
            id: r221
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 4
            Layout.column: 1
        }
        Text {
            Layout.row: 4
            Layout.column: 1
            text: "2"
            font.pointSize: 20
            anchors {left: r221.horizontalCenter}
        }
        Rectangle {
            id: r222
            border { color: "black"; width: 5 }
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 4
            Layout.column: 2
        }
        Text {
            Layout.row: 4
            Layout.column: 2
            text: "Вторая пара"
            font.pointSize: 20
            anchors {left: r222.horizontalCenter}
        }

    }
}
