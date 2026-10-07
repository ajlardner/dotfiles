import QtQuick
import Quickshell
import Quickshell.WindowManager

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
            height: active ? 1 : 2
            color: active ? "#808080" : "#ffffff"
        }

        // left edge of beveled button
        Rectangle {
            anchors { left: parent.left; top: parent.top; bottom: parent.bottom }
            width: active ? 1 : 2 
            color: active ? "#808080" : "#ffffff"
        }

        // bottom edge of beveled button
        Rectangle {
            anchors { bottom: parent.bottom; right: parent.right; left: parent.left; }
            height: active ? 1 : 2 
            color: active ? "#ffffff" : "#000000"
        }

        // right edge of beveled button
        Rectangle {
            anchors { right: parent.right; top: parent.top; bottom: parent.bottom; }
            width: active ? 1 : 2
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
