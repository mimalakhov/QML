import sys
from pathlib import Path
import json
from googletrans import Translator as TS
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement
from PySide6.QtCore import QObject, Slot, Signal, Property
from PySide6.QtQuick import QQuickView

QML_IMPORT_NAME = "myModule"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
class Translator(QObject):
    wordChanged = Signal()
    sentenceChanged = Signal()
    translator = TS()

    def __init__(self):
        QObject.__init__(self)
        self.word_translated = []
        self.sentence_translated = ""
        self.wordChanged.emit()
        self.sentenceChanged.emit()

    def setWord(self, word):
        self.word_translated = word
        self.wordChanged.emit()

    def getWord(self):
        return self.word_translated
    
    def setSentence(self, sentence):
        self.sentence_translated = sentence
        self.sentenceChanged.emit()

    def getSentence(self):
        return self.sentence_translated

    @Slot(str, bool)
    def translate_word(self, word : str, rusToEng: int):
        lang = "en" if rusToEng == 0 else "ru"
        translation = self.translator.translate(word, dest=lang)
        list = translation.extra_data['possible-translations'][0][2]
        self.word_translated = list
        self.wordChanged.emit()

    @Slot(str, bool)
    def translate_sentence(self, sentence : str, rusToEng: int):
        lang = "en" if rusToEng == 0 else "ru"
        translation = self.translator.translate(sentence, dest=lang)
        self.sentence_translated = translation.text
        self.sentenceChanged.emit()

    word_translator = Property(list, getWord, setWord, translate_word, notify=wordChanged)
    sentence_translator = Property(str, getSentence, setSentence, translate_sentence, notify=sentenceChanged)


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    qml_file = 'Z14/view.qml'
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    exit_code = app.exec()
    del engine
    sys.exit(exit_code)