// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagStruct extends BaseStruct {
  TagStruct({
    int? id,
    String? name,
  })  : _id = id,
        _name = name;

  // "id" field.
  int? _id;
  int get id => _id ?? 1;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? 'no_tag';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static TagStruct fromMap(Map<String, dynamic> data) => TagStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
      );

  static TagStruct? maybeFromMap(dynamic data) =>
      data is Map ? TagStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static TagStruct fromSerializableMap(Map<String, dynamic> data) => TagStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TagStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

TagStruct createTagStruct({
  int? id,
  String? name,
}) =>
    TagStruct(
      id: id,
      name: name,
    );
