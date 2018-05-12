import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import Qt.labs.settings 1.0
import QtQuick.Layouts 1.3

Item {
    id: root
    objectName: "FountainRunningPage"
    property int program_IDIndex: 0
    property int fountaingroupIndex: 0
    property int fountainIndex: 0

    property ListModel fountainprogram_IDModel: ListModel {}

    property int listCellHeigh: 45
    property int listCacheBuffer: 0
    property bool isModelLoaded: false

    property bool isPendingForReply: false

    Connections{
        target: theTcpClient

        onSvReceivedCommand:
        {
            if(isPendingForReply)
            {
                loadingDialog.close()
                successDialog.open()
            }

            isPendingForReply = false


        }
    }

    Component.onCompleted:
    {
        generateDefaultFountainModel()
        console.log("TESTT")

        electricalBoxGridView.model = fountainprogram_IDModel
        fountainBoxGridView.model = fountainprogram_IDModel.get(0).fountains
        operationDialogListView.model = fountainprogram_IDModel.get(0).fountains
        operationDialogCombobox.model =fountainprogram_IDModel
        lightSavingDialogComboBox.model = fountainprogram_IDModel
        motorTimeSavingDialog.model = fountainprogram_IDModel
        alignGrids()
        root.isModelLoaded = true
    }

    onWidthChanged:
    {
        alignGrids()
    }
    onHeightChanged:
    {
        alignGrids()
    }

    function openFountainOperationDialog()
    {
        fountainOperationDialog.open()
        fountainOperationDialog.operationDialogListViewModel = fountainprogram_IDModel

    }

    function openUpdateRTCDialog()
    {
        updateRTCDialogGridView.model =0
        updateRTCDialogGridView.model= fountainprogram_IDModel
        updateRTCDialog.open()
    }

    function openUpdateFountainLightSavingDialog()
    {
        updateFountainLightSavingDialog.open()
    }

    function openUpdateMotorTimeSavingDialog()
    {
        updateMotorTimeSavingDialog.open()
    }

    function alignGrids()
    {
        if(root.width >= 1200)
        {
            fountainRunningPageGridView.rows = 1
            fountainRunningPageGridView.columns = 2

            electricalBoxRec.width = root.width /2 -2.5
            electricalBoxRec.height = root.height

            electricalBoxGridView.cellHeight = (electricalBoxRec.height-25) / 3
            electricalBoxGridView.cellWidth = electricalBoxRec.width /3

            fountainBoxRec.width = root.width /2 -2.5
            fountainBoxRec.height = root.height

            fountainBoxGridView.cellHeight = (fountainBoxRec.height -25)/3
            fountainBoxGridView.cellWidth = fountainBoxRec.width /3

        }
        else
        {
            fountainRunningPageGridView.rows = 2
            fountainRunningPageGridView.columns = 1

            electricalBoxRec.width = root.width
            electricalBoxRec.height = root.height /2 -2.5

            electricalBoxGridView.cellHeight = (electricalBoxRec.height-25) / 2
            electricalBoxGridView.cellWidth = electricalBoxRec.width /3


            fountainBoxRec.width = root.width
            fountainBoxRec.height = root.height  /2 -2.5

            fountainBoxGridView.cellHeight = (fountainBoxRec.height-25) /2
            fountainBoxGridView.cellWidth = fountainBoxRec.width /3

        }
    }

    function generateDefaultFountainModel()
    {
        fountainprogram_IDModel.append([

                                           {"box_ID": 0,
                                               "box_Name": "FO1",
                                               "fountains":
                                                   [
                                                   {"fO_ID": 10,
                                                       "fO_Name": "Tất Cả Đài",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 0,
                                                       "fO_Name": "Đài 1",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 1

                                                   },
                                                   {"fO_ID": 1,
                                                       "fO_Name": "Đài 2",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 2,
                                                       "fO_Name": "Đài 3",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 3,
                                                       "fO_Name": "Đài 4",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 4,
                                                       "fO_Name": "Đài 5",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 5,
                                                       "fO_Name": "Đài 6",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   }
                                               ]

                                           },
                                           {"box_ID": 1,
                                               "box_Name": "FO2",
                                               "fountains":
                                                   [
                                                   {"fO_ID": 10,
                                                       "fO_Name": "Tất Cả Đài",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 0,
                                                       "fO_Name": "Đài 1",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 1,
                                                       "fO_Name": "Đài 2",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 2,
                                                       "fO_Name": "Đài 3",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 3,
                                                       "fO_Name": "Đài 4",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 4,
                                                       "fO_Name": "Đài 5",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   }
                                               ]

                                           },
                                           {"box_ID": 2,
                                               "box_Name": "FO3",
                                               "fountains":
                                                   [
                                                   {"fO_ID": 10,
                                                       "fO_Name": "Tất Cả Đài",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 0,
                                                       "fO_Name": "Đài 1",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 1,
                                                       "fO_Name": "Đài 2",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 2,
                                                       "fO_Name": "Đài 3",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 3,
                                                       "fO_Name": "Đài 4",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 4,
                                                       "fO_Name": "Đài 5",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 5,
                                                       "fO_Name": "Đài 6",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 6,
                                                       "fO_Name": "Đài 7",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 7,
                                                       "fO_Name": "Đài 8",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 8,
                                                       "fO_Name": "Đài 9",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   }
                                               ]

                                           },
                                           {"box_ID": 3,
                                               "box_Name": "FO4",
                                               "fountains":
                                                   [
                                                   {"fO_ID": 10,
                                                       "fO_Name": "Tất Cả Đài",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 0,
                                                       "fO_Name": "Đài 1",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 1,
                                                       "fO_Name": "Đài 2",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   }

                                               ]

                                           },
                                           {"box_ID": 4,
                                               "box_Name": "FO5",
                                               "fountains":
                                                   [
                                                   {"fO_ID": 10,
                                                       "fO_Name": "Tất Cả Đài",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 0,
                                                       "fO_Name": "Đài 1",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 1,
                                                       "fO_Name": "Đài 2",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 2,
                                                       "fO_Name": "Đài 3",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 3,
                                                       "fO_Name": "Đài 4",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 4,
                                                       "fO_Name": "Đài 5",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 5,
                                                       "fO_Name": "Đài 6",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   }
                                               ]

                                           },{"box_ID": 5,
                                               "box_Name": "FO6",
                                               "fountains":
                                                   [
                                                   {"fO_ID": 10,
                                                       "fO_Name": "Tất Cả Đài",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 0,
                                                       "fO_Name": "Đài 1",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 1,
                                                       "fO_Name": "Đài 2",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 2,
                                                       "fO_Name": "Đài 3",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 3,
                                                       "fO_Name": "Đài 4",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 4,
                                                       "fO_Name": "Đài 5",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 5,
                                                       "fO_Name": "Đài 6",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 6,
                                                       "fO_Name": "Đài 7",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 7,
                                                       "fO_Name": "Đài 8",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   }
                                               ]

                                           },{"box_ID": 6,
                                               "box_Name": "FO7",
                                               "fountains":
                                                   [
                                                   {"fO_ID": 10,
                                                       "fO_Name": "Tất Cả Đài",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 0,
                                                       "fO_Name": "Đài 1",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 1,
                                                       "fO_Name": "Đài 2",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 2,
                                                       "fO_Name": "Đài 3",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   },
                                                   {"fO_ID": 3,
                                                       "fO_Name": "Đài 4",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   }
                                               ]

                                           },
                                           {"box_ID": 7,
                                               "box_Name": "Sân Khô",
                                               "fountains":
                                                   [
                                                   {"fO_ID": 0,
                                                       "fO_Name": "Đài 1",
                                                       "program_ID": 0,
                                                       "repeat":99,
                                                       "sync": -1,
                                                       "operationMode" : 0
                                                   }
                                               ]
                                           }
                                       ])
    }

    Grid
    {
        id: fountainRunningPageGridView
        rowSpacing: 5
        columnSpacing: 5
        rows: 1
        columns:2

        anchors.fill: parent


        Rectangle
        {
            id: electricalBoxRec
            width:  parent.width/2 -2.5
            height:   parent.height
            color:  "#212121"
            z:1

            Rectangle
            {
                anchors.top: parent.top
                width: parent.width
                anchors.left: parent.left
                height: 25
                color: "#666666"

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 16
                    text: qsTr("TỦ ĐIỆN")
                    color: "white"
                }
            }

            GridView
            {
                id: electricalBoxGridView
                anchors.topMargin: 25
                anchors.fill: parent
                model: 0
                cellWidth: parent.width / 3
                cellHeight: parent.height / 2

                property int electricalBoxCellCurrentIndex: 0
                clip: true

                onElectricalBoxCellCurrentIndexChanged:
                {
                    fountainBoxGridView.fountainBoxCellCurrentIndex = -1
                }

                delegate: SwipeDelegate
                {
                    id: electricalBoxSwipeDelegate
                    width: electricalBoxGridView.cellWidth
                    height: electricalBoxGridView.cellHeight
                    property int cellIndex: index

                    Text {
                        id: electricalBoxText
                        text: qsTr(box_Name)
                        font.pixelSize: 16
                        anchors.centerIn: parent
                        color: "white"
                    }
                    background: Rectangle{
                        id: electricalBoxSwipeDelegateBackground
                        color:
                        {
                            if(parent.cellIndex == electricalBoxGridView.electricalBoxCellCurrentIndex)
                            {
                                "tomato"
                            }
                            else
                            {
                                "#212121"
                            }
                        }

                        border.color: "black"
                        border.width: 1
                    }

                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked:
                        {
                            electricalBoxGridView.electricalBoxCellCurrentIndex = parent.cellIndex
                            fountainBoxGridView.model   = fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains
                        }
                    }
                }
            }
        }

        Rectangle
        {
            id: fountainBoxRec
            width:   parent.width/2 -2.5
            height: parent.height
            color:  "#212121"
            Rectangle
            {
                anchors.top: parent.top
                width: parent.width
                anchors.left: parent.left
                height: 25
                color: "#666666"

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 16
                    text: qsTr("ĐÀI PHUN NƯỚC")
                    color: "white"
                }
            }
            GridView
            {
                id: fountainBoxGridView
                anchors.fill: parent
                anchors.topMargin: 25
                model: 0

                cellWidth: fountainBoxRec.width / 3
                cellHeight: fountainBoxRec.height / 2

                property int fountainBoxCellCurrentIndex: -1
                clip: true

                delegate: SwipeDelegate
                {
                    id: fountainBoxSwipeDelegate
                    width: fountainBoxGridView.cellWidth
                    height: fountainBoxGridView.cellHeight
                    property int cellIndex: index
                    enabled:
                    {
                        if(operationMode == 1 || operationMode == 2)
                        {
                            false
                        }
                        else
                        {
                            true
                        }
                    }


                    Text {
                        id: fountainBoxText
                        text: qsTr(fO_Name)
                        font.pixelSize: 16
                        anchors.centerIn: parent
                        color: "white"
                    }
                    Text {

                        text: {
                            if(operationMode == 0)
                            {
                                "ON"
                            }
                            else if(operationMode == 1)
                            {
                                "OFF"
                            }
                            else if(operationMode == 2)
                            {
                                "Timer"
                            }
                        }

                        font.pixelSize: 16
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 20
                        anchors.bottomMargin: 20
                        color: "white"
                        visible: fO_ID === 10 ? false : true
                    }
                    background: Rectangle{
                        id: fountainBoxDelegateBackground
                        color:
                        {
                            if(parent.cellIndex == fountainBoxGridView.fountainBoxCellCurrentIndex)
                            {
                                "tomato"
                            }

                            else if(operationMode == 1 || operationMode == 2)
                            {
                                "#3d3d3d"
                            }

                            else
                            {
                                "#212121"
                            }
                        }

                        border.color: "black"
                        border.width: 1
                    }

                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked:
                        {
                            fountainBoxGridView.fountainBoxCellCurrentIndex= parent.cellIndex
                            fountainControlDialog.titleString = fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).box_Name + "-" + fO_Name
                            fountainControlDialog.currentProgramIndex = fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.get(fountainBoxGridView.fountainBoxCellCurrentIndex).program_ID
                            fountainControlDialog.currentRepeatIndex = fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.get(fountainBoxGridView.fountainBoxCellCurrentIndex).repeat
                            fountainControlDialog.currentSyncIndex = fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.get(fountainBoxGridView.fountainBoxCellCurrentIndex).sync + 1
                            fountainControlDialog.open()
                        }
                    }
                }
            }
        }
    }

    Dialog
    {
        id: fountainControlDialog
        property bool isManual: true
        property bool sendAll: false
        property string titleString: ""
        property int currentProgramIndex: 0
        property int currentRepeatIndex: 0
        property int currentSyncIndex: 0
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4        // parent: Overlay.overlay

        focus: true
        modal: true
        title: "Điều khiển: " + titleString
        closePolicy: Popup.NoAutoClose
        //        standardButtons:Dialog.Yes | Dialog.No

        onOpened:
        {
            programComboBox.currentIndex = currentProgramIndex
            repeatCombobox.currentIndex = currentRepeatIndex
            fountainControlSyncCombobox.currentIndex = currentSyncIndex
        }

        footer: DialogButtonBox
        {

            Button {
                text: qsTr("Hủy")
                DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
            }
            Button {
                text: qsTr("Cập nhật")
                DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
            }

            Button {

                id: resetButton
                text: qsTr("Reset")
                DialogButtonBox.buttonRole: DialogButtonBox.ResetRole
            }

        }

        Grid
        {
            anchors.fill: parent
            width: 400
            height: 400
            rows: 3
            columns: 2
            // horizontalItemAlignment: Grid.AlignHCenter
            verticalItemAlignment:  Grid.AlignVCenter

            Text {

                text: qsTr("Chương Trình: ")
                color: "white"
                font.pixelSize: 16



            }
            ComboBox
            {
                id: programComboBox
                model: 100
                editable: true
                inputMethodHints:  Qt.ImhPreferNumbers

            }
            Text {

                text: qsTr("Lặp lại: ")
                color: "white"
                font.pixelSize: 16


            }
            ComboBox
            {
                id: repeatCombobox
                model: 100
                editable: true
                inputMethodHints:  Qt.ImhPreferNumbers

            }
            Text {

                text: qsTr("Đồng bộ: ")
                color: "white"
                font.pixelSize: 16


            }
            ComboBox
            {
                id: fountainControlSyncCombobox
                model: fountainSyncModel
                onCurrentTextChanged: {
                    if(currentText != "Không")
                    {
                        programComboBox.enabled = false
                        repeatCombobox.enabled = false
                        resetButton.visible = false

                    }
                    else
                    {
                        programComboBox.enabled = true
                        repeatCombobox.enabled = true
                        resetButton.visible = true
                    }
                }
            }
        }

        onAccepted:
        {

            fountainControlDialog.close()
            // write settings to programModel

            var Box_ID = electricalBoxGridView.electricalBoxCellCurrentIndex
            var FO_ID = fountainBoxGridView.fountainBoxCellCurrentIndex

            if(FO_ID === 0x00)
            {
                FO_ID = 10
            }
            else
            {
                FO_ID = FO_ID -1
            }



            if(theTcpClient.isSVOnline)
            { if(fountainControlSyncCombobox.currentText != "Không")
                {
                    theTcpClient.sendProgram("syncSingleFountain", fountainSerialPackager.setSyncModeForSingleFountainPerElectricalBox(Box_ID,FO_ID,fountainControlSyncCombobox.currentIndex-1))
                }
                else
                {
                    if(fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.get(fountainBoxGridView.fountainBoxCellCurrentIndex).sync !== -1)
                    {
                        theTcpClient.sendProgram("syncSingleFountain", fountainSerialPackager.setSyncModeForSingleFountainPerElectricalBox(Box_ID,FO_ID,0x10))
                    }
                    theTcpClient.sendProgram("controlFountain", fountainSerialPackager.runProgramOnFountainDirectly(Box_ID,FO_ID,programComboBox.currentIndex,repeatCombobox.currentIndex))
                }

                root.isPendingForReply = true
                loadingDialog.open()
            }
            else
            {

                // SV is not online, open dialog here
            }

            fountainprogram_IDModel.get(Box_ID).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"program_ID", programComboBox.currentIndex)
            fountainprogram_IDModel.get(Box_ID).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"repeat", repeatCombobox.currentIndex)
            fountainprogram_IDModel.get(Box_ID).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"sync", fountainControlSyncCombobox.currentIndex-1)

        }
        onRejected:
        {
            fountainControlDialog.close()
        }
        onReset:
        {
            console.log("RESSET")
            fountainControlDialog.close()

            // write settings to programModel
            fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"program_ID", programComboBox.currentIndex)
            fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"repeat", repeatCombobox.currentIndex)
            fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"sync", fountainControlSyncCombobox.currentIndex-1)

            if(theTcpClient.isSVOnline)
            {
                theTcpClient.sendProgram("restartProgramOnFountain", fountainSerialPackager.restartProgramOnFountain(electricalBoxGridView.electricalBoxCellCurrentIndex,fountainBoxGridView.fountainBoxCellCurrentIndex,programComboBox.currentIndex,repeatCombobox.currentIndex))
                root.isPendingForReply = true
                loadingDialog.open()
            }

        }

    }

    Dialog
    {
        id: loadingDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay

        focus: true
        modal: true
        title: "Thông báo "
        closePolicy: Popup.NoAutoClose
        standardButtons:Dialog.Cancel


        Column {
            spacing: 40
            width: parent.width

            Label {
                width: parent.width
                wrapMode: Label.Wrap
                horizontalAlignment: Qt.AlignHCenter
                text: "Gửi lệnh cho server ..."
            }


            ProgressBar {
                indeterminate: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        onRejected:
        {
            loadingDialog.close()
        }
    }

    Dialog
    {
        id: successDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay

        focus: true
        modal: true
        title: "Thông báo "
        closePolicy: Popup.NoAutoClose
        standardButtons:Dialog.Ok


        Column {
            spacing: 40
            width: parent.width

            Label {

                wrapMode: Label.Wrap
                horizontalAlignment: Qt.AlignHCenter
                text: "Cập nhật thành công !"
            }
        }

        onAccepted:
        {
            successDialog.close()
        }
    }

    Dialog
    {
        id: fountainOperationDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay

        focus: true
        modal: true
        title: "Chế độ hoạt động "
        closePolicy: Popup.NoAutoClose
        //        standardButtons:Dialog.Cancel


        property ListModel operationDialogListViewModel: ListModel {}
        footer: DialogButtonBox{

            Button {
                text: qsTr("Hủy")
                DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
            }
            Button {
                text: qsTr("Cập Nhật")
                DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
            }

        }

        onAccepted:
        {
            fountainprogram_IDModel = operationDialogListViewModel


        }
        onRejected:
        {
            fountainOperationDialog.close()
        }


        Column {
            spacing: 10
            width: 400

            ComboBox
            {
                id: operationDialogCombobox
                model: 0
                textRole: "box_Name"

                onCurrentIndexChanged:
                {
                    operationDialogListView.model = fountainprogram_IDModel.get(currentIndex).fountains
                }
            }


            ListView
            {
                id: operationDialogListView
                height: 300
                width: parent.width
                model: 0
                clip: true


                delegate: Rectangle{
                    id: operationDialogDelegate
                    width: parent.width
                    height: 50
                    color: "transparent"
                    visible: fO_Name == "Tất Cả Đài"? false:true
                    enabled: fO_Name == "Tất Cả Đài"? false:true
                    property int  fountainIndex: index
                    property int  operationDialogDelegateFountainMode: 0
                    property int  operationDialogDelegateFountainSync: 0

                    Row
                    {
                        spacing: 10
                        anchors.fill: parent
                        Text {
                            text: qsTr(fO_Name + " -")
                            font.pixelSize: 14
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {

                            text: qsTr("Mode: ")
                            color: "white"
                            font.pixelSize: 14
                            anchors.verticalCenter: parent.verticalCenter

                        }
                        ComboBox
                        {
                            id: operationModeComboxbox
                            model: fountainOperationModel
                            anchors.verticalCenter: parent.verticalCenter
                            width: 90

                            onModelChanged:
                            {

                                operationModeComboxbox.currentIndex = operationMode
                            }
                            onCurrentIndexChanged:
                            {
                                if(root.isModelLoaded)
                                {
                                    fountainOperationDialog.operationDialogListViewModel.get(operationDialogCombobox.currentIndex).fountains.setProperty(fountainIndex,"operationMode",currentIndex)
                                }
                            }

                        }

                        Text {

                            text: qsTr("Đồng bộ: ")
                            color: "white"
                            font.pixelSize: 14
                            anchors.verticalCenter: parent.verticalCenter

                        }
                        ComboBox
                        {
                            id: operationSyncCombobox
                            model: fountainSyncModel
                            width: 95
                            anchors.verticalCenter: parent.verticalCenter

                            onModelChanged:
                            {
                                operationSyncCombobox.currentIndex = sync +1
                            }

                            onCurrentIndexChanged:
                            {
                                if(root.isModelLoaded)
                                {
                                    fountainOperationDialog.operationDialogListViewModel.get(operationDialogCombobox.currentIndex).fountains.setProperty(fountainIndex,"sync",currentIndex - 1)
                                }
                            }

                        }

                    }

                }

            }
        }

    }

    Dialog
    {
        id: updateRTCDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay
        property string currentTime: Qt.formatTime(new Date(),"HH:mm:ss")
        property bool isFO1 : false
        property bool isFO2 : false
        property bool isFO3 : false
        property bool isFO4 : false
        property bool isFO5 : false
        property bool isFO6 : false
        property bool isFO7 : false
        property bool isFO8 : false


        focus: true
        modal: true
        title: "Cập nhật thời gian thực cho tủ điện "
        closePolicy: Popup.NoAutoClose
        //        standardButtons:Dialog.Cancel

        footer: DialogButtonBox{

            Button {
                text: qsTr("Hủy")
                DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
            }
            Button {
                text: qsTr("Cập Nhật")
                DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
            }

        }

        onAccepted:
        {
            if(theTcpClient.isSVOnline)
            {
                var hour = parseInt(Qt.formatTime(new Date(),"HH"))
                var minute = parseInt(Qt.formatTime(new Date(),"mm"))
                var second = parseInt(Qt.formatTime(new Date(),"ss"))

                if(isFO1)
                {
                    hour = parseInt(Qt.formatTime(new Date(),"HH"))
                    minute = parseInt(Qt.formatTime(new Date(),"mm"))
                    second = parseInt(Qt.formatTime(new Date(),"ss"))

                    theTcpClient.sendProgram("updateRTC", fountainSerialPackager.setRTCTimeForElectricalBox(0x00,hour,minute,second))
                }
                if(isFO2)
                {
                    hour = parseInt(Qt.formatTime(new Date(),"HH"))
                    minute = parseInt(Qt.formatTime(new Date(),"mm"))
                    second = parseInt(Qt.formatTime(new Date(),"ss"))

                    theTcpClient.sendProgram("updateRTC", fountainSerialPackager.setRTCTimeForElectricalBox(0x01,hour,minute,second))
                }
                if(isFO3)
                {
                    hour = parseInt(Qt.formatTime(new Date(),"HH"))
                    minute = parseInt(Qt.formatTime(new Date(),"mm"))
                    second = parseInt(Qt.formatTime(new Date(),"ss"))

                    theTcpClient.sendProgram("updateRTC", fountainSerialPackager.setRTCTimeForElectricalBox(0x02,hour,minute,second))
                }
                if(isFO4)
                {
                    hour = parseInt(Qt.formatTime(new Date(),"HH"))
                    minute = parseInt(Qt.formatTime(new Date(),"mm"))
                    second = parseInt(Qt.formatTime(new Date(),"ss"))

                    theTcpClient.sendProgram("updateRTC", fountainSerialPackager.setRTCTimeForElectricalBox(0x03,hour,minute,second))
                }
                if(isFO5)
                {
                    hour = parseInt(Qt.formatTime(new Date(),"HH"))
                    minute = parseInt(Qt.formatTime(new Date(),"mm"))
                    second = parseInt(Qt.formatTime(new Date(),"ss"))

                    theTcpClient.sendProgram("updateRTC", fountainSerialPackager.setRTCTimeForElectricalBox(0x04,hour,minute,second))
                }
                if(isFO6)
                {
                    hour = parseInt(Qt.formatTime(new Date(),"HH"))
                    minute = parseInt(Qt.formatTime(new Date(),"mm"))
                    second = parseInt(Qt.formatTime(new Date(),"ss"))

                    theTcpClient.sendProgram("updateRTC", fountainSerialPackager.setRTCTimeForElectricalBox(0x05,hour,minute,second))
                }
                if(isFO7)
                {
                    hour = parseInt(Qt.formatTime(new Date(),"HH"))
                    minute = parseInt(Qt.formatTime(new Date(),"mm"))
                    second = parseInt(Qt.formatTime(new Date(),"ss"))

                    theTcpClient.sendProgram("updateRTC", fountainSerialPackager.setRTCTimeForElectricalBox(0x06,hour,minute,second))
                }
                if(isFO8)
                {
                    hour = parseInt(Qt.formatTime(new Date(),"HH"))
                    minute = parseInt(Qt.formatTime(new Date(),"mm"))
                    second = parseInt(Qt.formatTime(new Date(),"ss"))

                    theTcpClient.sendProgram("updateRTC", fountainSerialPackager.setRTCTimeForElectricalBox(0x07,hour,minute,second))
                }

                root.isPendingForReply = true
                loadingDialog.open()
            }

            isFO1 = false; isFO2 =false; isFO3 = false; isFO4 =false; isFO5 = false; isFO6 =false; isFO7 = false; isFO8 = false



        }
        onRejected:
        {
            fountainOperationDialog.close()
        }
        Timer
        {
            id: currentTimeTimer
            repeat: true
            interval: 1000
            triggeredOnStart: true
            onTriggered:
            {
                updateRTCDialog.currentTime = Qt.formatTime(new Date(),"HH:mm:ss")
            }
            running: updateRTCDialog.opened
        }


        Column {
            spacing: 10
            width: 400


            Text {

                text: qsTr("Giờ hiện tại: ") + updateRTCDialog.currentTime
                font.pixelSize: 16
                color: "white"
            }

            Text {

                text: qsTr("Chọn Tủ điện: ")
                font.pixelSize: 16
                color: "white"
            }

            GridView
            {
                id: updateRTCDialogGridView
                height: 300
                width: parent.width
                model: 0
                clip: true

                cellWidth: 260/3
                cellHeight: parent.width /3

                delegate: SwipeDelegate
                {
                    id: updateRTCelectricalBoxDelegate
                    width: updateRTCDialogGridView.cellWidth
                    height: updateRTCDialogGridView.cellHeight
                    property bool cellSelected: false

                    Text {
                        id: updateRTCElectricBoxText
                        text: qsTr(box_Name)
                        font.pixelSize: 16
                        anchors.centerIn: parent
                        color: "white"
                    }
                    background: Rectangle{
                        id: updateRTCelectricalBoxDelegateBackGround
                        color: updateRTCelectricalBoxDelegate.cellSelected ? "tomato" : "#212121"
                        border.color: "black"
                        border.width: 1
                    }

                    MouseArea
                    {
                        anchors.fill: parent

                        onClicked:
                        {
                            updateRTCelectricalBoxDelegate.cellSelected = !updateRTCelectricalBoxDelegate.cellSelected
                            if(box_ID == 0)
                            {
                                updateRTCDialog.isFO1 = updateRTCelectricalBoxDelegate.cellSelected
                            }
                            else if(box_ID == 1)
                            {
                                updateRTCDialog.isFO2 = updateRTCelectricalBoxDelegate.cellSelected
                            }
                            else if(box_ID == 2)
                            {
                                updateRTCDialog.isFO3 = updateRTCelectricalBoxDelegate.cellSelected
                            }
                            else if(box_ID == 3)
                            {
                                updateRTCDialog.isFO4 = updateRTCelectricalBoxDelegate.cellSelected
                            }
                            else if(box_ID == 4)
                            {
                                updateRTCDialog.isFO5 = updateRTCelectricalBoxDelegate.cellSelected
                            }
                            else if(box_ID == 5)
                            {
                                updateRTCDialog.isFO6 = updateRTCelectricalBoxDelegate.cellSelected
                            }
                            else if(box_ID == 6)
                            {
                                updateRTCDialog.isFO7 = updateRTCelectricalBoxDelegate.cellSelected
                            }
                            else if(box_ID == 7)
                            {
                                updateRTCDialog.isFO8 = updateRTCelectricalBoxDelegate.cellSelected
                            }

                        }
                    }
                }
            }
        }

    }

    Dialog
    {
        id: updateFountainLightSavingDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay
        focus: true
        modal: true
        title: "Hẹn giờ tắt/mở đèn"
        closePolicy: Popup.NoAutoClose
        //        standardButtons:Dialog.Cancel

        footer: DialogButtonBox{

            Button {
                text: qsTr("Hủy")
                DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
            }
            Button {
                text: qsTr("Cập Nhật")
                DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
            }

        }

        onAccepted:
        {
            if(theTcpClient.isSVOnline)
            {
                theTcpClient.sendProgram("LightSavingTimer", fountainSerialPackager.setLightSavingTimeForElctricalbox(lightSavingDialogComboBox.currentIndex,lightSavingOnHourComboBox.currentIndex,lightSavingOnMinuteComboBox.currentIndex,lightSavingOffHourComboBox.currentIndex,lightSavingOffMinuteComboBox.currentIndex))
                root.isPendingForReply = true
                loadingDialog.open()
            }
        }
        onRejected:
        {
            updateFountainLightSavingDialog.close()
        }


        Column {
            spacing: 10
            width: 400
            ComboBox
            {
                id: lightSavingDialogComboBox
                model: 0
                textRole: "box_Name"

            }

            Text {

                text: qsTr("Giờ mở: ")
                font.pixelSize: 16
                color: "white"
            }

            Row
            {
                spacing: 5

                ComboBox
                {
                    id: lightSavingOnHourComboBox
                    model: 24
                }
                Text {

                    text: qsTr("giờ ")
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                }

                ComboBox
                {
                    id: lightSavingOnMinuteComboBox
                    model: 60
                }
                Text {

                    text: qsTr("phút")
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Text {

                text: qsTr("Giờ tắt: ")
                font.pixelSize: 16
                color: "white"
            }
            Row
            {
                spacing: 5

                ComboBox
                {
                    id: lightSavingOffHourComboBox
                    model: 24
                }
                Text {

                    text: qsTr("giờ ")
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                }

                ComboBox
                {
                    id: lightSavingOffMinuteComboBox
                    model: 60
                }
                Text {

                    text: qsTr("phút")
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

    }

    Dialog
    {
        id: updateMotorTimeSavingDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 4
        // parent: Overlay.overlay
        focus: true
        modal: true
        title: "Hẹn giờ tắt/mở motor"
        closePolicy: Popup.NoAutoClose
        //        standardButtons:Dialog.Cancel

        property bool isCa1: true
        property int  ca1OnHour: 0
        property int  ca1OnMinute: 0
        property int  ca2OnHour: 0
        property int  ca2OnMinute: 0
        property int  ca1OFFHour: 0
        property int  ca1FFMinute: 0
        property int  ca2OFFHour: 0
        property int  ca2OFFMinute: 0
        footer: DialogButtonBox{

            Button {
                text: qsTr("Hủy")
                DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
            }
            Button {
                text: qsTr("Cập Nhật")
                DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
            }

        }

        onAccepted:
        {
            if(theTcpClient.isSVOnline)
            {
                theTcpClient.sendProgram("motorTimeSaving", fountainSerialPackager.setMotorSavingTimeForElectricalBox(motorTimeSavingDialog.currentIndex, ca1OnHour,ca1OnMinute,ca1OFFHour,ca1FFMinute,ca2OnHour,ca2OnMinute,ca2OFFHour,ca2OFFMinute))
            }
        }
        onRejected:
        {
            updateMotorTimeSavingDialog.close()
        }


        Column {
            spacing: 10
            width: 400

            ComboBox
            {
                id: motorTimeSavingDialog
                model: 0
                textRole: "box_Name"

            }

            TabBar {
                id: tabBar
                currentIndex: 0
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - width*2) /2

                TabButton {
                    text: "Ca 1"

                    onPressed: {
                        updateMotorTimeSavingDialog.isCa1 = true

                        motorOnHourComboBox.currentIndex = updateMotorTimeSavingDialog.ca1OnHour
                        motorOnMinuteComboBox.currentIndex = updateMotorTimeSavingDialog.ca1OnMinute

                        motorOffHourComboBox.currentIndex = updateMotorTimeSavingDialog.ca1OFFHour
                        motorOffMinuteComboBox.currentIndex = updateMotorTimeSavingDialog.ca1FFMinute

                    }
                }
                TabButton {
                    text: "Ca 2"

                    onPressed: {
                        updateMotorTimeSavingDialog.isCa1 = false

                        motorOnHourComboBox.currentIndex = updateMotorTimeSavingDialog.ca2OnHour
                        motorOnMinuteComboBox.currentIndex = updateMotorTimeSavingDialog.ca2OnMinute

                        motorOffHourComboBox.currentIndex = updateMotorTimeSavingDialog.ca2OFFHour
                        motorOffMinuteComboBox.currentIndex = updateMotorTimeSavingDialog.ca2OFFMinute
                    }
                }
            }
            Text {

                text: qsTr("Giờ mở: ")
                font.pixelSize: 16
                color: "white"
            }

            Row
            {
                spacing: 5

                ComboBox
                {
                    id: motorOnHourComboBox
                    model: 24
                    onCurrentIndexChanged:
                    {
                        if (updateMotorTimeSavingDialog.isCa1)
                        {
                            updateMotorTimeSavingDialog.ca1OnHour = currentIndex
                        }
                        else
                        {
                            updateMotorTimeSavingDialog.ca2OnHour = currentIndex
                        }
                    }
                }
                Text {

                    text: qsTr("giờ ")
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                }

                ComboBox
                {
                    id: motorOnMinuteComboBox
                    model: 60
                    onCurrentIndexChanged:
                    {
                        if (updateMotorTimeSavingDialog.isCa1)
                        {
                            updateMotorTimeSavingDialog.ca1OnMinute = currentIndex
                        }
                        else
                        {
                            updateMotorTimeSavingDialog.ca2OnMinute = currentIndex
                        }
                    }
                }
                Text {


                    text: qsTr("phút")
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Text {

                text: qsTr("Giờ tắt: ")
                font.pixelSize: 16
                color: "white"
            }
            Row
            {
                spacing: 5

                ComboBox
                {
                    id: motorOffHourComboBox
                    model: 24
                    onCurrentIndexChanged:
                    {
                        if (updateMotorTimeSavingDialog.isCa1)
                        {
                            updateMotorTimeSavingDialog.ca1OFFHour = currentIndex
                        }
                        else
                        {
                            updateMotorTimeSavingDialog.ca2OFFHour = currentIndex
                        }
                    }
                }
                Text {

                    text: qsTr("giờ ")
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                }

                ComboBox
                {
                    id: motorOffMinuteComboBox
                    model: 60

                    onCurrentIndexChanged:
                    {
                        if (updateMotorTimeSavingDialog.isCa1)
                        {
                            updateMotorTimeSavingDialog.ca1FFMinute = currentIndex
                        }
                        else
                        {
                            updateMotorTimeSavingDialog.ca2OFFMinute = currentIndex
                        }
                    }
                }
                Text {

                    text: qsTr("phút")
                    font.pixelSize: 16
                    color: "white"
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

    }


    Timer
    {
        id: errorTimer
        interval: 60000
        repeat: false
        triggeredOnStart: false

        onTriggered:
        {
            loadingDialog.close()
        }
    }

    ListModel {
        id: fountainSyncModel
        ListElement { text: "Không" }
        ListElement { text: "đài 1" }
        ListElement { text: "đài 2" }
        ListElement { text: "đài 3" }
        ListElement { text: "đài 4" }
        ListElement { text: "đài 5" }
        ListElement { text: "đài 6" }
        ListElement { text: "đài 7" }
        ListElement { text: "đài 8" }
        ListElement { text: "đài 9" }
    }
    ListModel {
        id: fountainOperationModel
        ListElement { text: "ON" }
        ListElement { text: "OFF" }
        ListElement { text: "Timer" }
    }



}


