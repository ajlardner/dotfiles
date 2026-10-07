import QtQuick
import Quickshell

Rectangle {
    SystemClock {
       id: clock
       precision: SystemClock.Seconds
    }

    anchors {
       right: parent.right
       rightMargin: 5
       verticalCenter: parent.verticalCenter
    }

    width: 200
    height: 24
    color: "#c0c0c0"

    // sunken bevel
    Rectangle { 
       anchors { top: parent.top; left: parent.left; right: parent.right }
       height: 1
       color: "#808080"
    }
    Rectangle { 
       anchors { top: parent.top; bottom: parent.bottom; left: parent.left }
       width: 1
       color: "#808080" 
    }
    Rectangle { 
       anchors { bottom: parent.bottom; left: parent.left; right: parent.right }
       height: 1
       color: "#ffffff"
    }
    Rectangle { 
       anchors { top: parent.top; bottom: parent.bottom; right: parent.right }
       width: 1
       color: "#ffffff"
    }

    Text {
        anchors.centerIn: parent
        text: Qt.formatDateTime(clock.date, "ddd, MMM d  HH:mm:ss")
        color: "#000000"
        font.family: "MS Sans Serif"
        font.pixelSize: 18
    }
}
