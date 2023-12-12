import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import myModule
import QtQuick.Layouts
import QtQuick.LocalStorage
import "code/operations.js" as Helper
import "code/database.js" as JS

ApplicationWindow {
    id: window
    visible: true
    width: 1000
    height: 700
    title: qsTr("Переводчик")

    Translator {
        id: my_translator
    }

    TabBar {
        id: bar
        width: parent.width
        TabButton { text: qsTr("Перевести") }
        TabButton { text: qsTr("Кэш") }
    }

    StackLayout {
        id: stack
        width: parent.width
        anchors.top: bar.bottom
        anchors.topMargin: 20
        currentIndex: bar.currentIndex

        Item { 
            id: firstTab 
            Column {
                id: col
                width: stack.width / 2
                height: stack.height
                spacing: 10

                TextField {
                    id: textToTranslate
                    width: col.width
                    height: 30
                    placeholderText: "Введите строку"
                    validator: RegularExpressionValidator { regularExpression: /[a-zA-Z А-Яа-яёЁ,.!?]+/ }
                }

                ComboBox {
                    id: language
                    width:  stack.width / 2
                    model: ListModel {
                        id: model
                        ListElement { text: "Русский --> English" }
                        ListElement { text: "English --> Русский" }
                    }
                }

                Button {
                    id: btn
                    text: "Перевести"
                    width:  stack.width / 2
                    onClicked: {
                        translationsModel.clear()
                        sentenceLabel.text = ""

                        if (!Helper.checkLanguage(textToTranslate.text, language.currentIndex)) errorLabel.text = "Некорректный ввод!"
                        else { 
                            errorLabel.text = ""

                            if (Helper.checkWord(textToTranslate.text)) {
                                var list = []
                                my_translator.translate_word(textToTranslate.text, language.currentIndex)
                                for (let i = 0; i < my_translator.word_translator.length; i++) {
                                    translationsModel.append({word: my_translator.word_translator[i][0]})
                                    list.push(my_translator.word_translator[i][0])
                                }
                                JS.dbInsertWordAndTranslation(textToTranslate.text, list)
                            }
                            else {
                                my_translator.translate_sentence(textToTranslate.text, language.currentIndex)
                                sentenceLabel.text = my_translator.sentence_translator
                            }
                        }
                    }
                }

                Text {
                    id: errorLabel
                    width: parent.width
                    height: 30
                    font.pointSize: 24
                    text: ""
                    color: "red"
                }
            }

            Column {
                id: col2
                width: stack.width / 2
                height: stack.height
                anchors.left: col.right

                ListModel {
                    id: translationsModel
                }
                
                ListView {
                    id: container
                    width: 500
                    height: 350
                    spacing: 4
                    model: translationsModel
                    delegate: Rectangle {
                        width: col2.width
                        height: 20
                        color: "lightblue"
                        Text {
                            anchors.fill: parent
                            text: model.word
                        }
                    }
                }

                Text {
                    id: sentenceLabel
                    width: parent.width
                    height: 30
                    font.pointSize: 14
                    text: ""
                }

            }

            Rectangle {
                width: 1
                height: window.height
                x: window.width / 2
                color: "black"
            }

            Rectangle {
                width: window.width / 2
                height: 1
                x: window.width / 2
                y: window.height / 2
                color: "black"
            }
        }

        Item { 
            id: secondTab 
            Column {
                id: col11
                width: stack.width / 2
                height: stack.height
                spacing: 10

                Button {
                    text: "Получить данные"
                    width:  stack.width / 2
                    onClicked: {
                        dbModel.clear()
                        var list = JS.dbGetAllUUID()
                        for (let i = 0; i < list.length; i++) {
                            var translations = JS.dbGetTranslateForUUID(list[i])
                            var strTranslations = ""
                            for (let j = 0; j < translations.length; j++) {
                                strTranslations += translations[j] + ", "
                            }
                            dbModel.append({
                                word: JS.getWordByUUID(list[i]),
                                date: JS.getDateByUUID(list[i]),
                                translations: strTranslations.substring(0, strTranslations.length - 2)
                            })
                        }
                    }
                }

                Rectangle {
                    width: stack.width / 2
                    height: 30
                    color: "#f0f0f0"
                }

                Rectangle {
                    width: stack.width / 2
                    height: 30
                    color: "yellow"
                    Text {
                        anchors.centerIn: parent
                        text: "Поиск по строке"
                        font.pointSize: 14
                    }
                }

                TextField {
                    id: startString
                    width: col11.width
                    height: 30
                    placeholderText: "Введите начальную строку"
                    validator: RegularExpressionValidator { regularExpression: /[a-zA-Z А-Яа-яёЁ,.!?]+/ }
                }

                Button {
                    text: "Получить переводы по строке"
                    width:  stack.width / 2
                    onClicked: {
                        dbModel.clear()
                        var list = JS.getWordByLetter(startString.text)
                        for (let i = 0; i < list.length; i++) {
                            var translations = JS.dbGetTranslateForUUID(list[i])
                            var strTranslations = ""
                            for (let j = 0; j < translations.length; j++) {
                                strTranslations += translations[j] + ", "
                            }
                            dbModel.append({
                                word: JS.getWordByUUID(list[i]),
                                date: JS.getDateByUUID(list[i]),
                                translations: strTranslations.substring(0, strTranslations.length - 2)
                            })
                        }
                    }
                }
            }

            Column {
                id: col12
                width: stack.width / 2
                height: stack.height
                anchors.left: col11.right

                ListModel {
                    id: dbModel
                }
                
                ListView {
                    id: container1
                    width: 500
                    height: 350
                    spacing: 4
                    model: dbModel
                    delegate: Rectangle {
                        width: col12.width
                        height: 65
                        color: "lightblue"
                        Text {
                            id: textView
                            anchors.fill: parent
                            text: "Слово: " + model.word + "\nДата: " + model.date + "\nПереводы: " + model.translations
                        }
                    }
                }
                
            }

            Rectangle {
                width: 1
                height: window.height
                x: window.width / 2
                color: "black"
            }

            Component.onCompleted: {
                JS.dbInit()
            }
        }    

    }
}