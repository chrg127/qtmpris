include(../../common.pri)

TEMPLATE = app
TARGET = controller
CONFIG -= debug_and_release
CONFIG += qt link_pkgconfig

QT += qml quick

DEPENDPATH += ../../src
INCLUDEPATH += ../../src
LIBS += -L../../src -l$${MPRISQTLIB}

SOURCES += \
    controller.cpp

target.path = /usr/bin

INSTALLS += target
