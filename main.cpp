#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "fileio.h"
#include <QQmlContext>
#include "fountainserial.h"
#include "fountainclient.h"
#include <QStandardPaths>

#include "fountainserialpackager.h"

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN) || defined(Q_OS_ANDROID)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    app.setOrganizationName("Tam Duong");
    app.setOrganizationDomain("tamduongs.com");
    app.setApplicationName("Fountain Controller");
    QQmlApplicationEngine engine;

    fountainSerial fountainProgramSerializer;
    fountainClient aClient;

    fountainSerialPackager aFountainSerialPackager;

      QQmlContext *thisContext = engine.rootContext();

    thisContext->setContextProperty("fountainProgramSerializer", &fountainProgramSerializer);
    thisContext->setContextProperty("fountainSerialPackager", &aFountainSerialPackager);
    thisContext->setContextProperty("theTcpClient", &aClient);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
