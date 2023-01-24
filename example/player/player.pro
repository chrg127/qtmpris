include(../../common.pri)

TEMPLATE = app
TARGET = player
CONFIG -= debug_and_release
CONFIG += qt link_pkgconfig

QT += qml quick

DEPENDPATH += ../../src
INCLUDEPATH += ../../src
LIBS += -L../../src -l$${MPRISQTLIB}

SOURCES += \
    player.cpp

target.path = /usr/bin

INSTALLS += target
