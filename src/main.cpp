#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>

#include "model/dataobject.h"

#include "io/classreader.h"

#include "android-bindings/notificationclient.h"

#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>


int main(int argc, char *argv[])
{
    // Register the ClassReader and NotificationClient types as QML types
    qmlRegisterType<NotificationClient>("NMT.CREU2016.NotificationClient", 1,0, "NotificationClient");
    qmlRegisterType<ClassReader>(       "NMT.CREU2016.ClassReaders", 1,0, "ClassReader");

    // start the QML app
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/ui/main.qml")));

    // QQmlContext *ctxt = engine.rootContext();
    // ctxt->setContextProperty(QLatin1String("notificationClient"), &notificationClient);

    return app.exec();
}
