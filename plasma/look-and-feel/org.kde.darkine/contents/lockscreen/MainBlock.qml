/*
 *   Copyright 2016 David Edmundson <davidedmundson@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.2

import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.4      //ROKIN : for style textbox,button,label

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

import "../components"

SessionManagementScreen {

    property Item mainPasswordBox: passwordBox

    //the y position that should be ensured visible when the on screen keyboard is visible
    property int visibleBoundary: mapFromItem(loginButton, 0, 0).y
    onHeightChanged: visibleBoundary = mapFromItem(loginButton, 0, 0).y + loginButton.height + units.smallSpacing
    /*
     * Login has been requested with the following username and password
     * If username field is visible, it will be taken from that, otherwise from the "name" property of the currentIndex
     */
    signal loginRequest(string password)

    function startLogin() {
        var password = passwordBox.text

        //this is partly because it looks nicer
        //but more importantly it works round a Qt bug that can trigger if the app is closed with a TextField focussed
        //See https://bugreports.qt.io/browse/QTBUG-55460
        loginButton.forceActiveFocus();
        loginRequest(password);
    }

    PlasmaComponents.TextField {
        id: passwordBox
        Layout.fillWidth: true
        //ROKIN
        style: TextFieldStyle {
            textColor: "#5e5f5e"
            selectedTextColor: "#2e2f2f"        // The highlighted text color
            selectionColor: "#8f86ba"          // The text highlight color
            placeholderTextColor:"#5e5f5e"    // When the text field is empty
            background: Rectangle {
                color: "#1a1a1a"
                radius: 2
                border.color: "#1a1a1a"
                border.width: 1
            }
        }
        placeholderText: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Password")
        focus: true
        echoMode: TextInput.Password
        inputMethodHints: Qt.ImhHiddenText | Qt.ImhSensitiveData | Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
        enabled: !authenticator.graceLocked
        revealPasswordButtonShown: true

        onAccepted: startLogin()

        //if empty and left or right is pressed change selection in user switch
        //this cannot be in keys.onLeftPressed as then it doesn't reach the password box
        Keys.onPressed: {
            if (event.key === Qt.Key_Left && !text) {
                userList.decrementCurrentIndex();
                event.accepted = true
            }
            if (event.key === Qt.Key_Right && !text) {
                userList.incrementCurrentIndex();
                event.accepted = true
            }
        }

        Connections {
            target: root
            onClearPassword: {
                passwordBox.forceActiveFocus()
                passwordBox.selectAll()
            }
        }
    }

    PlasmaComponents.Button {
        id: loginButton
        Layout.fillWidth: true
        //ROKIN
        style: ButtonStyle {
            background: Rectangle {
                border.width: control.activeFocus ? 2 : 1
                border.color: "#1a1a1a"
                radius: 2
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#282828" : "#292929" }
                    GradientStop { position: 1 ; color: control.pressed ? "#212121" : "#212121" }
                }
                //implicitWidth: 100
                implicitHeight: 25
            }
            label: Component{
                id:labelLogin
                Row{
                    anchors.left: parent.left
                    anchors.leftMargin: (parent.width - (textlogin.width + image.width))/2
                    anchors.top: parent.top
                    anchors.topMargin: 2
                    spacing: 0
                    Image{ id:image ;source: control.iconSource}
                    Label{
                        id:textlogin
                        height: 25
                        width:100
                        horizontalAlignment:Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        color: "#5e5f5e"
                        text: control.text
                    }
                }
            }
        }
        text: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Unlock")
        onClicked: startLogin()
    }
}
