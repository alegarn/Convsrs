// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonaStruct extends BaseStruct {
  PersonaStruct({
    int? id,
    String? userId,
    String? name,
    String? infos,
    String? subject,
  })  : _id = id,
        _userId = userId,
        _name = name,
        _infos = infos,
        _subject = subject;

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

  // "infos" field.
  String? _infos;
  String get infos => _infos ?? '';
  set infos(String? val) => _infos = val;

  bool hasInfos() => _infos != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  static PersonaStruct fromMap(Map<String, dynamic> data) => PersonaStruct(
        id: castToType<int>(data['id']),
        userId: data['userId'] as String?,
        name: data['name'] as String?,
        infos: data['infos'] as String?,
        subject: data['subject'] as String?,
      );

  static PersonaStruct? maybeFromMap(dynamic data) =>
      data is Map ? PersonaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'name': _name,
        'infos': _infos,
        'subject': _subject,
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
        'infos': serializeParam(
          _infos,
          ParamType.String,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
      }.withoutNulls;

  static PersonaStruct fromSerializableMap(Map<String, dynamic> data) =>
      PersonaStruct(
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
        infos: deserializeParam(
          data['infos'],
          ParamType.String,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PersonaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PersonaStruct &&
        id == other.id &&
        userId == other.userId &&
        name == other.name &&
        infos == other.infos &&
        subject == other.subject;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, userId, name, infos, subject]);
}

PersonaStruct createPersonaStruct({
  int? id,
  String? userId,
  String? name,
  String? infos,
  String? subject,
}) =>
    PersonaStruct(
      id: id,
      userId: userId,
      name: name,
      infos: infos,
      subject: subject,
    );
