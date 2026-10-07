import QtQuick
import Quickshell
import Quickshell.WindowManager

Variants {
    model: Quickshell.screens

    // status bar shown all on monitors
    PanelWindow {
        id: bar
        required property var modelData

        screen: modelData
        anchors { top: true; left: true; right: true }
        height: 32
        exclusiveZone: implicitHeight
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            color: "#c0c0c0"
        }

        // inner line for main bar bevel
        Rectangle { 
            anchors { top: parent.top; left: parent.left; right: parent.right }
            height: 2
            color: "#ffffff"
        }

        // outer line for main bar bevel
        Rectangle { 
            anchors { bottom: parent.bottom; left: parent.left; right: parent.right }
           height: 2
           color: "#000000"
        }

        Row {
            anchors {
                left: parent.left
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }
            spacing: 10

            Text {
                text: ""
                color: "#000000"
                font.family: "Symbols Nerd Font"
                font.pixelSize: 22
            }

            Row {
                spacing: 2
                anchors.verticalCenter: parent.verticalCenter

                Workspaces {}
            }
        }


        Clock {}
    }
}
