/****************************************************************************
** Meta object code from reading C++ file 'fountainclient.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.10.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../fountainclient.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'fountainclient.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.10.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_fountainClient_t {
    QByteArrayData data[24];
    char stringdata0[338];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_fountainClient_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_fountainClient_t qt_meta_stringdata_fountainClient = {
    {
QT_MOC_LITERAL(0, 0, 14), // "fountainClient"
QT_MOC_LITERAL(1, 15, 17), // "isSVOnlineChanged"
QT_MOC_LITERAL(2, 33, 0), // ""
QT_MOC_LITERAL(3, 34, 23), // "isFountainOnlineChanged"
QT_MOC_LITERAL(4, 58, 23), // "needToReQuestPermission"
QT_MOC_LITERAL(5, 82, 33), // "currentControllingIDDisconnec..."
QT_MOC_LITERAL(6, 116, 29), // "sentDisconnectingNotification"
QT_MOC_LITERAL(7, 146, 16), // "readyReadHandler"
QT_MOC_LITERAL(8, 163, 7), // "connect"
QT_MOC_LITERAL(9, 171, 2), // "ip"
QT_MOC_LITERAL(10, 174, 4), // "port"
QT_MOC_LITERAL(11, 179, 11), // "sendProgram"
QT_MOC_LITERAL(12, 191, 11), // "programName"
QT_MOC_LITERAL(13, 203, 7), // "program"
QT_MOC_LITERAL(14, 211, 9), // "sendSpeed"
QT_MOC_LITERAL(15, 221, 4), // "data"
QT_MOC_LITERAL(16, 226, 11), // "setHostName"
QT_MOC_LITERAL(17, 238, 8), // "hostName"
QT_MOC_LITERAL(18, 247, 7), // "setPort"
QT_MOC_LITERAL(19, 255, 10), // "disconnect"
QT_MOC_LITERAL(20, 266, 25), // "sendDiconnectNotification"
QT_MOC_LITERAL(21, 292, 17), // "requestPermission"
QT_MOC_LITERAL(22, 310, 10), // "isSVOnline"
QT_MOC_LITERAL(23, 321, 16) // "isFountainOnline"

    },
    "fountainClient\0isSVOnlineChanged\0\0"
    "isFountainOnlineChanged\0needToReQuestPermission\0"
    "currentControllingIDDisconnecting\0"
    "sentDisconnectingNotification\0"
    "readyReadHandler\0connect\0ip\0port\0"
    "sendProgram\0programName\0program\0"
    "sendSpeed\0data\0setHostName\0hostName\0"
    "setPort\0disconnect\0sendDiconnectNotification\0"
    "requestPermission\0isSVOnline\0"
    "isFountainOnline"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_fountainClient[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      15,   14, // methods
       2,  122, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   89,    2, 0x06 /* Public */,
       3,    1,   92,    2, 0x06 /* Public */,
       4,    0,   95,    2, 0x06 /* Public */,
       5,    0,   96,    2, 0x06 /* Public */,
       6,    0,   97,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       7,    0,   98,    2, 0x08 /* Private */,

 // methods: name, argc, parameters, tag, flags
       8,    2,   99,    2, 0x02 /* Public */,
       8,    0,  104,    2, 0x02 /* Public */,
      11,    2,  105,    2, 0x02 /* Public */,
      14,    1,  110,    2, 0x02 /* Public */,
      16,    1,  113,    2, 0x02 /* Public */,
      18,    1,  116,    2, 0x02 /* Public */,
      19,    0,  119,    2, 0x02 /* Public */,
      20,    0,  120,    2, 0x02 /* Public */,
      21,    0,  121,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void, QMetaType::Bool,    2,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::UShort,    9,   10,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QByteArray,   12,   13,
    QMetaType::Void, QMetaType::QByteArray,   15,
    QMetaType::Void, QMetaType::QString,   17,
    QMetaType::Void, QMetaType::UShort,   10,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
      22, QMetaType::Bool, 0x00495103,
      23, QMetaType::Bool, 0x00495103,

 // properties: notify_signal_id
       0,
       1,

       0        // eod
};

void fountainClient::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        fountainClient *_t = static_cast<fountainClient *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->isSVOnlineChanged((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 1: _t->isFountainOnlineChanged((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->needToReQuestPermission(); break;
        case 3: _t->currentControllingIDDisconnecting(); break;
        case 4: _t->sentDisconnectingNotification(); break;
        case 5: _t->readyReadHandler(); break;
        case 6: _t->connect((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const quint16(*)>(_a[2]))); break;
        case 7: _t->connect(); break;
        case 8: _t->sendProgram((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QByteArray(*)>(_a[2]))); break;
        case 9: _t->sendSpeed((*reinterpret_cast< const QByteArray(*)>(_a[1]))); break;
        case 10: _t->setHostName((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 11: _t->setPort((*reinterpret_cast< const quint16(*)>(_a[1]))); break;
        case 12: _t->disconnect(); break;
        case 13: _t->sendDiconnectNotification(); break;
        case 14: _t->requestPermission(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (fountainClient::*_t)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&fountainClient::isSVOnlineChanged)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (fountainClient::*_t)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&fountainClient::isFountainOnlineChanged)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (fountainClient::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&fountainClient::needToReQuestPermission)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (fountainClient::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&fountainClient::currentControllingIDDisconnecting)) {
                *result = 3;
                return;
            }
        }
        {
            typedef void (fountainClient::*_t)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&fountainClient::sentDisconnectingNotification)) {
                *result = 4;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        fountainClient *_t = static_cast<fountainClient *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = _t->isSVOnline(); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->isFountainOnline(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        fountainClient *_t = static_cast<fountainClient *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setIsSVOnline(*reinterpret_cast< bool*>(_v)); break;
        case 1: _t->setIsFountainOnline(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject fountainClient::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_fountainClient.data,
      qt_meta_data_fountainClient,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *fountainClient::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *fountainClient::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_fountainClient.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int fountainClient::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 15)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 15)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 15;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void fountainClient::isSVOnlineChanged(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void fountainClient::isFountainOnlineChanged(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void fountainClient::needToReQuestPermission()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void fountainClient::currentControllingIDDisconnecting()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void fountainClient::sentDisconnectingNotification()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
