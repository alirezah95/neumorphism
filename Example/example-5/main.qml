import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import Neumorphism as Neu

ApplicationWindow {
    width: 750
    height: 600
    visible: true
    title: qsTr("Hello World")

    Material.theme: Material.Light

    Button {
        id: idBtn

        width: 300
        height: 64

        anchors.centerIn: parent
        anchors.verticalCenterOffset: -200

        text: "Shadow Test"

        background: Rectangle {
            color: Material.background
            radius: 33
            border.width: idBtn.pressed ? 2 : 1
            border.color: idEffect.shadow.color1.toString().replace("#", "#30")

            Neu.RoundedOutEffect {
                id: idEffect
                width: parent.width + 12
                height: parent.height + 12

                x: -3
                y: -3

                z: -1

                shadow.offset: 20
                shadow.angle: 90
                shadow.distance: 40
                shadow.radius: parent.radius
                shadow.spread: idBtn.pressed ? 18 : 13
                shadow.color1: Material.color(Material.Grey, Material.Shade900)
            }

            Neu.RoundedInEffect {
                anchors.fill: parent

                shadow.offset: 14
                shadow.angle: 0
                shadow.distance: 0.1
                shadow.radius: parent.radius
                shadow.spread: idBtn.pressed ? 44 : 52
                shadow.color1: "black"
                shadow.color2: "yellow"
            }
        }
    }

    Pane {
        id: idPane
        anchors.top: idBtn.bottom
        anchors.horizontalCenter: idBtn.horizontalCenter
        anchors.topMargin: 40

        width: 300
        height: 300

        Material.background: Material.Indigo

        property Neu.Shadow shadow: Neu.Shadow {
            angle: 25
            radius: 24
            color1: Qt.darker("#bbbbbb", 1.3)
            color2: Qt.lighter(idPane.Material.background, 1.8)
        }

        background: Item {
            id: idBg
            property real radianAngle: idPane.shadow.angle / 57.2958
            property real offset: idBtn.pressed ? 2 : 6

            width: idPane.width
            height: idPane.height

            Neu.FastShadow {
                // http://blog.ivank.net/fastest-gaussian-blur.html
                x: Math.cos(idBg.radianAngle) + idBg.offset; y: Math.sin(idBg.radianAngle) + idBg.offset
                width: parent.width; height: parent.height
                radius: idPane.shadow.radius
                source: idBgBack
                color: idPane.shadow.color1
                transparentBorder: true
            }

            Neu.FastShadow {
                x: 1.5 * Math.cos(idBg.radianAngle + 3.14) - idBg.offset
                y: 1.5 * Math.sin(idBg.radianAngle + 3.14) - idBg.offset
                width: parent.width; height: parent.height
                radius: idPane.shadow.radius
                source: idBgBack
                color: idPane.shadow.color2

                transparentBorder: true
            }

            Rectangle {
                id: idBgBack
                anchors.fill: parent
                color: idPane.Material.background

                radius: 60
            }
        }
    }
}
