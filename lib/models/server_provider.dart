class ProviderRole {
  final int _value;

  const ProviderRole._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'Read';
    } else if (_value == 1) {
      return 'Write';
    } else if (_value == 2) {
      return 'Support';
    }
    return 'Admin';
  }

  factory ProviderRole.fromInt(int value) {
    if (value == 0) {
      return ProviderRole.READ;
    } else if (value == 1) {
      return ProviderRole.WRITE;
    } else if (value == 2) {
      return ProviderRole.SUPPORT;
    }
    return ProviderRole.ADMIN;
  }

  static get values => [READ, WRITE, SUPPORT, ADMIN];

  static const ProviderRole READ = ProviderRole._(0);
  static const ProviderRole WRITE = ProviderRole._(1);
  static const ProviderRole SUPPORT = ProviderRole._(2);
  static const ProviderRole ADMIN = ProviderRole._(3);
}
