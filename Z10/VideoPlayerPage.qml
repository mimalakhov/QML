import QtQuick
import QtMultimedia
import QtQuick.Controls

Item {
    id: it
    width: 640
    height: 480
    Column {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        spacing: 5

        MediaPlayer {
            id: mediaPlayer
            source: "soundeffects\\sample_1280x720_surfing_with_audio.avi"
            audioOutput: AudioOutput {
                volume: 0.1
            }
            videoOutput: videoOutput
        }

        VideoOutput {
            id: videoOutput
            width: 640
            height: 200
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(mediaPlayer.playbackState == 1)
                        mediaPlayer.pause()
                    else
                        mediaPlayer.play()
                }
            }
        }
        // ToDo: add button to start video
        Button {
            id: button
            width: parent.width
            height: 30
            text: "Play"
            onClicked: mediaPlayer.play()
        }

        Slider {
            id: videoSlider
            width: it.width
            enabled: mediaPlayer.seekable
            to: 1.0
            value: mediaPlayer.position / mediaPlayer.duration
            onMoved: mediaPlayer.setPosition(value * mediaPlayer.duration)
        } 
    }
    // ToDo: add silder to control playback
}
