// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationsFlashcardStruct extends BaseStruct {
  ConversationsFlashcardStruct({
    int? id,
    int? conversationId,
    int? flashcardId,
  })  : _id = id,
        _conversationId = conversationId,
        _flashcardId = flashcardId;

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

  // "flashcardId" field.
  int? _flashcardId;
  int get flashcardId => _flashcardId ?? 0;
  set flashcardId(int? val) => _flashcardId = val;

  void incrementFlashcardId(int amount) => flashcardId = flashcardId + amount;

  bool hasFlashcardId() => _flashcardId != null;

  static ConversationsFlashcardStruct fromMap(Map<String, dynamic> data) =>
      ConversationsFlashcardStruct(
        id: castToType<int>(data['id']),
        conversationId: castToType<int>(data['conversationId']),
        flashcardId: castToType<int>(data['flashcardId']),
      );

  static ConversationsFlashcardStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversationsFlashcardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'conversationId': _conversationId,
        'flashcardId': _flashcardId,
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
        'flashcardId': serializeParam(
          _flashcardId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ConversationsFlashcardStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConversationsFlashcardStruct(
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
        flashcardId: deserializeParam(
          data['flashcardId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ConversationsFlashcardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversationsFlashcardStruct &&
        id == other.id &&
        conversationId == other.conversationId &&
        flashcardId == other.flashcardId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, conversationId, flashcardId]);
}

ConversationsFlashcardStruct createConversationsFlashcardStruct({
  int? id,
  int? conversationId,
  int? flashcardId,
}) =>
    ConversationsFlashcardStruct(
      id: id,
      conversationId: conversationId,
      flashcardId: flashcardId,
    );
