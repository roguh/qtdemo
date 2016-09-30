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
    NotificationClient *notificationClient = new NotificationClient("", "Demo Notification");

    QList<QObject*> listmodel;

    ClassReader reader("/home/hroc/dev/qt/qtdemo/samples/classes.xml");
    auto xmldoc = reader.loadXML();
    // when loaded, convert the XML into a list of DataObjects
    auto result = reader.parseClasses(xmldoc, listmodel);

    listmodel.append(new DataObject("TEST", "location"));

    // start the QML app
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/ui/main.qml")));

    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty(QLatin1String("notificationClient"), notificationClient);
    ctxt->setContextProperty(QLatin1String("listmodel"), QVariant::fromValue(listmodel));

    if (result.failed) {
        notificationClient->setNotification(result._failure);
        ctxt->setContextProperty("error", result._failure);
    } else {
        notificationClient->setNotification(
                QString("Parsed %1 classes!").arg(listmodel.length()));
        ctxt->setContextProperty("error", "All is quiet on the western front.");
    }

    return app.exec();
}
