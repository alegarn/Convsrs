// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheatsheetRowStruct extends BaseStruct {
  CheatsheetRowStruct({
    int? id,
    String? cheatsheetId,
    String? concept,
    String? answer,
    String? conceptAudioUrl,
    String? answerAudioUrl,
    String? tagIds,
    bool? isVisible,
  })  : _id = id,
        _cheatsheetId = cheatsheetId,
        _concept = concept,
        _answer = answer,
        _conceptAudioUrl = conceptAudioUrl,
        _answerAudioUrl = answerAudioUrl,
        _tagIds = tagIds,
        _isVisible = isVisible;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "cheatsheetId" field.
  String? _cheatsheetId;
  String get cheatsheetId => _cheatsheetId ?? '0';
  set cheatsheetId(String? val) => _cheatsheetId = val;

  bool hasCheatsheetId() => _cheatsheetId != null;

  // "concept" field.
  String? _concept;
  String get concept => _concept ?? 'concept';
  set concept(String? val) => _concept = val;

  bool hasConcept() => _concept != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? 'answer';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  // "conceptAudioUrl" field.
  String? _conceptAudioUrl;
  String get conceptAudioUrl => _conceptAudioUrl ?? ' ';
  set conceptAudioUrl(String? val) => _conceptAudioUrl = val;

  bool hasConceptAudioUrl() => _conceptAudioUrl != null;

  // "answerAudioUrl" field.
  String? _answerAudioUrl;
  String get answerAudioUrl => _answerAudioUrl ?? ' ';
  set answerAudioUrl(String? val) => _answerAudioUrl = val;

  bool hasAnswerAudioUrl() => _answerAudioUrl != null;

  // "tagIds" field.
  String? _tagIds;
  String get tagIds => _tagIds ?? '[1]';
  set tagIds(String? val) => _tagIds = val;

  bool hasTagIds() => _tagIds != null;

  // "isVisible" field.
  bool? _isVisible;
  bool get isVisible => _isVisible ?? true;
  set isVisible(bool? val) => _isVisible = val;

  bool hasIsVisible() => _isVisible != null;

  static CheatsheetRowStruct fromMap(Map<String, dynamic> data) =>
      CheatsheetRowStruct(
        id: castToType<int>(data['id']),
        cheatsheetId: data['cheatsheetId'] as String?,
        concept: data['concept'] as String?,
        answer: data['answer'] as String?,
        conceptAudioUrl: data['conceptAudioUrl'] as String?,
        answerAudioUrl: data['answerAudioUrl'] as String?,
        tagIds: data['tagIds'] as String?,
        isVisible: data['isVisible'] as bool?,
      );

  static CheatsheetRowStruct? maybeFromMap(dynamic data) => data is Map
      ? CheatsheetRowStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'cheatsheetId': _cheatsheetId,
        'concept': _concept,
        'answer': _answer,
        'conceptAudioUrl': _conceptAudioUrl,
        'answerAudioUrl': _answerAudioUrl,
        'tagIds': _tagIds,
        'isVisible': _isVisible,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'cheatsheetId': serializeParam(
          _cheatsheetId,
          ParamType.String,
        ),
        'concept': serializeParam(
          _concept,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
        'conceptAudioUrl': serializeParam(
          _conceptAudioUrl,
          ParamType.String,
        ),
        'answerAudioUrl': serializeParam(
          _answerAudioUrl,
          ParamType.String,
        ),
        'tagIds': serializeParam(
          _tagIds,
          ParamType.String,
        ),
        'isVisible': serializeParam(
          _isVisible,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CheatsheetRowStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheatsheetRowStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        cheatsheetId: deserializeParam(
          data['cheatsheetId'],
          ParamType.String,
          false,
        ),
        concept: deserializeParam(
          data['concept'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        conceptAudioUrl: deserializeParam(
          data['conceptAudioUrl'],
          ParamType.String,
          false,
        ),
        answerAudioUrl: deserializeParam(
          data['answerAudioUrl'],
          ParamType.String,
          false,
        ),
        tagIds: deserializeParam(
          data['tagIds'],
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
  String toString() => 'CheatsheetRowStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheatsheetRowStruct &&
        id == other.id &&
        cheatsheetId == other.cheatsheetId &&
        concept == other.concept &&
        answer == other.answer &&
        conceptAudioUrl == other.conceptAudioUrl &&
        answerAudioUrl == other.answerAudioUrl &&
        tagIds == other.tagIds &&
        isVisible == other.isVisible;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        cheatsheetId,
        concept,
        answer,
        conceptAudioUrl,
        answerAudioUrl,
        tagIds,
        isVisible
      ]);
}

CheatsheetRowStruct createCheatsheetRowStruct({
  int? id,
  String? cheatsheetId,
  String? concept,
  String? answer,
  String? conceptAudioUrl,
  String? answerAudioUrl,
  String? tagIds,
  bool? isVisible,
}) =>
    CheatsheetRowStruct(
      id: id,
      cheatsheetId: cheatsheetId,
      concept: concept,
      answer: answer,
      conceptAudioUrl: conceptAudioUrl,
      answerAudioUrl: answerAudioUrl,
      tagIds: tagIds,
      isVisible: isVisible,
    );
