// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationPersonaStruct extends BaseStruct {
  ConversationPersonaStruct({
    int? id,
    int? conversationId,
    int? personaId,
  })  : _id = id,
        _conversationId = conversationId,
        _personaId = personaId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "conversationId" field.
  int? _conversationId;
  int get conversationId => _conversationId ?? 0;
  set conversationId(int? val) => _conversationId = val;

  void incrementConversationId(int amount) =>
      conversationId = conversationId + amount;

  bool hasConversationId() => _conversationId != null;

  // "personaId" field.
  int? _personaId;
  int get personaId => _personaId ?? 0;
  set personaId(int? val) => _personaId = val;

  void incrementPersonaId(int amount) => personaId = personaId + amount;

  bool hasPersonaId() => _personaId != null;

  static ConversationPersonaStruct fromMap(Map<String, dynamic> data) =>
      ConversationPersonaStruct(
        id: castToType<int>(data['id']),
        conversationId: castToType<int>(data['conversationId']),
        personaId: castToType<int>(data['personaId']),
      );

  static ConversationPersonaStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversationPersonaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'conversationId': _conversationId,
        'personaId': _personaId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'conversationId': serializeParam(
          _conversationId,
          ParamType.int,
        ),
        'personaId': serializeParam(
          _personaId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ConversationPersonaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConversationPersonaStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        conversationId: deserializeParam(
          data['conversationId'],
          ParamType.int,
          false,
        ),
        personaId: deserializeParam(
          data['personaId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ConversationPersonaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversationPersonaStruct &&
        id == other.id &&
        conversationId == other.conversationId &&
        personaId == other.personaId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, conversationId, personaId]);
}

ConversationPersonaStruct createConversationPersonaStruct({
  int? id,
  int? conversationId,
  int? personaId,
}) =>
    ConversationPersonaStruct(
      id: id,
      conversationId: conversationId,
      personaId: personaId,
    );
