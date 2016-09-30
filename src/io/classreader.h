#ifndef CLASSREADER_H
#define CLASSREADER_H

#include <QDomDocument>
#include "../model/dataobject.h"

// A result represents either a failure or a success
template<typename A, typename B>
class Result {
public:
    A _failure;
    B _success;
    bool failed = false;
    Result(A f) : _failure(f) {}
    Result<A, B> failure(A f) {
        _failure = f;
        failed = true;
        return *this;
    }
    Result<A, B> success(B s) {
        _success = s;
        failed = false;
        return *this;
    }
};

class ClassReader {
public:
    QString _fileName;

    ClassReader(QString fileName);

    Result<QString, QDomDocument> loadXML();

    Result<QString, QList<QObject*>> parseClasses(Result<QString, QDomDocument>,
        QList<QObject*>& listmodel);
};

#endif // CLASSREADER_H
