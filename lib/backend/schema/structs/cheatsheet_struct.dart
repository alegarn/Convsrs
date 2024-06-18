// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheatsheetStruct extends BaseStruct {
  CheatsheetStruct({
    int? id,
    String? userId,
    String? name,
  })  : _id = id,
        _userId = userId,
        _name = name;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static CheatsheetStruct fromMap(Map<String, dynamic> data) =>
      CheatsheetStruct(
        id: castToType<int>(data['id']),
        userId: data['userId'] as String?,
        name: data['name'] as String?,
      );

  static CheatsheetStruct? maybeFromMap(dynamic data) => data is Map
      ? CheatsheetStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static CheatsheetStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheatsheetStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CheatsheetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheatsheetStruct &&
        id == other.id &&
        userId == other.userId &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, userId, name]);
}

CheatsheetStruct createCheatsheetStruct({
  int? id,
  String? userId,
  String? name,
}) =>
    CheatsheetStruct(
      id: id,
      userId: userId,
      name: name,
    );
