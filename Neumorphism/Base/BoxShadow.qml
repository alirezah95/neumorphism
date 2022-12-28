// Copyright (C) 2022 smr.
// SPDX-License-Identifier: MIT
// https://smr76.github.io

import QtQuick 2.15

Item {
    id: control

    implicitWidth: 50
    implicitHeight: 50

    property color color: '#000'
    property alias shadow: effect.shadow

    ShaderEffect {
        id: effect

        width: control.width;
        height: control.height;

        property Shadow shadow: Shadow { radius: width; spread: 10 }

        readonly property vector2d ratio: Qt.vector2d(width / whmax, height / whmax);
        readonly property real whmax: Math.max(width, height);
        readonly property real spread: shadow.spread / whmax;
        readonly property color color: control.color;
        readonly property real radius: {
            const min = Math.min(width, height);
            return Math.min(Math.max(shadow.radius, spread), min/2) / whmax;
        }

        fragmentShader: "qrc:/Neumorphism/Shaders/box-shadow.frag.qsb"
    }
}
