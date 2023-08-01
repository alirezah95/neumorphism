import QtQuick

import Neumorphism 1.0

Item {
    id: idRoot

    property real radianAngle: 45 / 57.2958
    property int offset: 8
    property real shadowRadius: 52
    property real radius: 8
    property color color: "#aaa"

    implicitWidth: 160
    implicitHeight: 56

    FastShadow {
        x: Math.cos(parent.radianAngle) * parent.offset
        y: Math.sin(parent.radianAngle) * parent.offset

        width: parent.width
        height: parent.height

        radius: parent.shadowRadius
        source: idRc
        color: "#50423f30"
        transparentBorder: true
    }

    FastShadow {
        x: Math.cos(parent.radianAngle + 3.14) * parent.offset
        y: Math.sin(parent.radianAngle + 3.14) * parent.offset

        width: parent.width
        height: parent.height

        radius: parent.shadowRadius
        source: idRc

        color: "#fefefe"
        transparentBorder: true
    }

    Rectangle {
        id: idRc
        anchors.fill: parent

        color: idRoot.color
        radius: parent.radius
    }
}
