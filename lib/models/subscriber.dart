import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

class SubscriberStatus {
  final int _value;

  const SubscriberStatus._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'NOT ACTIVE';
    } else if (_value == 1) {
      return 'ACTIVE';
    }
    return 'DELETED';
  }

  factory SubscriberStatus.fromInt(int value) {
    if (value == 0) {
      return SubscriberStatus.NOT_ACTIVE;
    } else if (value == 1) {
      return SubscriberStatus.ACTIVE;
    }
    return SubscriberStatus.DELETED;
  }

  static get values => [NOT_ACTIVE, ACTIVE, DELETED];

  static const SubscriberStatus NOT_ACTIVE = SubscriberStatus._(0);
  static const SubscriberStatus ACTIVE = SubscriberStatus._(1);
  static const SubscriberStatus DELETED = SubscriberStatus._(2);
}

class Subscriber {
  static const ID_FIELD = 'id';
  static const EMAIL_FIELD = 'email';
  static const PASSWORD_FIELD = 'password';
  static const FIRST_NAME_FIELD = 'first_name';
  static const LAST_NAME_FIELD = 'last_name';
  static const CREATED_DATE_FIELD = 'created_date';
  static const EXP_DATE_FIELD = 'exp_date';
  static const STATUS_FIELD = 'status';
  static const MAX_DEVICE_COUNT_FIELD = 'max_devices_count';
  static const LANGUAGE_FIELD = 'language';
  static const COUNTRY_FIELD = 'country';
  static const SERVERS_FIELD = 'servers';

  final String id; // not changed
  String email;
  Optional<String> _password;
  String firstName;
  String lastName;
  int createdDate;
  int expDate;
  SubscriberStatus status;
  int maxDevicesCount;
  String language;
  String country;
  List<String> servers;

  Subscriber.create(
      {this.email,
      String password,
      this.firstName,
      this.lastName,
      this.createdDate,
      this.expDate,
      this.status,
      this.maxDevicesCount,
      this.language,
      this.country,
      this.servers})
      : id = null,
        _password = Optional<String>.fromNullable(password);

  Subscriber.createDefault()
      : id = null,
        email = '',
        firstName = '',
        lastName = '',
        _password = Optional<String>.absent(),
        createdDate = DateTime.now().millisecondsSinceEpoch,
        expDate = DateTime.now().millisecondsSinceEpoch + 3600 * 1000 * 24 * 30,
        status = SubscriberStatus.ACTIVE,
        maxDevicesCount = 10,
        servers = [];

  Subscriber.edit(
      {@required this.id,
      this.email,
      String password,
      this.firstName,
      this.lastName,
      this.createdDate,
      this.expDate,
      this.status,
      this.maxDevicesCount,
      this.language,
      this.country,
      this.servers})
      : _password = Optional<String>.fromNullable(password);

  Subscriber copy() {
    return Subscriber.edit(
        id: id,
        email: email,
        firstName: firstName,
        password: password,
        lastName: lastName,
        createdDate: createdDate,
        expDate: expDate,
        status: status,
        language: language,
        country: country,
        maxDevicesCount: maxDevicesCount,
        servers: servers);
  }

  String get password {
    return _password.orNull;
  }

  set password(String password) {
    _password = Optional<String>.fromNullable(password);
  }

  bool isValid() {
    if (id == null) {
      // create password must be
      bool isValidPassword = _password.isPresent && _password.value.isNotEmpty;
      return email.isNotEmpty &&
          isValidPassword &&
          firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          createdDate != 0 &&
          expDate != 0 &&
          language.isNotEmpty &&
          country.isNotEmpty &&
          status != null &&
          maxDevicesCount != null;
    }

    return email.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        createdDate != 0 &&
        expDate != 0 &&
        language.isNotEmpty &&
        country.isNotEmpty &&
        status != null &&
        maxDevicesCount != null;
  }

  // password field not exists in json
  factory Subscriber.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    final id = json[ID_FIELD];
    final email = json[EMAIL_FIELD];
    final firstName = json[FIRST_NAME_FIELD];
    final lastName = json[LAST_NAME_FIELD];
    final createdDate = json[CREATED_DATE_FIELD];
    final expDate = json[EXP_DATE_FIELD];
    final status = SubscriberStatus.fromInt(json[STATUS_FIELD]);
    final maxDeviceCount = json[MAX_DEVICE_COUNT_FIELD];
    final language = json[LANGUAGE_FIELD];
    final country = json[COUNTRY_FIELD];
    final List<String> servers = json[SERVERS_FIELD].cast<String>();
    String password;
    if (json.containsKey(PASSWORD_FIELD)) {
      password = json[PASSWORD_FIELD];
    }
    return Subscriber.edit(
        id: id,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        createdDate: createdDate,
        expDate: expDate,
        status: status,
        maxDevicesCount: maxDeviceCount,
        language: language,
        country: country,
        servers: servers);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      ID_FIELD: id,
      EMAIL_FIELD: email,
      FIRST_NAME_FIELD: firstName,
      LAST_NAME_FIELD: lastName,
      CREATED_DATE_FIELD: createdDate,
      EXP_DATE_FIELD: expDate,
      STATUS_FIELD: status.toInt(),
      MAX_DEVICE_COUNT_FIELD: maxDevicesCount,
      LANGUAGE_FIELD: language,
      COUNTRY_FIELD: country,
      SERVERS_FIELD: servers
    };
    if (_password.isPresent) {
      result[PASSWORD_FIELD] = _password.value;
    }
    return result;
  }
}

class OnlineSubscriber {
  static const ID_FIELD = 'id';
  static const EMAIL_FIELD = 'login'; //
  static const EXP_DATE_FIELD = 'exp_date';
  static const DEVICE_ID_FIELD = 'device_id';

  final String id; // not changed
  final String email;
  final int expDate;
  final String deviceId;

  OnlineSubscriber({@required this.id, @required this.email, @required this.expDate, @required this.deviceId});

  factory OnlineSubscriber.fromJson(Map<String, dynamic> json) {
    final id = json[ID_FIELD];
    final email = json[EMAIL_FIELD];
    final exp = json[EXP_DATE_FIELD];
    final did = json[DEVICE_ID_FIELD];
    return OnlineSubscriber(id: id, email: email, expDate: exp, deviceId: did);
  }

  Map<String, dynamic> toJson() {
    return {ID_FIELD: id, EMAIL_FIELD: email, EXP_DATE_FIELD: expDate, DEVICE_ID_FIELD: deviceId};
  }
}
