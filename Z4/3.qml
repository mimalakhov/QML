import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ButtonGroup { id: radioButtonsGroup }
    ColumnLayout {
        spacing: 20

        id: dialogTab
        anchors.fill: parent
        SimpleDialog {
            id: dialog
            title: "New dialog"
        }
        Button {
            text: qsTr("Open dialog")
            onClicked: {
                dialog.open();
                dialog.accepted.connect(function() {
                    if(dialog.a!==""&&dialog.b!=="")
                        console.log(parseInt(dialog.a)+parseInt(dialog.b))
                    else console.log("Wrong input!")
                });
            }
        }
    }
}

