import QtQml.XmlListModel
import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: window
    width: 1080
    height: 640
    title: qsTr("ZZZZZZZZZZZZZZZZZZ")
    visible: true
    ListModel {
        id: paraModel
        ListElement {day: 1; number: 1; nameLection: "para1"; nameTeacher: "teacher1"; numberAud: "220" }
        ListElement {day: 1; number: 2; nameLection: "para2"; nameTeacher: "teacher1"; numberAud: "221" }
        ListElement {day: 1; number: 3; nameLection: "para3"; nameTeacher: "teacher1"; numberAud: "404" }

        ListElement {day: 2; number: 1; nameLection: "para333"; nameTeacher: "teacher1frwer"; numberAud: "0,1" }
        ListElement {day: 2; number: 2; nameLection: "para3ewrt"; nameTeacher: "teacher1swrf"; numberAud: "ZZZZZ" }

        ListElement {day: 3; number: 1; nameLection: "undefined"; nameTeacher: "timofeev"; numberAud: "-3,14159..." }
    }

    ListView {
        id: view
        width: parent.width
        height: parent.height
        spacing: 4
        model: paraModel
        delegate: Rectangle {
            height: 75
            radius: 3
            color: "white"
            Column {
                width: parent.width
                Text {
                    text: nameLection
                }
                Text {
                    text: nameTeacher
                }
                Text {
                    text: numberAud
                }
            }
        }
        section.property: "day"
        section.criteria: ViewSection.FullString
        section.delegate: Rectangle {
            width: view.width
            height: 50
            color: "lightsteelblue"
            required property string section
            Text {
                text: parent.section
                font.bold: true
                font.pixelSize: 20
            }
        }
    }
}