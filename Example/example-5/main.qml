import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
//import QtQuick.Controls.Material 2.15

import Neumorphism 1.0 as Neu

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

//    Material.theme: Material.Light

    Neu.Button{
        id: control
        anchors.centerIn: parent

        width: 200
        height: 200

        text: "Neumorphism Button"
    }
}
