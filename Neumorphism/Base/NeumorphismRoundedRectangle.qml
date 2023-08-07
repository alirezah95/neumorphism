import QtQuick

import Neumorphism 1.0

Item {
    id: idRoot

    property real radianAngle: 45 / 57.2958
    property int offset: 8
    property real shadowRadius: 52
    property real radius: 8
    property color color: "#aaa"
    property color topShadowColor: "#50423f30"
    property color bottomShadowColor: "#fefefe"

    implicitWidth: 160
    implicitHeight: 56

    FastShadow {
        x: Math.cos(parent.radianAngle) * parent.offset
        y: Math.sin(parent.radianAngle) * parent.offset

        width: parent.width
        height: parent.height

        radius: parent.shadowRadius
        source: idRc
        color: bottomShadowColor
        transparentBorder: true
    }

    FastShadow {
        x: Math.cos(parent.radianAngle + 3.14) * parent.offset
        y: Math.sin(parent.radianAngle + 3.14) * parent.offset

        width: parent.width
        height: parent.height

        radius: parent.shadowRadius
        source: idRc

        color: topShadowColor
        transparentBorder: true
    }

    Rectangle {
        id: idRc
        anchors.fill: parent

        color: idRoot.color
        radius: parent.radius
    }
}
