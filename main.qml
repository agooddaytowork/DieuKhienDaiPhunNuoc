import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls.Material 2.2

ApplicationWindow {
    id: window
    visible: true
    width: 1200
    height: 600
    title: qsTr("FountainController")

    property bool aboutToclose: false


    onClosing:
    {
        if(theTcpClient.isSVOnline)
        {
            window.aboutToclose = true
            close.accepted = false
            theTcpClient.sendDiconnectNotification()
            askForQuitApplicationDialog.open()

        }

    }

    Connections
    {
        target: theTcpClient
        onNeedToReQuestPermission:
        {
            if(!getPermissionDialog.opened)
            {
                if(!window.aboutToclose)
                {
                    getPermissionDialog.open()
                }
            }

        }

        onCurrentControllingIDDisconnecting:
        {
            if(appSetting.mainController)
            {
                getPermissionDialog.close()
                theTcpClient.requestPermission()
            }
        }
        onSentDisconnectingNotification:
        {

        }

        onServerOffline:
        {
            stackView.currentItem.resetElectricalBoxStatus()
        }


    }

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        Row{
            //            anchors.fill: parent
            //            anchors.top: parent.top
            //            anchors.left: parent.left
            //            width: 500
            anchors.fill: parent
            //            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            spacing: 10
            ToolButton {
                id: toolButton
                implicitHeight: 50
                text:   ">>"
                font.pixelSize: Qt.application.font.pixelSize * 1.7
                anchors.verticalCenter: parent.verticalCenter

                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    width: 300
                    transformOrigin: Menu.TopRight

                    //                    MenuItem {
                    //                        text: "Setup/Manual Mode"
                    //                        font.pixelSize: 16
                    //                        onTriggered: {
                    //                            stackView.push(Qt.resolvedUrl("SetupModePage.qml")/*, {"fountainProgramModel": testModel}*/)

                    //                        }

                    //                    }
                    //                    MenuItem {
                    //                        text: "Auto Mode"
                    //                        font.pixelSize: 16
                    //                        onTriggered:{

                    //                            stackView.push(Qt.resolvedUrl("AutoModePage.qml"))
                    //                            console.log("Auto mode page")
                    //                        }

                    //                    }

//                    MenuItem {
//                        text: "Lấy quyền điểu khiển"
//                        font.pixelSize: 16
//                        onTriggered:{
//                            theTcpClient.requestPermission()
//                        }

//                    }

                    MenuItem {
                        text: "Chỉnh chế độ hoạt động đài phun"
                        font.pixelSize: 16
                        onTriggered:{
                            stackView.currentItem.openFountainOperationDialog()
                        }

                    }

                    MenuItem {
                        text: "Cập nhật thời gian thực cho tủ điện"
                        font.pixelSize: 16
                        onTriggered:{

                            stackView.currentItem.openUpdateRTCDialog()
                        }

                    }

                    MenuItem {
                        text: "Hẹn giờ tắt/mở đèn"
                        font.pixelSize: 16
                        onTriggered:{
                            stackView.currentItem.openUpdateFountainLightSavingDialog()
                        }

                    }

                    MenuItem {
                        text: "Hẹn giờ tắt/mở motor"
                        font.pixelSize: 16
                        onTriggered:{
                            stackView.currentItem.openUpdateMotorTimeSavingDialog()
                        }
                    }
//                    MenuItem {
//                        text: "Cập nhật mật khẩu"
//                        font.pixelSize: 16
//                        onTriggered:{
//                            theTcpClient.setLocalSecretKey("Test");
//                        }
//                    }

                    //                    MenuItem {
                    //                        text: "Chỉnh tốc độ chương trình"
                    //                        font.pixelSize: 16
                    //                        onTriggered:{
                    //                            stackView.currentItem.toggleSpeedSetupDialog()
                    //                        }
                    //                    }
                }
            }


//            Rectangle
//            {
//                width: 40
//                height: toolButton.implicitHeight
//                //  anchors.right: parent.right
//                //  anchors.rightMargin: 20
//                anchors.verticalCenter: parent.verticalCenter
//                color: serverStatusMouseArea.pressed? "tomato" : "transparent"

//                id: serverStatusIcon
//                radius: 5
//                Image
//                {
//                    id: svStatusImage
//                    anchors.centerIn: parent
//                    source: theTcpClient.isSVOnline ? "images/serverOnline.png" : "images/serverOffline.png"
//                    scale: 0.8

//                }

//                MouseArea
//                {
//                    id: serverStatusMouseArea
//                    anchors.fill: parent

//                    onClicked:
//                    {
//                        svAddresDialog.open()
//                    }

//                    pressAndHoldInterval: 3000
//                    onPressAndHold:
//                    {
//                        setMainControllerDialog.open()
//                    }
//                }

//            }

            Rectangle
            {
                width: 50
                height: toolButton.implicitHeight
                //                anchors.right: parent.right
                //                anchors.rightMargin: 40 + toolButton.implicitWidth
                anchors.verticalCenter: parent.verticalCenter
                color: fountainStatusIconMouseArea.pressed? "tomato" : "transparent"

                id: fountainStatusIcon
                Image
                {
                    anchors.centerIn: parent
                    source: theTcpClient.isSVOnline? "images/fountainOnline.png" : "images/fountainOffline.png"
                    scale: 0.7
                }

                MouseArea
                {
                    id: fountainStatusIconMouseArea
                    anchors.fill: parent
                    pressAndHoldInterval: 3000
                    onPressAndHold: {
                        setAdvanceControlModeDialog.open()
                    }
                    onClicked:
                    {
                        svAddresDialog.open()
                    }

                }
            }

            Rectangle
            {
                width: 50
                height: toolButton.implicitHeight
                //                anchors.right: parent.right
                //                anchors.rightMargin: 40 + toolButton.implicitWidth
                anchors.verticalCenter: parent.verticalCenter
                color: stackView.currentItem.operatingMode === 0 ? "tomato" : "transparent"

                id: runDirectStatusIcon
                Image
                {
                    anchors.centerIn: parent
                    source: "images/runDirect.png"
                    scale: 0.6
                }
                visible: appSetting.advanceMode

                MouseArea
                {
                    id: runDirectMouseArea
                    anchors.fill: parent

                    onClicked:
                    {
                       stackView.currentItem.operatingMode = 0
                    }
                }
            }

            Rectangle
            {
                width: 50
                height: toolButton.implicitHeight
                //                anchors.right: parent.right
                //                anchors.rightMargin: 40 + toolButton.implicitWidth
                anchors.verticalCenter: parent.verticalCenter
                color: stackView.currentItem.operatingMode === 1 ? "tomato" : "transparent"

                id: speedStatusIcon
                Image
                {
                    anchors.centerIn: parent
//                    source: initSetupModePage.setSpeedMode ? "images/speedActivated.png":"images/speed.png"
                    source:"images/speed.png"
                    scale: 0.6
                }
                visible: appSetting.advanceMode

                MouseArea
                {
                    id: speedModeMouseArea
                    anchors.fill: parent

                    onClicked:
                    {
//                        initSetupModePage.setSpeedMode = !initSetupModePage.setSpeedMode
                          stackView.currentItem.operatingMode = 1
                    }
                }
            }
            Rectangle
            {
                width: 50
                height: toolButton.implicitHeight
                //                anchors.right: parent.right
                //                anchors.rightMargin: 40 + toolButton.implicitWidth
                anchors.verticalCenter: parent.verticalCenter
                color: stackView.currentItem.operatingMode === 2 ? "tomato" : "transparent"

                id: effectModeStausIcon
                Image
                {
                    anchors.centerIn: parent
//                    source: initSetupModePage.setSpeedMode ? "images/effect.png":"images/effectActivated.png"
                     source: "images/effect.png"
                    scale: 0.6
                }
                visible: appSetting.advanceMode

                MouseArea
                {
                    id: effectModeMouseArea
                    anchors.fill: parent

                    onClicked:
                    {
//                        initSetupModePage.setSpeedMode = !initSetupModePage.setSpeedMode
                        stackView.currentItem.operatingMode = 2
                    }
                }
            }

        }

    }


    StackView {
        id: stackView

        initialItem: FountainRunningPage
        {
            id: initSetupModePage
        }

        anchors.fill: parent
    }

    Dialog {
        id: inputDialog

        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay

        focus: true
        modal: true
        title: "Input"
        standardButtons: Dialog.Ok | Dialog.Cancel

        ColumnLayout {
            spacing: 20
            anchors.fill: parent
            Label {


                elide: Label.ElideRight
                text: "Please enter Program name:"
                Layout.fillWidth: true
            }
            TextField {
                id: inputDialogTextField
                focus: true
                placeholderText: "Program name"
                Layout.fillWidth: true
            }

        }

        onAccepted:
        {
            stackView.currentItem.generateDefaultProgram(inputDialogTextField.text)
        }
        onDiscarded:
        {
            inputDialogTextField.text = ""
            inputDialog.close()
        }
    }

    Dialog {
        id: svAddresDialog

        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay
        width: 300

        focus: true
        modal: true
        title: "Kết nối tới đài phun nước"
        footer: DialogButtonBox{

            Button {
                text: qsTr("Hủy")
                DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
            }
            Button {
                text: qsTr("Kết nối")
                DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
                visible: theTcpClient.isSVOnline? false: true
            }

        }




        //        {
        //            if(!theTcpClient.isSVOnline)
        //            {
        //                Dialog.Ok | Dialog.Cancel
        //            }

        //            else
        //            {
        //                Dialog.Cancel
        //            }
        //        }




        ColumnLayout {
            spacing: 20
            anchors.fill: parent


            Button{
                id: disconnectToServerButton
                text: "Ngắt kết nối tới đài phun nước"

                visible: theTcpClient.isSVOnline
                onClicked: {
                    theTcpClient.sendDiconnectNotification()
                    theTcpClient.disconnect()
                    stackView.currentItem.resetElectricalBoxStatus()

                }

            }
            //            TextField {
            //                id: svAddressDialogTextField
            //                visible: !theTcpClient.isSVOnline
            //                focus: true
            //                placeholderText:"Địa chỉ..."
            //                Layout.fillWidth: true
            //                text: appSetting.hostAddress
            //            }

        }

        onAccepted:
        {
            if(!theTcpClient.isSVOnline)
            {
                appSetting.hostAddress = "thanhduc66.com"
                //                theTcpClient.connect(svAddressDialogTextField.text, 8080)

                theTcpClient.connect("thanhduc66.com",8080)
            }

        }
        onDiscarded:
        {
            svAddresDialog.text = ""
            svAddresDialog.close()
        }
    }

    Dialog
    {
        id: getPermissionDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay

        focus: true
        modal: true
        title: "Quyền điều khiển"
        closePolicy: Popup.NoAutoClose
        standardButtons:Dialog.Yes | Dialog.No

        ColumnLayout
        {
            spacing: 20
            anchors.fill:  parent

            Label
            {
                text: "Lấy quyền điều khiển từ ...?"
            }


        }

        onAccepted:
        {
            theTcpClient.requestPermission()
        }
        onRejected:
        {

            theTcpClient.sendDiconnectNotification()
            theTcpClient.disconnect()
        }

    }

    Dialog
    {
        id: setAdvanceControlModeDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay

        focus: true
        modal: true
        title: "Chuyển sang advance mode"
        closePolicy: Popup.NoAutoClose
        standardButtons:Dialog.Yes | Dialog.No

        ColumnLayout
        {
            spacing: 20
            anchors.fill:  parent

            Label
            {
                text:
                {
                    if(appSetting.advanceMode)
                    {
                        "Bỏ chế độ advance"
                    }
                    else
                    {
                        "Cài chế độ advance"
                    }
                }
            }
        }

        onAccepted:
        {
            appSetting.advanceMode = !appSetting.advanceMode
            if(!appSetting.advanceMode)
            {
                stackView.currentItem.operatingMode = 0
            }
        }
        onRejected:
        {
            setAdvanceControlModeDialog.close()
        }
    }

    Dialog
    {
        id: askForQuitApplicationDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay

        focus: true
        modal: true
        title: "Thoát"
        closePolicy: Popup.NoAutoClose
        standardButtons:Dialog.Yes | Dialog.No

        ColumnLayout
        {
            spacing: 20
            anchors.fill:  parent

            Label
            {
                text: "Đóng chương trình?"
            }

        }

        onAccepted:
        {

            theTcpClient.disconnect()
            Qt.quit()
        }
        onRejected:
        {
            theTcpClient.connect(appSetting.hostAddress,8080)
            askForQuitApplicationDialog.close()
        }

    }
    Settings
    {
        id: appSetting
        property string hostAddress: ""
        property bool mainController: false
        property bool advanceMode: false
        property string secretKey : "fountainController"
        property string secretKeyOld : "fountainController"

    }

}
