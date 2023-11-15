import QtQuick
import QtMultimedia
import QtQuick.Controls

Item {
    width: 640
    height: 480
    SoundEffect {
        id: soundEffect
        // ToDo: set source to gun.wav in soundeffects folder
        source: "soundeffects/gimn-ukrainyi.wav"
        // ToDo: set volume controlled by volumeSlider
        volume: volumeSlider.value
        // ToDo: set loops controlled by slider
        loops: timesSlider.value
    }
    MouseArea {
        id: touchHandler
        anchors.fill: parent
        // ToDo: play sound effect or stop playing on clicked
        onClicked: {
            if (!soundEffect.playing) 
            {
                soundEffect.play()
            }
            else {
                soundEffect.stop()
                timesUserSlider.value = 0
            }
        }    
    }
    Column {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        spacing: 50

        Slider {
            id: volumeSlider
            width: parent.width
            value: 0.5
            from: 0
            to: 1
            stepSize: 0.1
        }
        // ToDo: add slider to control count of loops
        Slider {
            id: timesSlider
            snapMode: Slider.SnapAlways
            width: parent.width
            value: 2
            from: 1
            to: 10
            stepSize: 1
        }
        // ToDo: add slider to show progress
        Slider {
            id: timesUserSlider
            enabled: false
            snapMode: Slider.SnapAlways
            width: parent.width
            value: timesSlider.value - soundEffect.loopsRemaining
            from: 0
            to: 10
            stepSize: 1
        }
    }
}
