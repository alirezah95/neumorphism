// Copyright (C) 2022 smr.
// SPDX-License-Identifier: MIT
// https://smr76.github.io

import QtQuick 2.15
import QtQuick.Templates 2.15  as T

T.SplitView {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    handle: RoundedOutEffect {
        implicitWidth: control.orientation === Qt.Horizontal ? 6 : control.width
        implicitHeight: control.orientation === Qt.Horizontal ? control.height : 6
        color: control.palette.button

        shadow {
            distance: 0.01
            radius: 10; offset: 2.5;
            spread: 1; angle: 90;
            color1: Qt.lighter(color, 1.5)
            color2: Qt.darker(color, 1.3)
        }
    }
}
