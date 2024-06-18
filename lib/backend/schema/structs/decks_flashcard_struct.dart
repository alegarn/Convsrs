// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DecksFlashcardStruct extends BaseStruct {
  DecksFlashcardStruct({
    int? id,
    int? deckId,
    int? flashcardId,
  })  : _id = id,
        _deckId = deckId,
        _flashcardId = flashcardId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "deckId" field.
  int? _deckId;
  int get deckId => _deckId ?? 0;
  set deckId(int? val) => _deckId = val;

  void incrementDeckId(int amount) => deckId = deckId + amount;

  bool hasDeckId() => _deckId != null;

  // "flashcardId" field.
  int? _flashcardId;
  int get flashcardId => _flashcardId ?? 0;
  set flashcardId(int? val) => _flashcardId = val;

  void incrementFlashcardId(int amount) => flashcardId = flashcardId + amount;

  bool hasFlashcardId() => _flashcardId != null;

  static DecksFlashcardStruct fromMap(Map<String, dynamic> data) =>
      DecksFlashcardStruct(
        id: castToType<int>(data['id']),
        deckId: castToType<int>(data['deckId']),
        flashcardId: castToType<int>(data['flashcardId']),
      );

  static DecksFlashcardStruct? maybeFromMap(dynamic data) => data is Map
      ? DecksFlashcardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'deckId': _deckId,
        'flashcardId': _flashcardId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'deckId': serializeParam(
          _deckId,
          ParamType.int,
        ),
        'flashcardId': serializeParam(
          _flashcardId,
          ParamType.int,
        ),
      }.withoutNulls;

  static DecksFlashcardStruct fromSerializableMap(Map<String, dynamic> data) =>
      DecksFlashcardStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        deckId: deserializeParam(
          data['deckId'],
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
  String toString() => 'DecksFlashcardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DecksFlashcardStruct &&
        id == other.id &&
        deckId == other.deckId &&
        flashcardId == other.flashcardId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, deckId, flashcardId]);
}

DecksFlashcardStruct createDecksFlashcardStruct({
  int? id,
  int? deckId,
  int? flashcardId,
}) =>
    DecksFlashcardStruct(
      id: id,
      deckId: deckId,
      flashcardId: flashcardId,
    );
