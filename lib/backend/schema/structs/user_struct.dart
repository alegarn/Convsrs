// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? uuid,
    String? username,
    String? email,
    String? password,
    double? globalSuccessRate,
    int? totalCardLearned,
  })  : _uuid = uuid,
        _username = username,
        _email = email,
        _password = password,
        _globalSuccessRate = globalSuccessRate,
        _totalCardLearned = totalCardLearned;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;

  bool hasUuid() => _uuid != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "globalSuccessRate" field.
  double? _globalSuccessRate;
  double get globalSuccessRate => _globalSuccessRate ?? 0.0;
  set globalSuccessRate(double? val) => _globalSuccessRate = val;

  void incrementGlobalSuccessRate(double amount) =>
      globalSuccessRate = globalSuccessRate + amount;

  bool hasGlobalSuccessRate() => _globalSuccessRate != null;

  // "totalCardLearned" field.
  int? _totalCardLearned;
  int get totalCardLearned => _totalCardLearned ?? 0;
  set totalCardLearned(int? val) => _totalCardLearned = val;

  void incrementTotalCardLearned(int amount) =>
      totalCardLearned = totalCardLearned + amount;

  bool hasTotalCardLearned() => _totalCardLearned != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        uuid: data['uuid'] as String?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        password: data['password'] as String?,
        globalSuccessRate: castToType<double>(data['globalSuccessRate']),
        totalCardLearned: castToType<int>(data['totalCardLearned']),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'uuid': _uuid,
        'username': _username,
        'email': _email,
        'password': _password,
        'globalSuccessRate': _globalSuccessRate,
        'totalCardLearned': _totalCardLearned,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'globalSuccessRate': serializeParam(
          _globalSuccessRate,
          ParamType.double,
        ),
        'totalCardLearned': serializeParam(
          _totalCardLearned,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        globalSuccessRate: deserializeParam(
          data['globalSuccessRate'],
          ParamType.double,
          false,
        ),
        totalCardLearned: deserializeParam(
          data['totalCardLearned'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        uuid == other.uuid &&
        username == other.username &&
        email == other.email &&
        password == other.password &&
        globalSuccessRate == other.globalSuccessRate &&
        totalCardLearned == other.totalCardLearned;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [uuid, username, email, password, globalSuccessRate, totalCardLearned]);
}

UserStruct createUserStruct({
  String? uuid,
  String? username,
  String? email,
  String? password,
  double? globalSuccessRate,
  int? totalCardLearned,
}) =>
    UserStruct(
      uuid: uuid,
      username: username,
      email: email,
      password: password,
      globalSuccessRate: globalSuccessRate,
      totalCardLearned: totalCardLearned,
    );
