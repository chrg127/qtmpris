include(../common.pri)

TEMPLATE = lib
CONFIG -= debug_and_release
CONFIG += qt link_pkgconfig no_keywords

QT = core dbus

TARGET = $${MPRISQTLIB}

QMAKE_SUBSTITUTES = $${TARGET}.prf.in

DEFINES += MPRIS_QT_LIBRARY

use_system_dbus {
    DEFINES += USE_SYSTEM_DBUS
}

# Generate pkg-config support by default
# Note that we HAVE TO also create prl config as QMake implementation
# mixes both of them together.
CONFIG += create_pc create_prl no_install_prl

SOURCES += \
    mpris.cpp \
    mprisrootadaptor.cpp \
    mprisplayeradaptor.cpp \
    mprisplayer.cpp \
    mpriscontroller.cpp \
    mprismanager.cpp \
    mprisplayerinterface.cpp \
    mprisrootinterface.cpp \
    dbusextendedabstractinterface.cpp \
    dbusextendedpendingcallwatcher.cpp

HEADERS += \
    mprisqt.h \
    mpris.h \
    mprisplayer.h \
    mprisplayer_p.h \
    mpriscontroller.h \
    mpriscontroller_p.h \
    mprismanager.h \
    dbusextended.h \
    dbusextendedabstractinterface.h \
    dbusextendedpendingcallwatcher_p.h

INSTALL_HEADERS = \
    Mpris \
    MprisPlayer \
    MprisController \
    MprisManager \
    mprisqt.h \
    mpris.h \
    mprisplayer.h \
    mpriscontroller.h \
    mprismanager.h

OTHER_FILES += org.mpris.MediaPlayer2.xml \
    org.mpris.MediaPlayer2.Player.xml

target.path = $$[QT_INSTALL_LIBS]
headers.path = $$[QT_INSTALL_HEADERS]/MprisQt

headers.files = $$INSTALL_HEADERS
prf.files = $${TARGET}.prf
prf.path = $$[QMAKE_MKSPECS]/features
INSTALLS += target headers prf

QMAKE_PKGCONFIG_NAME = MprisQt
QMAKE_PKGCONFIG_DESCRIPTION = MPRIS library using Qt5
QMAKE_PKGCONFIG_VERSION = 1.0.1
QMAKE_PKGCONFIG_REQUIRES = Qt5Core Qt5DBus
QMAKE_PKGCONFIG_LIBDIR = $$target.path
QMAKE_PKGCONFIG_INCDIR = $$headers.path
QMAKE_PKGCONFIG_DESTDIR = pkgconfig
