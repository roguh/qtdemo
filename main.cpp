#include <iostream>

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick/qquickitem.h>
#include <QtQuick/qquickview.h>

#include <qqmlengine.h>
#include <qqmlcontext.h>
#include <qqml.h>

#include "dataobject.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    QList<QObject*> listmodel;
    listmodel.append(new DataObject("Class 1", "near"));
    listmodel.append(new DataObject("Class 2", "near"));
    listmodel.append(new DataObject("Class 3", "near"));
    for (int i=0; i < 30; i++)
        listmodel.append(new DataObject("Class X", "far"));
    listmodel.append(new DataObject("Class 30", "near"));

    QQmlContext *ctxt = engine.rootContext();
    ctxt->setContextProperty("listmodel", QVariant::fromValue(listmodel));

    return app.exec();
}
