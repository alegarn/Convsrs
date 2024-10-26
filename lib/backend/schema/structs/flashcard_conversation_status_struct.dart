// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlashcardConversationStatusStruct extends BaseStruct {
  FlashcardConversationStatusStruct({
    int? id,
    String? textVerso,
    String? textRecto,
    int? timesValidatedByClickCount,
    bool? isFullyValidated,
    List<int>? tagIds,
  })  : _id = id,
        _textVerso = textVerso,
        _textRecto = textRecto,
        _timesValidatedByClickCount = timesValidatedByClickCount,
        _isFullyValidated = isFullyValidated,
        _tagIds = tagIds;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "textVerso" field.
  String? _textVerso;
  String get textVerso => _textVerso ?? 'none';
  set textVerso(String? val) => _textVerso = val;

  bool hasTextVerso() => _textVerso != null;

  // "textRecto" field.
  String? _textRecto;
  String get textRecto => _textRecto ?? 'none';
  set textRecto(String? val) => _textRecto = val;

  bool hasTextRecto() => _textRecto != null;

  // "timesValidatedByClickCount" field.
  int? _timesValidatedByClickCount;
  int get timesValidatedByClickCount => _timesValidatedByClickCount ?? 5;
  set timesValidatedByClickCount(int? val) => _timesValidatedByClickCount = val;

  void incrementTimesValidatedByClickCount(int amount) =>
      timesValidatedByClickCount = timesValidatedByClickCount + amount;

  bool hasTimesValidatedByClickCount() => _timesValidatedByClickCount != null;

  // "isFullyValidated" field.
  bool? _isFullyValidated;
  bool get isFullyValidated => _isFullyValidated ?? false;
  set isFullyValidated(bool? val) => _isFullyValidated = val;

  bool hasIsFullyValidated() => _isFullyValidated != null;

  // "tagIds" field.
  List<int>? _tagIds;
  List<int> get tagIds => _tagIds ?? const [];
  set tagIds(List<int>? val) => _tagIds = val;

  void updateTagIds(Function(List<int>) updateFn) {
    updateFn(_tagIds ??= []);
  }

  bool hasTagIds() => _tagIds != null;

  static FlashcardConversationStatusStruct fromMap(Map<String, dynamic> data) =>
      FlashcardConversationStatusStruct(
        id: castToType<int>(data['id']),
        textVerso: data['textVerso'] as String?,
        textRecto: data['textRecto'] as String?,
        timesValidatedByClickCount:
            castToType<int>(data['timesValidatedByClickCount']),
        isFullyValidated: data['isFullyValidated'] as bool?,
        tagIds: getDataList(data['tagIds']),
      );

  static FlashcardConversationStatusStruct? maybeFromMap(dynamic data) => data
          is Map
      ? FlashcardConversationStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'textVerso': _textVerso,
        'textRecto': _textRecto,
        'timesValidatedByClickCount': _timesValidatedByClickCount,
        'isFullyValidated': _isFullyValidated,
        'tagIds': _tagIds,
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
        'textRecto': serializeParam(
          _textRecto,
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
        'tagIds': serializeParam(
          _tagIds,
          ParamType.int,
          isList: true,
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
        textRecto: deserializeParam(
          data['textRecto'],
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
        tagIds: deserializeParam<int>(
          data['tagIds'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'FlashcardConversationStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FlashcardConversationStatusStruct &&
        id == other.id &&
        textVerso == other.textVerso &&
        textRecto == other.textRecto &&
        timesValidatedByClickCount == other.timesValidatedByClickCount &&
        isFullyValidated == other.isFullyValidated &&
        listEquality.equals(tagIds, other.tagIds);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        textVerso,
        textRecto,
        timesValidatedByClickCount,
        isFullyValidated,
        tagIds
      ]);
}

FlashcardConversationStatusStruct createFlashcardConversationStatusStruct({
  int? id,
  String? textVerso,
  String? textRecto,
  int? timesValidatedByClickCount,
  bool? isFullyValidated,
}) =>
    FlashcardConversationStatusStruct(
      id: id,
      textVerso: textVerso,
      textRecto: textRecto,
      timesValidatedByClickCount: timesValidatedByClickCount,
      isFullyValidated: isFullyValidated,
    );
