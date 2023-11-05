import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

Dialog {
    property string date
    property string note
    standardButtons: Dialog.Cancel | Dialog.Ok
    modal: true
    Column {
        id: layout
        objectName: "layout"
        anchors.fill: parent
        TextField {
            id: dateField
            width: parent.width
            placeholderText: qsTr("Введите дату")
        }
        TextField {
            id: noteField
            width: parent.width
            placeholderText: qsTr("Введите заметку")
        }
    }
    onAccepted: {
        date = dateField.text
        note = noteField.text
    }
}
