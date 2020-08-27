import 'package:fastocloud_dart_models/models/types.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

class ProviderStatus {
  final int _value;

  const ProviderStatus._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'NOT ACTIVE';
    }
    return 'ACTIVE';
  }

  factory ProviderStatus.fromInt(int value) {
    if (value == 0) {
      return ProviderStatus.NOT_ACTIVE;
    }
    return ProviderStatus.ACTIVE;
  }

  static get values => [NOT_ACTIVE, ACTIVE];

  static const ProviderStatus NOT_ACTIVE = ProviderStatus._(0);
  static const ProviderStatus ACTIVE = ProviderStatus._(1);
}

class ProviderType {
  final int _value;

  const ProviderType._(this._value);

  int toInt() {
    return _value;
  }

  String toHumanReadable() {
    if (_value == 0) {
      return 'ADMIN';
    }
    return 'RESELLER';
  }

  factory ProviderType.fromInt(int value) {
    if (value == 0) {
      return ProviderType.ADMIN;
    }
    return ProviderType.RESELLER;
  }

  static get values => [ADMIN, RESELLER];

  static const ProviderType ADMIN = ProviderType._(0);
  static const ProviderType RESELLER = ProviderType._(1);
}

class Provider {
  static const ID_FIELD = 'id';
  static const EMAIL_FIELD = 'email'; //
  static const FIRST_NAME_FIELD = 'first_name'; //
  static const LAST_NAME_FIELD = 'last_name'; //
  static const PASSWORD_FIELD = 'password';
  static const CREATED_DATE_FIELD = 'created_date';
  static const TYPE_FIELD = 'type'; //
  static const STATUS_FIELD = 'status'; //
  static const LANGUAGE_FIELD = 'language';
  static const COUNTRY_FIELD = 'country';
  static const CREDITS_FIELD = 'credits';

  static const MIN_NAME = 2;
  static const MAX_NAME = 64;

  final String id;
  String email;
  Optional<String> _password;
  String firstName;
  String lastName;
  int createdDate;
  ProviderType type;
  ProviderStatus status;
  String language;
  String country;
  int credits;

  String get password {
    return _password.orNull;
  }

  set password(String password) {
    _password = Optional<String>.fromNullable(password);
  }

  Provider copy() {
    return Provider.edit(
        id: id,
        email: email,
        firstName: firstName,
        password: password,
        lastName: lastName,
        createdDate: createdDate,
        language: language,
        country: country,
        type: type,
        status: status,
        credits: credits);
  }

  Provider.create(
      {this.email,
      String password,
      this.firstName,
      this.lastName,
      this.createdDate,
      this.type,
      this.status,
      this.credits,
      this.language,
      this.country})
      : id = null,
        _password = Optional<String>.fromNullable(password);

  Provider.edit(
      {@required this.id,
      this.email,
      String password,
      this.firstName,
      this.lastName,
      this.createdDate,
      this.status,
      this.type,
      this.credits,
      this.language,
      this.country})
      : _password = Optional<String>.fromNullable(password);

  bool isAdmin() {
    return type == ProviderType.ADMIN;
  }

  Provider.createDefault()
      : id = null,
        email = '',
        firstName = '',
        lastName = '',
        createdDate = DateTime.now().millisecondsSinceEpoch,
        _password = Optional<String>.absent(),
        status = ProviderStatus.ACTIVE,
        type = ProviderType.ADMIN,
        credits = Credits.DEFAULT;

  bool isValid() {
    if (id == null) {
      bool isValidPassword = _password.isPresent && _password.value.isNotEmpty;
      return email.isNotEmpty &&
          firstName.isNotEmpty &&
          isValidPassword &&
          lastName.isNotEmpty &&
          createdDate != 0 &&
          language.isNotEmpty &&
          country.isNotEmpty &&
          status != null &&
          type != null &&
          credits.isValidCredits();
    }

    return email.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        createdDate != 0 &&
        language.isNotEmpty &&
        country.isNotEmpty &&
        status != null &&
        type != null &&
        credits.isValidCredits();
  }

  factory Provider.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    String password;
    if (json.containsKey(PASSWORD_FIELD)) {
      password = json[PASSWORD_FIELD];
    }
    return Provider.edit(
        id: json[ID_FIELD],
        email: json[EMAIL_FIELD],
        firstName: json[FIRST_NAME_FIELD],
        lastName: json[LAST_NAME_FIELD],
        createdDate: json[CREATED_DATE_FIELD],
        type: ProviderType.fromInt(json[TYPE_FIELD]),
        status: ProviderStatus.fromInt(json[STATUS_FIELD]),
        credits: json[CREDITS_FIELD],
        language: json[LANGUAGE_FIELD],
        country: json[COUNTRY_FIELD],
        password: password);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      ID_FIELD: id,
      EMAIL_FIELD: email,
      FIRST_NAME_FIELD: firstName,
      LAST_NAME_FIELD: lastName,
      CREATED_DATE_FIELD: createdDate,
      TYPE_FIELD: type.toInt(),
      STATUS_FIELD: status.toInt(),
      CREDITS_FIELD: credits,
      LANGUAGE_FIELD: language,
      COUNTRY_FIELD: country
    };
    if (_password.isPresent) {
      result[PASSWORD_FIELD] = _password.value;
    }
    return result;
  }
}
