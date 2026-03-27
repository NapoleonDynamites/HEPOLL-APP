import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 900
    height: 500
    title: "Prototype"
    color: "#ffffff"

    property color accent: "#34c9c3"
    property int timeMinutes: 99
    property int speedValue: 450
    property bool running: false
    property bool softMode: false

    Timer {
        id: countdown
        interval: 60000
        repeat: true
        running: running
        onTriggered: {
            if (timeMinutes > 0) {
                timeMinutes -= 1
            } else {
                running = false
            }
        }
    }

    Rectangle {
        id: frame
        anchors.fill: parent
        anchors.margins: 18
        color: "transparent"
        border.color: "#3a54ff"
        border.width: 2
        radius: 2
    }

    Text {
        text: "Time"
        color: "#000000"
        font.pixelSize: 14
        anchors.left: frame.left
        anchors.leftMargin: 200
        anchors.top: frame.top
        anchors.topMargin: 20
    }

    RoundButton {
        id: timeDown
        width: 64
        height: 64
        anchors.left: frame.left
        anchors.leftMargin: 70
        anchors.top: frame.top
        anchors.topMargin: 40
        text: "−"
        font.pixelSize: 28
        onClicked: timeMinutes = Math.max(0, timeMinutes - 1)
    }

    Text {
        text: timeMinutes
        color: accent
        font.pixelSize: 56
        anchors.left: timeDown.right
        anchors.leftMargin: 40
        anchors.verticalCenter: timeDown.verticalCenter
    }

    Text {
        text: "min"
        color: accent
        font.pixelSize: 14
        anchors.left: timeDown.right
        anchors.leftMargin: 92
        anchors.top: timeDown.bottom
        anchors.topMargin: 2
    }

    RoundButton {
        id: timeUp
        width: 64
        height: 64
        anchors.left: timeDown.right
        anchors.leftMargin: 170
        anchors.verticalCenter: timeDown.verticalCenter
        text: "+"
        font.pixelSize: 26
        onClicked: timeMinutes = Math.min(999, timeMinutes + 1)
    }

    Text {
        text: "Speed"
        color: "#000000"
        font.pixelSize: 14
        anchors.left: frame.left
        anchors.leftMargin: 520
        anchors.top: frame.top
        anchors.topMargin: 20
    }

    RoundButton {
        id: speedDown
        width: 64
        height: 64
        anchors.left: frame.left
        anchors.leftMargin: 470
        anchors.top: frame.top
        anchors.topMargin: 40
        text: "−"
        font.pixelSize: 28
        onClicked: speedValue = Math.max(0, speedValue - 10)
    }

    Text {
        text: speedValue
        color: accent
        font.pixelSize: 32
        anchors.left: speedDown.right
        anchors.leftMargin: 28
        anchors.top: speedDown.top
        anchors.topMargin: 6
    }

    Text {
        text: "SPEED"
        color: accent
        font.pixelSize: 14
        anchors.left: speedDown.right
        anchors.leftMargin: 32
        anchors.top: speedDown.top
        anchors.topMargin: 40
    }

    RoundButton {
        id: speedUp
        width: 64
        height: 64
        anchors.left: speedDown.right
        anchors.leftMargin: 150
        anchors.verticalCenter: speedDown.verticalCenter
        text: "+"
        font.pixelSize: 26
        onClicked: speedValue = Math.min(2000, speedValue + 10)
    }

    Button {
        id: startButton
        text: running ? "STOP" : "START"
        width: 330
        height: 110
        anchors.left: frame.left
        anchors.leftMargin: 90
        anchors.top: frame.top
        anchors.topMargin: 150
        onClicked: running = !running
        background: Rectangle {
            radius: 55
            color: "transparent"
            border.color: accent
            border.width: 2
        }
        contentItem: Text {
            text: startButton.text
            color: accent
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    RoundButton {
        id: preset1
        width: 64
        height: 64
        anchors.left: frame.left
        anchors.leftMargin: 520
        anchors.top: frame.top
        anchors.topMargin: 150
        text: "1"
        onClicked: { timeMinutes = 30; speedValue = 300 }
    }

    RoundButton {
        id: preset2
        width: 64
        height: 64
        anchors.left: preset1.right
        anchors.leftMargin: 28
        anchors.verticalCenter: preset1.verticalCenter
        text: "2"
        onClicked: { timeMinutes = 60; speedValue = 450 }
    }

    RoundButton {
        id: preset3
        width: 64
        height: 64
        anchors.left: preset2.right
        anchors.leftMargin: 28
        anchors.verticalCenter: preset2.verticalCenter
        text: "3"
        onClicked: { timeMinutes = 90; speedValue = 600 }
    }

    Button {
        id: softButton
        text: softMode ? "SOFT ON" : "SOFT"
        width: 210
        height: 70
        anchors.left: frame.left
        anchors.leftMargin: 545
        anchors.top: preset1.bottom
        anchors.topMargin: 26
        onClicked: softMode = !softMode
        background: Rectangle {
            radius: 35
            color: "transparent"
            border.color: accent
            border.width: 2
        }
        contentItem: Text {
            text: softButton.text
            color: accent
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    RoundButton {
        id: settingsButton
        width: 64
        height: 64
        anchors.right: frame.right
        anchors.rightMargin: 70
        anchors.bottom: frame.bottom
        anchors.bottomMargin: 40
        text: "\u2699"
        font.pixelSize: 26
        onClicked: console.log("Settings clicked")
    }
}
