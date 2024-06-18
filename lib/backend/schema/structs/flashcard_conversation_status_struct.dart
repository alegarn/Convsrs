// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlashcardConversationStatusStruct extends BaseStruct {
  FlashcardConversationStatusStruct({
    int? id,
    String? textVerso,
    int? timesValidatedByClickCount,
    bool? isFullyValidated,
  })  : _id = id,
        _textVerso = textVerso,
        _timesValidatedByClickCount = timesValidatedByClickCount,
        _isFullyValidated = isFullyValidated;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "textVerso" field.
  String? _textVerso;
  String get textVerso => _textVerso ?? '';
  set textVerso(String? val) => _textVerso = val;

  bool hasTextVerso() => _textVerso != null;

  // "timesValidatedByClickCount" field.
  int? _timesValidatedByClickCount;
  int get timesValidatedByClickCount => _timesValidatedByClickCount ?? 0;
  set timesValidatedByClickCount(int? val) => _timesValidatedByClickCount = val;

  void incrementTimesValidatedByClickCount(int amount) =>
      timesValidatedByClickCount = timesValidatedByClickCount + amount;

  bool hasTimesValidatedByClickCount() => _timesValidatedByClickCount != null;

  // "isFullyValidated" field.
  bool? _isFullyValidated;
  bool get isFullyValidated => _isFullyValidated ?? false;
  set isFullyValidated(bool? val) => _isFullyValidated = val;

  bool hasIsFullyValidated() => _isFullyValidated != null;

  static FlashcardConversationStatusStruct fromMap(Map<String, dynamic> data) =>
      FlashcardConversationStatusStruct(
        id: castToType<int>(data['id']),
        textVerso: data['textVerso'] as String?,
        timesValidatedByClickCount:
            castToType<int>(data['timesValidatedByClickCount']),
        isFullyValidated: data['isFullyValidated'] as bool?,
      );

  static FlashcardConversationStatusStruct? maybeFromMap(dynamic data) => data
          is Map
      ? FlashcardConversationStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'textVerso': _textVerso,
        'timesValidatedByClickCount': _timesValidatedByClickCount,
        'isFullyValidated': _isFullyValidated,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'textVerso': serializeParam(
          _textVerso,
          ParamType.String,
        ),
        'timesValidatedByClickCount': serializeParam(
          _timesValidatedByClickCount,
          ParamType.int,
        ),
        'isFullyValidated': serializeParam(
          _isFullyValidated,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FlashcardConversationStatusStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FlashcardConversationStatusStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        textVerso: deserializeParam(
          data['textVerso'],
          ParamType.String,
          false,
        ),
        timesValidatedByClickCount: deserializeParam(
          data['timesValidatedByClickCount'],
          ParamType.int,
          false,
        ),
        isFullyValidated: deserializeParam(
          data['isFullyValidated'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FlashcardConversationStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlashcardConversationStatusStruct &&
        id == other.id &&
        textVerso == other.textVerso &&
        timesValidatedByClickCount == other.timesValidatedByClickCount &&
        isFullyValidated == other.isFullyValidated;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, textVerso, timesValidatedByClickCount, isFullyValidated]);
}

FlashcardConversationStatusStruct createFlashcardConversationStatusStruct({
  int? id,
  String? textVerso,
  int? timesValidatedByClickCount,
  bool? isFullyValidated,
}) =>
    FlashcardConversationStatusStruct(
      id: id,
      textVerso: textVerso,
      timesValidatedByClickCount: timesValidatedByClickCount,
      isFullyValidated: isFullyValidated,
    );
