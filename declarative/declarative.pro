include(../common.pri)

TEMPLATE = lib
CONFIG -= debug_and_release
CONFIG += qt plugin link_pkgconfig
DEPENDPATH += ../src
INCLUDEPATH += ../src

QT = core dbus qml

LIBS += -L../src -l$${MPRISQTLIB}

EXAMPLE = ../example/declarative/*

OTHER_FILES += $${EXAMPLE}

TARGET = $${MPRISQTLIB}-qml-plugin
PLUGIN_IMPORT_PATH = org/nemomobile/mpris

QMAKE_SUBSTITUTES = qmldir.in

SOURCES += \
    mprisplugin.cpp

HEADERS += \
    mprisplugin.h

target.path = $$[QT_INSTALL_QML]/$$PLUGIN_IMPORT_PATH

qml.files = qmldir plugins.qmltypes
qml.path = $$target.path
INSTALLS += target qml

qmltypes.commands = qmlplugindump -nonrelocatable org.nemomobile.mpris 1.0 > $$PWD/plugins.qmltypes
QMAKE_EXTRA_TARGETS += qmltypes
