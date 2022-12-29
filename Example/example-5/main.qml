import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import Neumorphism 1.0 as Neu

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Material.theme: Material.Light

    Button {
        id: idBtn

        width: 300
        height: 64

        anchors.centerIn: parent

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
}
