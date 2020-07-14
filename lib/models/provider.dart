import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

enum Status { NOT_ACTIVE, ACTIVE }

Status status2Enum(int number) {
  if (number == 0) {
    return Status.NOT_ACTIVE;
  }
  return Status.ACTIVE;
}

int status2int(Status status) {
  if (status == Status.NOT_ACTIVE) {
    return 0;
  }
  return 1;
}

String status2String(Status status) {
  if (status == Status.NOT_ACTIVE) {
    return 'NOT ACTIVE';
  }
  return 'ACTIVE';
}

enum Type { ADMIN, RESELLER }

Type type2Enum(int number) {
  if (number == 0) {
    return Type.ADMIN;
  }
  return Type.RESELLER;
}

int type2int(Type type) {
  if (type == Type.ADMIN) {
    return 0;
  }
  return 1;
}

String type2String(Type type) {
  if (type == Type.ADMIN) {
    return 'ADMIN';
  }
  return 'RESELLER';
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

  final String id;
  String email;
  Optional<String> _password;
  String firstName;
  String lastName;
  int createdDate;
  Type type;
  Status status;
  String language;
  String country;

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
        status: status);
  }

  Provider.create(
      {this.email,
      String password,
      this.firstName,
      this.lastName,
      this.createdDate,
      this.type,
      this.status,
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
      this.language,
      this.country})
      : _password = Optional<String>.fromNullable(password);

  bool isAdmin() {
    return type == Type.ADMIN;
  }

  Provider.createDefault()
      : id = null,
        email = '',
        firstName = '',
        lastName = '',
        createdDate = DateTime.now().millisecondsSinceEpoch,
        _password = Optional<String>.absent(),
        status = Status.ACTIVE,
        type = Type.ADMIN;

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
          type != null;
    }

    return email.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        createdDate != 0 &&
        language.isNotEmpty &&
        country.isNotEmpty &&
        status != null &&
        type != null;
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
        type: type2Enum(json[TYPE_FIELD]),
        status: status2Enum(json[STATUS_FIELD]),
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
      TYPE_FIELD: type2int(type),
      STATUS_FIELD: status2int(status),
      LANGUAGE_FIELD: language,
      COUNTRY_FIELD: country
    };
    if (_password.isPresent) {
      result[PASSWORD_FIELD] = _password.value;
    }
    return result;
  }
}
