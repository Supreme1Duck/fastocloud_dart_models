import 'package:meta/meta.dart';

enum DeviceStatus { NOT_ACTIVE, ACTIVE, BANNED }

DeviceStatus deviceStatus2Enum(int number) {
  if (number == 0) {
    return DeviceStatus.NOT_ACTIVE;
  } else if (number == 1) {
    return DeviceStatus.ACTIVE;
  }
  return DeviceStatus.BANNED;
}

int deviceStatus2int(DeviceStatus status) {
  if (status == DeviceStatus.NOT_ACTIVE) {
    return 0;
  } else if (status == DeviceStatus.ACTIVE) {
    return 1;
  }
  return 2;
}

String deviceStatus2String(DeviceStatus status) {
  if (status == DeviceStatus.NOT_ACTIVE) {
    return 'NOT ACTIVE';
  } else if (status == DeviceStatus.ACTIVE) {
    return 'ACTIVE';
  }
  return 'BANNED';
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
        status: deviceStatus2Enum(json[STATUS_FIELD]),
        createdDate: json[CREATED_DATE_FIELD]);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, NAME_FIELD: name, STATUS_FIELD: deviceStatus2int(status), CREATED_DATE_FIELD: createdDate};
  }
}
