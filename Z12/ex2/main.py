"""
Документация: https://doc.qt.io/qtforpython-6/tutorials/basictutorial/translations.html

Команды для организации и запуска примера:
pyside6-lupdate view.qml -ts translations/my-localization-ru.ts
pyside6-lrelease translations/my-localization-ru.ts -qm translations/my-localization-ru.qm
pyside6-rcc localization.qrc -o rc_translations.py
LANG=ru python main.py
"""
import sys
import rc_translations
from pathlib import Path

from PySide6.QtCore import QTranslator, QLocale
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    translator = QTranslator(app)
    path = ':/translations'
    if translator.load(QLocale.system(), 'my-localization', '-', path):
        app.installTranslator(translator)
    engine = QQmlApplicationEngine()
    qml_file = Path(__file__).parent / 'view.qml'
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    exit_code = app.exec()
    del engine
    sys.exit(exit_code)