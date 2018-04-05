import "components"

import QtQuick 2.0
import QtQuick.Layouts 1.2

import QtQuick.Controls 1.4             //ROKIN : for label
import QtQuick.Controls.Styles 1.4      //ROKIN : for style textbox,button,label

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

SessionManagementScreen {

    property bool showUsernamePrompt: !showUserList

    property string lastUserName

    //the y position that should be ensured visible when the on screen keyboard is visible
    property int visibleBoundary: mapFromItem(loginButton, 0, 0).y
    onHeightChanged: visibleBoundary = mapFromItem(loginButton, 0, 0).y + loginButton.height + units.smallSpacing

    signal loginRequest(string username, string password)

    onShowUsernamePromptChanged: {
        if (!showUsernamePrompt) {
            lastUserName = ""
        }
    }

    /*
    * Login has been requested with the following username and password
    * If username field is visible, it will be taken from that, otherwise from the "name" property of the currentIndex
    */
    function startLogin() {
        var username = showUsernamePrompt ? userNameInput.text : userList.selectedUser
        var password = passwordBox.text

        //this is partly because it looks nicer
        //but more importantly it works round a Qt bug that can trigger if the app is closed with a TextField focussed
        //DAVE REPORT THE FRICKING THING AND PUT A LINK
        loginButton.forceActiveFocus();
        loginRequest(username, password);
    }

    PlasmaComponents.TextField {
        id: userNameInput
        Layout.fillWidth: true

        //ROKIN (https://doc.qt.io/qt-5/qml-qtquick-controls-styles-textfieldstyle.html)
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
                //implicitWidth: 100
                //implicitHeight: 24
            }
        }
        text: lastUserName
        visible: showUsernamePrompt
        focus: showUsernamePrompt && !lastUserName //if there's a username prompt it gets focus first, otherwise password does
        placeholderText: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Username")
    }

    PlasmaComponents.TextField {
        id: passwordBox
        Layout.fillWidth: true

        //ROKIN (https://doc.qt.io/qt-5/qml-qtquick-controls-styles-textfieldstyle.html)
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
                //implicitWidth: 100
                //implicitHeight: 24
            }
        }
        placeholderText: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Password")
        focus: !showUsernamePrompt || lastUserName
        echoMode: TextInput.Password
        revealPasswordButtonShown: true

        onAccepted: startLogin()

        Keys.onEscapePressed: {
            mainStack.currentItem.forceActiveFocus();
        }

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
            target: sddm
            onLoginFailed: {
                passwordBox.selectAll()
                passwordBox.forceActiveFocus()
            }
        }
    }
    PlasmaComponents.Button {
        id: loginButton
        Layout.fillWidth: true

        //ROKIN (https://doc.qt.io/qt-5/qml-qtquick-controls-styles-buttonstyle.html)
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
        text: i18nd("plasma_lookandfeel_org.kde.lookandfeel", "Login")
        onClicked: startLogin();
    } //=> END PlasmaComponents.Button

}
