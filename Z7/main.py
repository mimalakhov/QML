import sys
from pathlib import Path

from PySide6.QtCore import QObject, Slot, Signal, Property
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QmlElement

QML_IMPORT_NAME = "myModule"
QML_IMPORT_MAJOR_VERSION = 1


@QmlElement
class MyCounter(QObject):
    counterChanged = Signal()

    def __init__(self):
        QObject.__init__(self)
        self.my_counter = 0
        self.counterChanged.emit()

    def setCounter(self, number):
        self.my_counter = number
        self.counterChanged.emit()

    def getCounter(self):
        return self.my_counter

    @Slot()
    def inc(self):
        self.my_counter += 1
        self.counterChanged.emit()

    @Slot()
    def zero(self):
        self.my_counter = 0
        self.counterChanged.emit()

    counter = Property(int, getCounter, setCounter, inc, zero, notify=counterChanged)

    @Slot()
    def printCounter(self):
        print(self.my_counter)


@QmlElement
class MyListString(QObject):
    listChanged = Signal()

    def __init__(self):
        QObject.__init__(self)
        self.my_list = []
        self.listChanged.emit()

    def setList(self, list : list):
        self.my_list = list
        self.listChanged.emit()
    
    def getList(self):
        return self.my_list

    @Slot(str)    
    def add_to_list(self, item: str):
        if len(item) != 0:
            self.my_list.append(item.lower())
            self.listChanged.emit()

    @Slot()
    def pop_from_list(self):
        if len(self.my_list) != 0:
            self.my_list.pop()
            self.listChanged.emit()

    @Slot(result=str)
    def list_to_str(self):
        if len(self.my_list) == 0:
            return ""
        result = self.my_list[0].title()
        for item in self.my_list[1:]:
            result += f", {item}"
        return result
    
    slist = Property(list, getList, setList, notify=listChanged)


if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    qml_file = Path(__file__).parent / 'view2.qml'
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
