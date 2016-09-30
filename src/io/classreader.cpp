#include <QDomDocument>
#include <QDir>

#include "classreader.h"


ClassReader::ClassReader(QString fileName) {
    QDomDocument doc("classes");

    QFile file(fileName);
    if (!file.open(QIODevice::ReadOnly)) {
        result.failure(QString("failed to read file at '%1'").arg(fileName));
    } else {
        if (!doc.setContent(&file)) {
            result.failure(QString("failed to parse XML"));
        }
    }
    file.close();
}

Result<QString, QList<QObject*>> ClassReader::parseClasses()
{
    // parse root <classes>
    QList<QObject*> listmodel;
    QDomElement root = doc.documentElement();
    if (root.isNull() || root.tagName() != "classes") {
        return result.failure("expected <classes> as root element.");
    }

    // parse all <class> tags
    QDomElement child = root.firstChildElement("class");
    while (!child.isNull()) {
        if (child.hasAttribute("name")) {
            listmodel.append(new DataObject(child.attribute("name"), "nowhere"));
        } else {
            return result.failure(QString("expected name property"));
        }
        child = child.nextSiblingElement("class");
    }
    if (listmodel.length() > 0) {
        return result.success(listmodel);
    } else {
        return result.failure(QString("no classes found"));
    }

}
