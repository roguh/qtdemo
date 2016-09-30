QT += qml quick

# Android specific libraries
android{
QT += androidextras
ANDROID_PACKAGE_SOURCE_DIR = $$PWD/src/android
}


CONFIG += c++11

SOURCES += \
    src/main.cpp \
    src/model/dataobject.cpp \
    src/android-bindings/notificationclient.cpp

RESOURCES += src/qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    src/model/dataobject.h \
    src/android-bindings/notificationclient.h

DISTFILES += \
    src/android/AndroidManifest.xml \
    src/android/src/org/qtproject/example/demo/NotificationClient.java \
    src/android/res/drawable-ldpi/icon.png
