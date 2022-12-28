// Copyright (C) 2022 smr.
// SPDX-License-Identifier: MIT
// https://smr76.github.io

import QtQuick 2.15
import Neumorphism 1.0

Item {
    id: control

    property color color: '#aaa'
    property list<GradientColor> gradient
    property var radius: undefined

    ShaderEffect {
        id: effect
        width: control.width;
        height: control.height;

        readonly property int hasGradient: gradient.length > 1;
        readonly property color color: control.color
        readonly property color c0: hasGradient ? gradient[0].color: "#fff";
        readonly property color c1: hasGradient ? gradient[1].color: "#fff";
        readonly property vector2d s0: hasGradient ? gradient[0].stop : Qt.vector2d(0,0);
        readonly property vector2d s1: hasGradient ? gradient[1].stop : Qt.vector2d(0,0);
        readonly property vector2d ratio: Qt.vector2d(width / Math.max(width, height),
                                                      height/ Math.max(width, height));
        readonly property vector4d radius: {
            let whMin = Math.min(ratio.x, ratio.y)/2;
            if(typeof control.radius == "number"){
                let rad = 0;
                rad = Math.min(Math.max(control.radius, 0.01), whMin);
                return Qt.vector4d(rad, rad, rad, rad);
            }
            else if(typeof control.radius == "object" && whMin > 0) {
                /*!
                 * I made advanced rectangle in order to make a rectangle with changeable radiuses and a basic gradient.
                 * radius points,  0 <= x,y,z,w <= 0.5
                 * - vector4d(x, y, z, w):
                 *  ╭───┬───╮
                 *  │ X │ Y │
                 *  ├───┼───┤
                 *  │ W │ Z │
                 *  ╰───┴───╯
                 *  ╭┐ ┌╮ ┌┐ ┌┐
                 *  └┘ └┘ └╯ ╰┘
                 *   X  Y  Z  W
                 */
                return Qt.vector4d(Math.min(Math.max(control.radius.x, 0.01), whMin),
                                    Math.min(Math.max(control.radius.y, 0.01), whMin),
                                    Math.min(Math.max(control.radius.z, 0.01), whMin),
                                    Math.min(Math.max(control.radius.w, 0.01), whMin));
            }
            else {
                return Qt.vector4d(0.0,0.0,0.0,0.0);
            }
        }
        /**
         * TODO: Allow radius variants to be more than 0.5, To do so, tie Y to the radius center point.
         *  ╭───┬─┐
         *  │ Y │ │
         *  ├───┼─┤
         *  └───┴─┘
         * BUG: I'm not sure why, but GLSL works without the "mod" function in this code "lowp int area = int(mod(-atan(", and I'm not sure why?!
         * Isn't there any overflow here?
         */

        fragmentShader: "qrc:/Neumorphism/Shaders/advanced-rectangle.frag.qsb"
    }
}
