import QtQuick
import QtQuick.Controls
import Quickshell
import qs.Common
import qs.Modules.Plugins
import qs.Services
import qs.Widgets

BasePill {
    id: root

    content: Component {
        Item {
            implicitWidth: root.widgetThickness - root.horizontalPadding * 2
            implicitHeight: root.widgetThickness - root.horizontalPadding * 2

            DankIcon {
                anchors.centerIn: parent
                name: SessionService.idleInhibited ? "rocket_launch" : "rocket"
                size: Theme.barIconSize(root.barThickness, -4)
                color: Theme.widgetTextColor
            }
        }
    }

    MouseArea {
        z: 1
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            SessionService.toggleIdleInhibit()
        }
    }
}
