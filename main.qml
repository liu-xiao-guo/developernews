import QtQuick 2.0
import Ubuntu.Components 1.1
import "components"

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "com.ubuntu.developer.liu-xiao-guo.develoepernews"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    PageStack {
        id: pageStack
        anchors.fill: parent
        Component.onCompleted: {
            console.log('pagestack created')
            pageStack.push(listPage)
        }

        Page {
            id: listPage
            title: i18n.tr("Articles")

            tools: ToolbarItems {
                ToolbarButton {
                    action: reloadAction
                }
            }

            ArticleListView {
                id: articleList
                objectName: "articleList"
                anchors.fill: parent
                clip: true

                onClicked: {
                    console.log('[flat] article clicked: '+instance.title)
                    articleContent.text = instance.content
                    pageStack.push(contentPage)
                }
            }
        }

        Page {
            id: contentPage
            title: i18n.tr("Content")

            ArticleContent {
                id: articleContent
                objectName: "articleContent"
                anchors.fill: parent
            }
        }
    }

    Action {
        id: reloadAction
        text: "Reload"
        iconName: "reload"
        onTriggered: articleList.reload()
    }
}

