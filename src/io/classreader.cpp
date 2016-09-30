#include <QDomDocument>
#include <QDir>

#include "classreader.h"


ClassReader::ClassReader(QString fileName) : _fileName(fileName)
{ }

Result<QString, QDomDocument> ClassReader::loadXML()
{
    Result<QString, QDomDocument> result(QString(""));
    QDomDocument doc("classes");

    QFile file(_fileName);
    if (!file.open(QIODevice::ReadOnly)) {
        result.failure(QString("failed to read file at '%1'").arg(_fileName));
    } else {
        if (doc.setContent(&file)) {
            result.success(doc);
        } else {
            result.failure(QString("failed to parse XML file at '%1'").arg(_fileName));
        }
    }
    file.close();
    return result;
}

Result<QString, QList<DataObject*>> ClassReader::parseClasses(Result<QString, QDomDocument> docresult,
        QList<DataObject*>& listmodel)
{
    Result<QString, QList<DataObject*>> result(QString(""));
    if (docresult.failed) {
        return result.failure(docresult._failure);
    } else {
        // parse root <classes>
        QDomElement root = docresult._success.documentElement();
        if (root.isNull() || root.tagName() != "classes") {
            return result.failure("expected <classes> as root element.");
        }

        // parse all <class> tags
        QDomElement child = root.firstChildElement("class");
        while (!child.isNull()) {
            if (child.hasAttribute("name")) {
                listmodel.append(new DataObject(child.attribute("name"), "Hardcoded Location"));
            } else {
                return result.failure(QString("expected name property"));
            }
            child = child.nextSiblingElement("class");
        }
        if (listmodel.length() > 0) {
            result.success(listmodel);
        } else {
            result.failure(QString("no classes found"));
        }
        return result;
    }
}
