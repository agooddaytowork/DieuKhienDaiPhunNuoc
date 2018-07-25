/****************************************************************************
** Meta object code from reading C++ file 'fountainserial.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.11.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../fountainserial.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'fountainserial.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.11.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_fountainSerial_t {
    QByteArrayData data[12];
    char stringdata0[133];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_fountainSerial_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_fountainSerial_t qt_meta_stringdata_fountainSerial = {
    {
QT_MOC_LITERAL(0, 0, 14), // "fountainSerial"
QT_MOC_LITERAL(1, 15, 3), // "out"
QT_MOC_LITERAL(2, 19, 0), // ""
QT_MOC_LITERAL(3, 20, 19), // "QHash<int,QVariant>"
QT_MOC_LITERAL(4, 40, 17), // "serializedProgram"
QT_MOC_LITERAL(5, 58, 11), // "programName"
QT_MOC_LITERAL(6, 70, 12), // "getGroupSync"
QT_MOC_LITERAL(7, 83, 12), // "setGroupSync"
QT_MOC_LITERAL(8, 96, 5), // "input"
QT_MOC_LITERAL(9, 102, 14), // "serializeSpeed"
QT_MOC_LITERAL(10, 117, 9), // "programNo"
QT_MOC_LITERAL(11, 127, 5) // "speed"

    },
    "fountainSerial\0out\0\0QHash<int,QVariant>\0"
    "serializedProgram\0programName\0"
    "getGroupSync\0setGroupSync\0input\0"
    "serializeSpeed\0programNo\0speed"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_fountainSerial[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       4,    1,   42,    2, 0x02 /* Public */,
       6,    0,   45,    2, 0x02 /* Public */,
       7,    1,   46,    2, 0x02 /* Public */,
       9,    2,   49,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    2,

 // methods: parameters
    QMetaType::QByteArray, QMetaType::QString,    5,
    QMetaType::Bool,
    QMetaType::Void, QMetaType::Bool,    8,
    QMetaType::QByteArray, QMetaType::Int, QMetaType::Int,   10,   11,

       0        // eod
};

void fountainSerial::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        fountainSerial *_t = static_cast<fountainSerial *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->out((*reinterpret_cast< QHash<int,QVariant>(*)>(_a[1]))); break;
        case 1: { QByteArray _r = _t->serializedProgram((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = std::move(_r); }  break;
        case 2: { bool _r = _t->getGroupSync();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->setGroupSync((*reinterpret_cast< const bool(*)>(_a[1]))); break;
        case 4: { QByteArray _r = _t->serializeSpeed((*reinterpret_cast< const int(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (fountainSerial::*)(QHash<int,QVariant> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&fountainSerial::out)) {
                *result = 0;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject fountainSerial::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_fountainSerial.data,
      qt_meta_data_fountainSerial,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *fountainSerial::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *fountainSerial::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_fountainSerial.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int fountainSerial::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void fountainSerial::out(QHash<int,QVariant> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
