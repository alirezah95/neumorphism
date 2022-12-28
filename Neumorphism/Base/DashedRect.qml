// Copyright (C) 2022 smr.
// SPDX-License-Identifier: MIT
// https://smr76.github.io

import QtQuick 2.15
import QtQuick.Controls 2.15

Control {
    id: control

    property real dashCount: 2
    property real dashWidth: 2

    palette.base: 'black'

    ShaderEffect {
            id: effect
            width: control.width;
            height: control.height;
            readonly property real count: control.dashCount
            readonly property real dashWidth: control.dashWidth / width / 2
            readonly property color color: control.palette.base;

            fragmentShader: "qrc:/Neumorphism/Shaders/dashed-rectangle.frag.qsb"
        }
}
