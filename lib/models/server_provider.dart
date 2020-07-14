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

  static const ProviderRole READ = ProviderRole._(0); // + start/stop streams
  // + play output, play
  // + playlist
  static const ProviderRole WRITE = ProviderRole._(1); // READ
  // + edit/copy/add/remove streams
  static const ProviderRole SUPPORT = ProviderRole._(2); // WRITE
  // + logs, pipeline
  // + connect/disconnect/activate
  static const ProviderRole ADMIN = ProviderRole._(3); // WRITE
// + add/remove providers
// + edit server
// + connect/disconnect/activate
}
