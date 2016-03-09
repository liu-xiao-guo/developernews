import QtQuick 2.0

Item {
    width: ListView.view.width
    height: units.gu(7)

    Row {
        spacing: units.gu(3)
        width: parent.width
        height: parent.height

        BorderImage {
            id: image
            property int borderLength: 2
            source: "images/rss.png"
            width: parent.height; height: parent.height
            border.left: borderLength; border.top: borderLength
            border.right: borderLength; border.bottom: borderLength
        }

        Column {
            id: right
            anchors.leftMargin: units.gu(1)
            width: parent.width - image.width - parent.spacing
            spacing: units.gu(0.2)

            Text {
                text: published
                font.pixelSize: units.gu(2)
                font.bold: true
            }

            Text {
                width: parent.width * .9
                text: {
                    if ( title.length > 35)
                        return title.substring(0, 35) + "...";
                    else
                        return title;
                }
                //                wrapMode: Text.Wrap
                clip: true
                font.pixelSize: units.gu(2)
            }
        }
    }

    Image {
        source: "images/arrow.png"
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: units.gu(0.6)
        rotation: -90
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            console.log("it is clicked");
            console.log("currentidex: " + listView.currentIndex);
            console.log("index: " + index);
            listView.currentIndex = index;
            root.clicked(model);
        }
    }

    Keys.onReturnPressed: {
        console.log("Enter is pressed!");
        listView.currentIndex = index;
        root.clicked(model);
    }
}
