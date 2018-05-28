#include "fountainclient.h"
#include <QJsonObject>
#include <QJsonDocument>
#include <QTextCodec>
#include "tcppackager.h"
#include "fountainserialpackager.h"

#define readInterval 400
#define numberOfFountain 9



fountainClient::fountainClient(QObject *parent): QObject(parent), tcpSocket(new QTcpSocket(this)), m_Connected(false), m_IsFountainOnline(false), m_CurrentControllingId(""), m_Timer(new QTimer(this)), m_currentEffect(0x00), m_currentProgram(0x00), m_currentRepeat(0x00), m_currentSpeed(0x00)
{
    in.setDevice(tcpSocket);
    in.setVersion(QDataStream::Qt_5_8);

    for (int i = 0; i < numberOfFountain;i++)
    {
        m_fountainStatusHash.insert(i, false);
    }

    QObject::connect(m_Timer,&QTimer::timeout,this,&fountainClient::timeOutHandler);
    QObject::connect(tcpSocket, SIGNAL(readyRead()), this, SLOT(readyReadHandler()));
    QObject::connect(tcpSocket,&QTcpSocket::connected,[=](){
        setIsSVOnline(true);
        qDebug() << "connected";

        if(!m_IsFountainOnline)
        {
            QByteArray block;

            QDataStream out(&block, QIODevice::WriteOnly);
            out.setVersion(QDataStream::Qt_5_8);
            // check for fountain Online Status

            out << tcpPackager::requestToAddNewClient();
            qDebug() << tcpSocket->write(block);

            out <<tcpPackager::AskWhoIsControlling();
            qDebug() << tcpSocket->write(block);

        }

        m_Timer->start(readInterval);

    });

    QObject::connect(tcpSocket,&QTcpSocket::disconnected, [=](){
        setIsSVOnline(false);
        m_Timer->stop();
        emit serverOffline();
        for (int i = 0; i < numberOfFountain;i++)
        {
            m_fountainStatusHash.insert(i, false);
        }
    });

    //    QObject::connect(tcpSocket,&QTcpSocket::error, [=](){
    //       setIsSVOnline(false);
    //    });


    m_Timer->setInterval(2000);
    m_Timer->setSingleShot(false);


}

void fountainClient::connect(const QString &ip, const quint16 &port)
{

    tcpSocket->connectToHost(ip, port);
}

void fountainClient::connect()
{
    tcpSocket->connectToHost(m_ip, m_port);
}

void fountainClient::readyReadHandler()
{

    static int readCounter = 0;
    in.startTransaction();
    QByteArray result;
    in >> result;

    if(result.count() == 0)
    {
        readCounter++;
    }
    else
    {
        readCounter = 0;
        if(!m_Timer->isActive())
        m_Timer->start();
    }
    if(readCounter == 20)
    {
        m_Timer->stop();
        readCounter = 0;
    }

    if(tcpPackager::isPackageValid(result))
    {
        QJsonObject svReply = tcpPackager::packageToJson(result);

        QString theCommand = svReply["Command"].toString();

        if(theCommand == "fountainCurrentPlayingProgram")
        {
            emit svReceivedCommand();
        }
        else if (theCommand == "fountainStatus") {

            setFountainStatus(svReply["fountainId"].toInt(),svReply["Data"].toBool());
            emit fountainStatus();
        }
        else if(theCommand == "fountainResponse")
        {


           fountainSerialPackager aPackage(QByteArray::fromHex(svReply["Data"].toString().toUtf8()));

           if(aPackage.isPackageValid())
           {
                if(aPackage.getOpCode() == m_OpCode_updateCurrentStatusOfProgramSingleFountain)
                {
                    QByteArray tmpData = aPackage.getData();

                    if(tmpData.count() >=4)
                    {
                        m_currentProgram = tmpData.at(0);
                        m_currentEffect = tmpData.at(1);
                        m_currentSpeed = tmpData.at(2);
                        m_currentRepeat = tmpData.at(3);

                        emit updateCurrentProgramSingleFountain();
                    }
                }
           }

        }
        else if(theCommand == "Disconnecting")
        {

            if(svReply["ClientId"].toString() == m_CurrentControllingId)
            {
                emit currentControllingIDDisconnecting();
            }
        }
        else if(theCommand == "whoIsControlling")
        {
            m_CurrentControllingId = svReply["ClientId"].toString();
            if(svReply["ClientId"].toString() == tcpPackager::m_clientId)
            {
                // this device is not in control
                // popUp dialog to user
                // yeah, can control shit!
                // do nothing at the moment ha!
#if fountainClientDebug
                qDebug() << "whoIsControlling - yeah, you have permission baby";
#endif
                QByteArray block;

                QDataStream out(&block, QIODevice::WriteOnly);
                out.setVersion(QDataStream::Qt_5_8);
                out << tcpPackager::isFountainOnline();
                qDebug() << tcpSocket->write(block);

            }
            else
            {
                emit needToReQuestPermission();
#if fountainClientDebug
                qDebug() << "whoIsControlling - don't have permission ha -> request di";
#endif
            }

        }

    }

#if fountainClientDebug
                qDebug()<< "Reply from SV: " + result;
#endif


}

void fountainClient::sendProgram(const quint8 &BOX_ID, const QString &programName,const QByteArray &program)
{


    QByteArray block;

    QDataStream out(&block, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_8);

    out << tcpPackager::playProgram(BOX_ID, programName,program);

    tcpSocket->write(block);


}

void fountainClient::sendSpeed(const QByteArray &data)
{
    QByteArray block;

    QDataStream out(&block, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_8);

    out << tcpPackager::playSpeed(data);

    tcpSocket->write(block);
}

void fountainClient::setHostName(const QString &hostName)
{
    m_ip = hostName;
}

void fountainClient::setPort(const quint16 &port)
{

    m_port = port;
}

bool fountainClient::isSVOnline() const
{
    return m_Connected;
}

void fountainClient::setIsSVOnline(bool input)
{
    if(m_Connected != input)
    {
        m_Connected = input;
        emit isSVOnlineChanged(input);
    }

    if(!m_Connected)
    {
        setIsFountainOnline(false);
    }
}

void fountainClient::disconnect()
{
    m_Timer->stop();
    tcpSocket->close();
}

void fountainClient::sendDiconnectNotification()
{
    QByteArray block;

    QDataStream out(&block, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_8);

    out << tcpPackager::aboutToDisconnect();

    tcpSocket->write(block);

    emit sentDisconnectingNotification();
}

void fountainClient::requestPermission()
{
    QByteArray block;

    QDataStream out(&block, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_8);

    out << tcpPackager::requestToGetPermission();

    tcpSocket->write(block);
}

bool fountainClient::isFountainOnline() const
{
    return m_IsFountainOnline;
}

void fountainClient::setIsFountainOnline(bool input)
{
    if(m_IsFountainOnline != input)
    {
        m_IsFountainOnline = input;
        emit isFountainOnlineChanged(input);
    }
}

void fountainClient::timeOutHandler()
{
    readyReadHandler();
}

bool fountainClient::getFountainStatus(const int &id)
{
    return m_fountainStatusHash.value(id, false);
}

void fountainClient::setFountainStatus(const int &id, const bool &status)
{
    m_fountainStatusHash.insert(id,status);
}

int fountainClient::getCurrentProgram()
{
    return (int) m_currentProgram;
}

int fountainClient::getCurrentEffect()
{
    return (int)m_currentEffect;
}

int fountainClient::getCurrentRepeat()
{
    return (int) m_currentRepeat;
}

int fountainClient::getCurrentSpeed()
{
    return (int)m_currentSpeed;
}

void fountainClient::updateSecretKeyToFountainDevices(const QString &key)
{
    QByteArray block;

    QDataStream out(&block, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_8);

    out << tcpPackager::updateSecretKey(key);
    tcpSocket->write(block);
}

void fountainClient::setGlobalSecretKey(const QString &key)
{
    tcpPackager::setSecretKey(key.toUtf8());

    updateSecretKeyToFountainDevices(key);
}

void fountainClient::setLocalSecretKey(const QString &key)
{

    tcpPackager::setSecretKey(key.toUtf8());


}

void fountainClient::uploadFileBin(const quint8 &BOX_ID, const QString &fileURL)
{
    QByteArray block;

    QDataStream out(&block, QIODevice::WriteOnly);
    out.setVersion(QDataStream::Qt_5_8);

    out << tcpPackager::sendBinfile(BOX_ID,fileURL);

    tcpSocket->write(block);

}

