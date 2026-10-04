import QtQuick
import Quickshell
import Quickshell.WindowManager

ShellRoot {
    Variants {
        model: Quickshell.screens

        // status bar shown all on monitors
        PanelWindow {
            id: bar
            required property var modelData

            screen: modelData
            anchors { top: true; left: true; right: true }
            implicitHeight: 32
            exclusiveZone: implicitHeight
            color: "transparent"

            Rectangle {
                anchors.fill: parent
                color: "#c0c0c0"
            }

            // inner line for main bar bevel
            Rectangle { 
                anchors { top: parent.top; topMargin: 1; left: parent.left; right: parent.right }
                height: 1
                color: "#808080"
            }

            // outer line for main bar bevel
            Rectangle { 
                anchors { bottom: parent.bottom; left: parent.left; right: parent.right }
               height: 1
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

                Rectangle {
                    width: 1
                    height: 18
                    color: "#45475a"
                }

                Row {
                    spacing: 2
                    anchors.verticalCenter: parent.verticalCenter

                    Repeater {
                        model: WindowManager.screenProjection(bar.screen).windowsets

                        delegate: Item {
                            required property var modelData
                            visible: modelData.shouldDisplay
                            width: workspaceLabel.implicitWidth + 18
                            height: 24

                            Rectangle {
                                anchors.fill: parent
                                radius: 0
                                color: modelData.active ? "#313244" : "transparent"
                            }

                            property bool active: modelData.active

                            // top edge of beveled button
                            Rectangle {
                                anchors { top: parent.top; left: parent.left; right: parent.right }
                                height: 1
                                color: active ? "#808080" : "#ffffff"
                            }

                            // left edge of beveled button
                            Rectangle {
                                anchors { top: parent.top; left: parent.left; bottom: parent.bottom }
                                height: 1
                                color: active ? "#808080" : "#ffffff"
                            }

                            // bottom edge of beveled button
                            Rectangle {
                                anchors { left: parent.left; right: parent.right; bottom: parent.bottom; }
                                height: 1
                                color: active ? "#ffffff" : "#000000"
                            }

                            // top edge of beveled button
                            Rectangle {
                                anchors { top: parent.top; right: parent.right; bottom: parent.bottom }
                                height: 1
                                color: active ? "#ffffff" : "#000000"
                            }

                            Text {
                                id: workspaceLabel
                                anchors.centerIn: parent
                                text: modelData.name
                                color: modelData.active ? "#89b4fa" : "#000000"
                                font.family: "MS Sans Serif"
                                font.pixelSize: 22
                                font.bold: modelData.active
                            }

                            MouseArea {
                                anchors.fill: parent
                                enabled: modelData.canActivate
                                cursorShape: Qt.PointingHandCursor
                                onClicked: modelData.activate()
                            }
                        }
                    }
                }
            }

            SystemClock {
                id: clock
                precision: SystemClock.Seconds
            }

            Row {
                anchors {
                    right: parent.right
                    rightMargin: 22
                    verticalCenter: parent.verticalCenter
                }
                spacing: 10

                // date and time
                Text {
                    text: Qt.formatDateTime(clock.date, "ddd, MMM d HH:mm:ss")
                    color: "#000000"
                    font.family: "MS Sans Serif"
                    font.pixelSize: 22
                }
            }
        }
    }
}
