// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DecksFlashcardForListStruct extends BaseStruct {
  DecksFlashcardForListStruct({
    int? listId,
    int? deckId,
    int? flashcardId,
    String? name,
    bool? isVisible,
  })  : _listId = listId,
        _deckId = deckId,
        _flashcardId = flashcardId,
        _name = name,
        _isVisible = isVisible;

  // "listId" field.
  int? _listId;
  int get listId => _listId ?? 1;
  set listId(int? val) => _listId = val;

  void incrementListId(int amount) => listId = listId + amount;

  bool hasListId() => _listId != null;

  // "deckId" field.
  int? _deckId;
  int get deckId => _deckId ?? 1;
  set deckId(int? val) => _deckId = val;

  void incrementDeckId(int amount) => deckId = deckId + amount;

  bool hasDeckId() => _deckId != null;

  // "flashcardId" field.
  int? _flashcardId;
  int get flashcardId => _flashcardId ?? 1;
  set flashcardId(int? val) => _flashcardId = val;

  void incrementFlashcardId(int amount) => flashcardId = flashcardId + amount;

  bool hasFlashcardId() => _flashcardId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? 'defaultName';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "isVisible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? true;
  set isVisible(bool? val) => _isVisible = val;

  bool hasIsVisible() => _isVisible != null;

  static DecksFlashcardForListStruct fromMap(Map<String, dynamic> data) =>
      DecksFlashcardForListStruct(
        listId: castToType<int>(data['listId']),
        deckId: castToType<int>(data['deckId']),
        flashcardId: castToType<int>(data['flashcardId']),
        name: data['name'] as String?,
        isVisible: data['isVisible'] as bool?,
      );

  static DecksFlashcardForListStruct? maybeFromMap(dynamic data) => data is Map
      ? DecksFlashcardForListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'listId': _listId,
        'deckId': _deckId,
        'flashcardId': _flashcardId,
        'name': _name,
        'isVisible': _isVisible,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'listId': serializeParam(
          _listId,
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
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'isVisible': serializeParam(
          _isVisible,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DecksFlashcardForListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DecksFlashcardForListStruct(
        listId: deserializeParam(
          data['listId'],
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
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        isVisible: deserializeParam(
          data['isVisible'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DecksFlashcardForListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DecksFlashcardForListStruct &&
        listId == other.listId &&
        deckId == other.deckId &&
        flashcardId == other.flashcardId &&
        name == other.name &&
        isVisible == other.isVisible;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([listId, deckId, flashcardId, name, isVisible]);
}

DecksFlashcardForListStruct createDecksFlashcardForListStruct({
  int? listId,
  int? deckId,
  int? flashcardId,
  String? name,
  bool? isVisible,
}) =>
    DecksFlashcardForListStruct(
      listId: listId,
      deckId: deckId,
      flashcardId: flashcardId,
      name: name,
      isVisible: isVisible,
    );
