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
  })  : _id = id,
        _cheatsheetId = cheatsheetId,
        _concept = concept,
        _answer = answer,
        _conceptAudioUrl = conceptAudioUrl,
        _answerAudioUrl = answerAudioUrl;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "cheatsheetId" field.
  String? _cheatsheetId;
  String get cheatsheetId => _cheatsheetId ?? '';
  set cheatsheetId(String? val) => _cheatsheetId = val;

  bool hasCheatsheetId() => _cheatsheetId != null;

  // "concept" field.
  String? _concept;
  String get concept => _concept ?? '';
  set concept(String? val) => _concept = val;

  bool hasConcept() => _concept != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  // "conceptAudioUrl" field.
  String? _conceptAudioUrl;
  String get conceptAudioUrl => _conceptAudioUrl ?? '';
  set conceptAudioUrl(String? val) => _conceptAudioUrl = val;

  bool hasConceptAudioUrl() => _conceptAudioUrl != null;

  // "answerAudioUrl" field.
  String? _answerAudioUrl;
  String get answerAudioUrl => _answerAudioUrl ?? '';
  set answerAudioUrl(String? val) => _answerAudioUrl = val;

  bool hasAnswerAudioUrl() => _answerAudioUrl != null;

  static CheatsheetRowStruct fromMap(Map<String, dynamic> data) =>
      CheatsheetRowStruct(
        id: castToType<int>(data['id']),
        cheatsheetId: data['cheatsheetId'] as String?,
        concept: data['concept'] as String?,
        answer: data['answer'] as String?,
        conceptAudioUrl: data['conceptAudioUrl'] as String?,
        answerAudioUrl: data['answerAudioUrl'] as String?,
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
        answerAudioUrl == other.answerAudioUrl;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, cheatsheetId, concept, answer, conceptAudioUrl, answerAudioUrl]);
}

CheatsheetRowStruct createCheatsheetRowStruct({
  int? id,
  String? cheatsheetId,
  String? concept,
  String? answer,
  String? conceptAudioUrl,
  String? answerAudioUrl,
}) =>
    CheatsheetRowStruct(
      id: id,
      cheatsheetId: cheatsheetId,
      concept: concept,
      answer: answer,
      conceptAudioUrl: conceptAudioUrl,
      answerAudioUrl: answerAudioUrl,
    );
