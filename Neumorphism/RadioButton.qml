// Copyright (C) 2022 smr.
// SPDX-License-Identifier: MIT
// https://smr76.github.io

import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import Neumorphism 1.0
import "Base"

T.RadioButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                            implicitContentHeight + topPadding + bottomPadding,
                            implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6

    indicator: RoundedInEffect {
        id: indicatorBack

        implicitWidth: 28
        implicitHeight: 28

        shadow { radius: width; offset: 10; spread: 20; distance: 1.0 }

        x: control.text ?
               (control.mirrored ?
                    control.width - width - control.rightPadding :
                    control.leftPadding) :
               control.leftPadding + (control.availableWidth - width) / 2

        y: control.topPadding + (control.availableHeight - height) / 2

        color: control.palette.button
        /*!
         * TODO: add active and visual focus effect
         * control.visualFocus
         * control.activeFocus
         */

        BoxShadow {
            id: ishade
            anchors.centerIn: ibox
            anchors.verticalCenterOffset: control.padding / 4
            anchors.horizontalCenterOffset: control.padding / 4

            width: ibox.width + 6
            height: width
            opacity: control.checked ? 1.0 : 0.0
            color: '#77000000'

            shadow.spread: 15
            shadow.radius: width/2
        }

        AdvancedRectangle {
            id: ibox
            x: (parent.width - width)/2
            y: (parent.width - width)/2

            width: control.checked ? parent.width - control.padding : 0
            height: width

            radius: 0.5
            gradient: [
                GradientColor{color: Qt.lighter(control.palette.button, 1.1); stop: Qt.vector2d(0,0)},
                GradientColor{color: control.palette.button; stop: Qt.vector2d(0.5,0.5)}
            ]

            Behavior on width { NumberAnimation{ duration: 100 } }
        }
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        verticalAlignment: Text.AlignVCenter
        color: control.palette.buttonText
        text: control.text
        font: control.font
    }
}
