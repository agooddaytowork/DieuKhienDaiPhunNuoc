
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls.Material 2.2
import QtQuick.Dialogs 1.2


Item {

    property string fileURL: ""
    function open()
    {
        fileDialog.open()
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        nameFilters: ["Bin files (*.bin)"]
        selectMultiple: false
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
//            Qt.quit()
            fileURL = fileDialog.fileUrl
        }
        onRejected: {
            console.log("Canceled")
//            Qt.quit()
        }


//        Component.onCompleted: visible = true
    }
}
