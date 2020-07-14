import 'package:meta/meta.dart';

class DeviceStatus {
  final int _value;

  const DeviceStatus._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'NOT ACTIVE';
    } else if (_value == 1) {
      return 'ACTIVE';
    }
    return 'BANNED';
  }

  factory DeviceStatus.fromInt(int value) {
    if (value == 0) {
      return DeviceStatus.NOT_ACTIVE;
    } else if (value == 1) {
      return DeviceStatus.ACTIVE;
    }
    return DeviceStatus.BANNED;
  }

  static get values => [NOT_ACTIVE, ACTIVE, BANNED];

  static const DeviceStatus NOT_ACTIVE = DeviceStatus._(0);
  static const DeviceStatus ACTIVE = DeviceStatus._(1);
  static const DeviceStatus BANNED = DeviceStatus._(2);
}

class Device {
  static const ID_FIELD = 'id';
  static const NAME_FIELD = 'name';
  static const STATUS_FIELD = 'status';
  static const CREATED_DATE_FIELD = 'created_date';

  final String id;
  String name;
  DeviceStatus status;
  int createdDate;

  Device.createDefault()
      : id = null,
        name = 'Test',
        status = DeviceStatus.NOT_ACTIVE,
        createdDate = DateTime.now().millisecondsSinceEpoch;

  Device.edit({@required this.id, this.name, this.status, this.createdDate});

  Device copy() {
    return Device.edit(id: id, name: name, status: status, createdDate: createdDate);
  }

  bool isValid() {
    if (id == null) {
      return name.isNotEmpty && createdDate != 0 && status != null;
    }

    return name.isNotEmpty && createdDate != 0 && status != null;
  }

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device.edit(
        id: json[ID_FIELD],
        name: json[NAME_FIELD],
        status: DeviceStatus.fromInt(json[STATUS_FIELD]),
        createdDate: json[CREATED_DATE_FIELD]);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, NAME_FIELD: name, STATUS_FIELD: status.toInt(), CREATED_DATE_FIELD: createdDate};
  }
}
