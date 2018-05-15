#ifndef FOUNTAINCLIENT_H
#define FOUNTAINCLIENT_H

#include <QTcpSocket>
#include <QDataStream>
#include <QIODevice>
#include <QtNetwork>
#include <QTimer>

#define fountainClientDebug (1)

class fountainClient: public QObject
{

    Q_OBJECT

    Q_PROPERTY(bool isSVOnline READ isSVOnline WRITE setIsSVOnline NOTIFY isSVOnlineChanged)
    Q_PROPERTY(bool isFountainOnline READ isFountainOnline WRITE setIsFountainOnline NOTIFY isFountainOnlineChanged)

    QString m_ip;
    quint16 m_port;
    QDataStream in;


    QTcpSocket *tcpSocket = nullptr;

    bool m_Connected;
    bool m_IsFountainOnline;
    bool m_IsTimeOut;
    QString m_CurrentControllingId;

    QTimer *m_Timer;
    QHash<int, bool> m_fountainStatusHash;



public:
    fountainClient(QObject *parent = nullptr);


    Q_INVOKABLE void connect(const QString &ip, const quint16 &port);
    Q_INVOKABLE void connect();
    Q_INVOKABLE void sendProgram(const QString &programName, const QByteArray &program);
    Q_INVOKABLE void sendSpeed(const QByteArray &data);
    Q_INVOKABLE void setHostName(const QString &hostName);
    Q_INVOKABLE void setPort(const quint16 &port);
    Q_INVOKABLE void disconnect();
    Q_INVOKABLE void sendDiconnectNotification();
    Q_INVOKABLE void requestPermission();


    bool isSVOnline() const;
    void setIsSVOnline(bool input);

    bool isFountainOnline() const;
    void setIsFountainOnline(bool input);
    void setFountainStatus(const int &id, const bool &status);
    Q_INVOKABLE bool getFountainStatus(const int &id);

signals:
    void isSVOnlineChanged(bool);
    void isFountainOnlineChanged(bool);
    void needToReQuestPermission();
    void currentControllingIDDisconnecting();
    void sentDisconnectingNotification();
    void svReceivedCommand();

    void fountainStatus();
    void serverOffline();



private slots:
    void readyReadHandler();
    void timeOutHandler();


};

#endif // FOUNTAINCLIENT_H
