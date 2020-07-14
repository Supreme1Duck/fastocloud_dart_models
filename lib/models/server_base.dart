class ServerStatus {
  final int _value;

  const ServerStatus._(this._value);

  int toInt() {
    return _value;
  }

  String toString() {
    if (_value == 0) {
      return 'Init';
    } else if (_value == 1) {
      return 'Connected';
    }
    return 'Active';
  }

  factory ServerStatus.fromInt(int value) {
    if (value == 0) {
      return INIT;
    } else if (value == 1) {
      return CONNECTED;
    }
    return ACTIVE;
  }

  static get values => [INIT, CONNECTED, ACTIVE];

  static const ServerStatus INIT = ServerStatus._(0);
  static const ServerStatus CONNECTED = ServerStatus._(1);
  static const ServerStatus ACTIVE = ServerStatus._(2);
}

class OperationSystem {
  static const NAME_FIELD = 'name';
  static const VERSION_FIELD = 'version';
  static const ARCH_FIELD = 'arch';

  final String name;
  final String version;
  final String arch;

  OperationSystem({this.name, this.version, this.arch});

  factory OperationSystem.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final name = json[NAME_FIELD];
    final version = json[VERSION_FIELD];
    final arch = json[ARCH_FIELD];
    return OperationSystem(name: name, version: version, arch: arch);
  }

  Map<String, dynamic> toJson() {
    return {NAME_FIELD: name, VERSION_FIELD: version, ARCH_FIELD: arch};
  }
}
