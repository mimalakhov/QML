// SPDX-FileCopyrightText: Copyright 2023 Open Mobile Platform LLC <edu@omp.ru>
// SPDX-License-Identifier: CC-BY-4.0

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    // SoundsEffectPage {
    //     anchors.fill: parent
    // }
    VideoPlayerPage {
       anchors.fill: parent
    }
}
