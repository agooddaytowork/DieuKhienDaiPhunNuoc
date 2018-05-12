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

    Component.onCompleted:
    {
        generateDefaultFountainModel()
        console.log("TESTT")

        electricalBoxGridView.model = fountainprogram_IDModel
        fountainBoxGridView.model = fountainprogram_IDModel.get(0).fountains
        operationDialogListView.model = fountainprogram_IDModel.get(0).fountains
        operationDialogCombobox.model =fountainprogram_IDModel
        updateRTCDialogGridView.model= fountainprogram_IDModel
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

                    }
                    else
                    {
                        programComboBox.enabled = true
                        repeatCombobox.enabled = true
                    }
                }
            }
        }

        onAccepted:
        {

            fountainControlDialog.close()

            // write settings to programModel
            fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"program_ID", programComboBox.currentIndex)
            fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"repeat", repeatCombobox.currentIndex)
            fountainprogram_IDModel.get(electricalBoxGridView.electricalBoxCellCurrentIndex).fountains.setProperty(fountainBoxGridView.fountainBoxCellCurrentIndex,"sync", fountainControlSyncCombobox.currentIndex-1)


            loadingDialog.open()

        }
        onRejected:
        {
            fountainControlDialog.close()
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

        }
        onRejected:
        {
            updateFountainLightSavingDialog.close()
        }


        Column {
            spacing: 10
            width: 400


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

        }
        onRejected:
        {
            updateMotorTimeSavingDialog.close()
        }


        Column {
            spacing: 10
            width: 400

            TabBar {
                id: tabBar
                currentIndex: 0
                anchors.left: parent.left
                anchors.leftMargin: (parent.width - width*2) /2

                TabButton {
                    text: "Ca 1"
                }
                TabButton {
                    text: "Ca 2"
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


