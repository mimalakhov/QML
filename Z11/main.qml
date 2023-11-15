import QtQuick
import QtQuick.Window
import QtPositioning 6.6

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    MapPage {
        id: mapPage
    }
}
