import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import QtQuick.Layouts
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

import Neumorphism

T.Button {
    id: control

    property real radius: width / 2

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topInset: 0
    bottomInset: 0
    leftInset: 0
    rightInset: 0

    leftPadding: 12
    rightPadding: 12
    topPadding: 8
    bottomPadding: 8
    horizontalPadding: padding - 4
    spacing: 6

    icon.width: 24
    icon.height: 24
    icon.color: !enabled ? Material.hintTextColor :
                           flat && highlighted ? Material.accentColor :
                                                 highlighted ? Material.primaryHighlightedTextColor : Material.foreground

    Material.elevation: flat ? (control.down || (enabled && control.hovered) ? 2 : 0)
                             : control.down ? 8 : 2
    Material.background: flat ? "transparent" : undefined


    contentItem: RowLayout {
        spacing: control.spacing

        Label {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignCenter

            padding: 0

            color: control.enabled ? (control.highlighted
                                      ? Neumorphism.accent : Neumorphism.foreground)
                                   : Neumorphism.disabledTextColor
            text: control.text
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    background: NeumorphismRoundedRectangle {
        radianAngle: 35 / 57.2958
        offset: control.enabled ? (control.pressed && control.hovered ? 6 : 12)
                                : 2
        shadowRadius: 42
        radius: control.radius

        color: control.hovered || control.pressed || !control.enabled
               ? Neumorphism.buttonHoverColor
               : Neumorphism.background
    }
}
