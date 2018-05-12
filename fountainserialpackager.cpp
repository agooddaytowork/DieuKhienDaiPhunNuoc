#include "fountainserialpackager.h"

fountainSerialPackager::fountainSerialPackager(QObject * parent): QObject(parent), m_OperationCode(0x00), m_PackageLength(0x00), m_BoxID(0x00), m_FOID(0x00), m_ProgramID(0x00),m_Repeat(0x00)
{
    m_Data.clear();
}

fountainSerialPackager &fountainSerialPackager::setOpcode(const quint8 &opcode)
{
    m_OperationCode = opcode;
     return *this;
}

fountainSerialPackager &fountainSerialPackager::setData(const QByteArray &data)
{
    m_Data.append(data);
     return *this;
}
fountainSerialPackager &fountainSerialPackager::setData(const quint8 &data)
{
    m_Data.append(data);
     return *this;
}

fountainSerialPackager &fountainSerialPackager::setPackageLength()
{
    m_PackageLength = (quint16) m_Data.count() + 4; // DAMMMMMMMMMM
     return *this;
}

QByteArray fountainSerialPackager::generateSerialPackage()
{
    QByteArray package;
    package.append(m_startFlag);
    package.append(m_OperationCode);
    package.append(m_PackageLength >> 8);
    package.append(m_PackageLength);
    package.append(m_Data);
    package.append(m_stopFlag);
    return package;
}


QByteArray fountainSerialPackager::generateSerialPackage(const quint8 &opcode, const QByteArray &data)
{
    setOpcode(opcode);
    setData(data);
    setPackageLength();
    return generateSerialPackage();
}

fountainSerialPackager &fountainSerialPackager::setBoxID(const quint8 &boxID)
{
    m_BoxID = boxID;
    m_Data.append(m_BoxID);
     return *this;
}

fountainSerialPackager &fountainSerialPackager::setFOID(const quint8 &fOID)
{
    m_FOID = fOID;
    m_Data.append(m_FOID);
     return *this;
}

fountainSerialPackager &fountainSerialPackager::setRepeat(const quint8 &repeat)
{
    m_Repeat = repeat;
    m_Data.append(m_Repeat);
     return *this;
}

fountainSerialPackager &fountainSerialPackager::setProgramID(const quint8 &programID)
{

    m_ProgramID = programID;
    m_Data.append(m_ProgramID);
     return *this;
}

fountainSerialPackager &fountainSerialPackager::setHour(const quint8 &hour)
{
    m_Data.append(hour);
    return *this;
}

fountainSerialPackager &fountainSerialPackager::setMinute(const quint8 &minute)
{
    m_Data.append(minute);
    return *this;
}

fountainSerialPackager &fountainSerialPackager::setSecond(const quint8 &second)
{

    m_Data.append(second);
    return *this;
}


QByteArray fountainSerialPackager::runProgramOnFountainDirectly(const quint8 &Box_ID, const quint8 &FO_ID, const quint8 &programID, const quint8 &repeat)
{
    fountainSerialPackager aPackage;
    return aPackage.setOpcode(m_OpCode_runProgramOnFountainDirecly).setBoxID(Box_ID).setFOID(FO_ID).setProgramID(programID).setRepeat(repeat).setPackageLength().generateSerialPackage();

}

QByteArray fountainSerialPackager::restartProgramOnFountain(const quint8 &Box_ID, const quint8 &FO_ID, const quint8 &programID)
{
    fountainSerialPackager aPackage;
    return aPackage.setOpcode(m_OpCode_restartProgramOnFountain).setBoxID(Box_ID).setFOID(FO_ID).setProgramID(programID).setRepeat(0x99).setPackageLength().generateSerialPackage();
}


QByteArray fountainSerialPackager::setRTCTimeForElectricalBox(const quint8 &Box_ID, const quint8 &hour, const quint8 &minute, const quint8 &second)
{
    fountainSerialPackager aPackage;

    return aPackage.setOpcode(m_OpCode_setRTCOnElectricalBox).setBoxID(Box_ID).setHour(hour).setMinute(minute).setSecond(second).setPackageLength().generateSerialPackage();
}

QByteArray fountainSerialPackager::setLightSavingTimeForElctricalbox(const quint8 &Box_ID, const quint8 &Onhour, const quint8 &Onminute, const quint8 &OffHour, const quint8 &OffMinute)
{
    fountainSerialPackager aPackage;

    return aPackage.setOpcode(m_OpCode_setLightSavingTimer).setBoxID(Box_ID).setFOID(0x00).setHour(Onhour).setMinute(Onminute).setHour(OffHour).setMinute(OffMinute).setPackageLength().generateSerialPackage();
}

QByteArray fountainSerialPackager::setMotorSavingTimeForElectricalBox(const quint8 &Box_ID, const quint8 &Onhour1, const quint8 &Onminute1, const quint8 &OffHour1, const quint8 &OffMinute1, const quint8 &Onhour2, const quint8 &Onminute2, const quint8 &OffHour2, const quint8 &OffMinute2)
{
    fountainSerialPackager aPackage;

    return aPackage.setOpcode(m_OpCode_setMotorSavingtimer).setBoxID(Box_ID).setFOID(0x00).setHour(Onhour1).setMinute(Onminute1).setHour(OffHour1).setMinute(OffMinute1).setHour(Onhour2).setMinute(Onminute2).setHour(OffHour2).setMinute(OffMinute2).setPackageLength().generateSerialPackage();

}

QByteArray fountainSerialPackager::setSyncModeForFountainsPerElectricalBox(const quint8 &Box_ID, const QByteArray &syncMode)
{
    fountainSerialPackager aPackage;
    return aPackage.setOpcode(m_OpCode_setSyncModeOfallFountainsPerElectricalBox).setBoxID(Box_ID).setData(syncMode).setPackageLength().generateSerialPackage();
}

QByteArray fountainSerialPackager::setOperationModeFountainsPerElectricalBOx(const quint8 &Box_ID, const QByteArray &operationMode)
{
    fountainSerialPackager aPackage;
    return aPackage.setOpcode(m_OpCode_setOperationModeOfAllFountainPerElectricalBox).setBoxID(Box_ID).setData(operationMode).setPackageLength().generateSerialPackage();
}

QByteArray fountainSerialPackager::setSpeedSingleProgramPerFountain(const quint8 &Box_ID, const quint8 &FO_ID, const quint8 &Program_ID, const quint8 &speed)
{
    fountainSerialPackager aPackage;
    return aPackage.setOpcode(m_OpCode_setSpeedSingleProgramSingleFountain).setBoxID(Box_ID).setFOID(FO_ID).setProgramID(Program_ID).setData(speed).setPackageLength().generateSerialPackage();
}

QByteArray fountainSerialPackager::setSpeedAllProgramsPerFountain(const quint8 &Box_ID, const quint8 &FO_ID, const QByteArray &speeds)
{
    fountainSerialPackager aPackage;

    return aPackage.setOpcode(m_OPCode_setSpeedAllProgramsSingleFountain).setBoxID(Box_ID).setFOID(FO_ID).setProgramID(0x00).setData(speeds).setPackageLength().generateSerialPackage();
}
