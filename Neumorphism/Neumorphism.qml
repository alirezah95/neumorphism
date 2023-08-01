// Copyright (C) 2022 smr.
// SPDX-License-Identifier: MIT
// https://smr76.github.io

pragma Singleton

import QtQuick 2.15

QtObject {
    property color  primary:        "#6970db"
    property color  accent:         "#b01100"
    property color  foreground:     "#646466"
    property color  background:     "#ebecfe"
    property int    elevation:      8

    readonly property color disabledTextColor:      Qt.darker(background, 1.3)
    readonly property color buttonHoverColor:       Qt.darker(background, 1.06)
    readonly property color borderHoverColor:       Qt.darker(background, 1.15)

    function blend(color1, color2, alpha) {
        var color = color1;
        color.r = (color.r + color2.r) / 2;
        color.g = (color.g + color2.g) / 2;
        color.b = (color.b + color2.b) / 2;
        color.a = alpha;

        return color;
    }

    function clamp(x, a, b) {
        return Math.min(Math.max(x, a), b);
    }

    function remap(value, low1, high1, low2, high2) {
        return low2 + (high2 - low2) * (value - low1) / (high1 - low1);
    }

    function invertColor(color) {
        return Qt.rgba(1.0 - color.r, 1.0 - color.g, 1.0 - color.b, 1.0);
    }
}
