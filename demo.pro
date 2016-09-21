QT += qml quick

# Android specific libraries
android{
QT += androidextras
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources
}


CONFIG += c++11

SOURCES += main.cpp \
    dataobject.cpp \
    notificationclient.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    dataobject.h \
    notificationclient.h

DISTFILES += \
    android-sources/AndroidManifest.xml \
    android-sources/src/org/qtproject/example/demo/NotificationClient.java \
    android-sources/res/drawable-ldpi/icon.png
