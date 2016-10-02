#ifndef CLASSREADER_H
#define CLASSREADER_H

#include <QObject>

#include <QtNetwork>
#include <QNetworkAccessManager>

#include <QUrl>
#include <QList>
#include <QString>

class QFile;

class ClassReader : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QList<QObject*> classes READ classes WRITE setClasses NOTIFY classesChanged)
    Q_PROPERTY(QUrl url READ url WRITE setUrl NOTIFY urlChanged)

public:
    explicit ClassReader(QObject *parent = 0);
    ClassReader(const QList<QObject*> &classes, const QUrl &url, QObject *parent=0);

    void setClasses(QList<QObject*> classes);
    void setUrl(QUrl url);

    QList<QObject*> classes() const;
    QUrl url() const;

public slots:
    void startDownload();
    QVariant classesAsVariant() const;

signals:
    void classesChanged();
    void urlChanged();
    void parsingError(const QString& errorMessage);
    void networkError(const QString& errorMessage);

private slots:
    void httpFinished();
    void parseClasses();

private:
    QFile *openFileForWrite(const QString &fileName);

    QList<QObject*> m_classes;
    QUrl m_url;

    QNetworkReply *reply;
    QNetworkAccessManager networkManager;
    QFile *file;
};

#endif // CLASSREADER_H
