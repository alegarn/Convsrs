// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationStruct extends BaseStruct {
  ConversationStruct({
    int? id,
    String? userId,
    int? personaId,
    int? deckId,
    int? cheatsheetId,
    int? durationMs,
    DateTime? date,
    int? totalCardNumber,
    int? validatedCardNumber,
    List<String>? validatedCardIds,
    int? timeSpoken,
  })  : _id = id,
        _userId = userId,
        _personaId = personaId,
        _deckId = deckId,
        _cheatsheetId = cheatsheetId,
        _durationMs = durationMs,
        _date = date,
        _totalCardNumber = totalCardNumber,
        _validatedCardNumber = validatedCardNumber,
        _validatedCardIds = validatedCardIds,
        _timeSpoken = timeSpoken;

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

  // "personaId" field.
  int? _personaId;
  int get personaId => _personaId ?? 0;
  set personaId(int? val) => _personaId = val;

  void incrementPersonaId(int amount) => personaId = personaId + amount;

  bool hasPersonaId() => _personaId != null;

  // "deckId" field.
  int? _deckId;
  int get deckId => _deckId ?? 0;
  set deckId(int? val) => _deckId = val;

  void incrementDeckId(int amount) => deckId = deckId + amount;

  bool hasDeckId() => _deckId != null;

  // "cheatsheetId" field.
  int? _cheatsheetId;
  int get cheatsheetId => _cheatsheetId ?? 0;
  set cheatsheetId(int? val) => _cheatsheetId = val;

  void incrementCheatsheetId(int amount) =>
      cheatsheetId = cheatsheetId + amount;

  bool hasCheatsheetId() => _cheatsheetId != null;

  // "durationMs" field.
  int? _durationMs;
  int get durationMs => _durationMs ?? 0;
  set durationMs(int? val) => _durationMs = val;

  void incrementDurationMs(int amount) => durationMs = durationMs + amount;

  bool hasDurationMs() => _durationMs != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "totalCardNumber" field.
  int? _totalCardNumber;
  int get totalCardNumber => _totalCardNumber ?? 0;
  set totalCardNumber(int? val) => _totalCardNumber = val;

  void incrementTotalCardNumber(int amount) =>
      totalCardNumber = totalCardNumber + amount;

  bool hasTotalCardNumber() => _totalCardNumber != null;

  // "validatedCardNumber" field.
  int? _validatedCardNumber;
  int get validatedCardNumber => _validatedCardNumber ?? 0;
  set validatedCardNumber(int? val) => _validatedCardNumber = val;

  void incrementValidatedCardNumber(int amount) =>
      validatedCardNumber = validatedCardNumber + amount;

  bool hasValidatedCardNumber() => _validatedCardNumber != null;

  // "validatedCardIds" field.
  List<String>? _validatedCardIds;
  List<String> get validatedCardIds => _validatedCardIds ?? const [];
  set validatedCardIds(List<String>? val) => _validatedCardIds = val;

  void updateValidatedCardIds(Function(List<String>) updateFn) {
    updateFn(validatedCardIds ??= []);
  }

  bool hasValidatedCardIds() => _validatedCardIds != null;

  // "timeSpoken" field.
  int? _timeSpoken;
  int get timeSpoken => _timeSpoken ?? 0;
  set timeSpoken(int? val) => _timeSpoken = val;

  void incrementTimeSpoken(int amount) => timeSpoken = timeSpoken + amount;

  bool hasTimeSpoken() => _timeSpoken != null;

  static ConversationStruct fromMap(Map<String, dynamic> data) =>
      ConversationStruct(
        id: castToType<int>(data['id']),
        userId: data['userId'] as String?,
        personaId: castToType<int>(data['personaId']),
        deckId: castToType<int>(data['deckId']),
        cheatsheetId: castToType<int>(data['cheatsheetId']),
        durationMs: castToType<int>(data['durationMs']),
        date: data['date'] as DateTime?,
        totalCardNumber: castToType<int>(data['totalCardNumber']),
        validatedCardNumber: castToType<int>(data['validatedCardNumber']),
        validatedCardIds: getDataList(data['validatedCardIds']),
        timeSpoken: castToType<int>(data['timeSpoken']),
      );

  static ConversationStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'personaId': _personaId,
        'deckId': _deckId,
        'cheatsheetId': _cheatsheetId,
        'durationMs': _durationMs,
        'date': _date,
        'totalCardNumber': _totalCardNumber,
        'validatedCardNumber': _validatedCardNumber,
        'validatedCardIds': _validatedCardIds,
        'timeSpoken': _timeSpoken,
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
        'personaId': serializeParam(
          _personaId,
          ParamType.int,
        ),
        'deckId': serializeParam(
          _deckId,
          ParamType.int,
        ),
        'cheatsheetId': serializeParam(
          _cheatsheetId,
          ParamType.int,
        ),
        'durationMs': serializeParam(
          _durationMs,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'totalCardNumber': serializeParam(
          _totalCardNumber,
          ParamType.int,
        ),
        'validatedCardNumber': serializeParam(
          _validatedCardNumber,
          ParamType.int,
        ),
        'validatedCardIds': serializeParam(
          _validatedCardIds,
          ParamType.String,
          isList: true,
        ),
        'timeSpoken': serializeParam(
          _timeSpoken,
          ParamType.int,
        ),
      }.withoutNulls;

  static ConversationStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConversationStruct(
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
        personaId: deserializeParam(
          data['personaId'],
          ParamType.int,
          false,
        ),
        deckId: deserializeParam(
          data['deckId'],
          ParamType.int,
          false,
        ),
        cheatsheetId: deserializeParam(
          data['cheatsheetId'],
          ParamType.int,
          false,
        ),
        durationMs: deserializeParam(
          data['durationMs'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        totalCardNumber: deserializeParam(
          data['totalCardNumber'],
          ParamType.int,
          false,
        ),
        validatedCardNumber: deserializeParam(
          data['validatedCardNumber'],
          ParamType.int,
          false,
        ),
        validatedCardIds: deserializeParam<String>(
          data['validatedCardIds'],
          ParamType.String,
          true,
        ),
        timeSpoken: deserializeParam(
          data['timeSpoken'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ConversationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConversationStruct &&
        id == other.id &&
        userId == other.userId &&
        personaId == other.personaId &&
        deckId == other.deckId &&
        cheatsheetId == other.cheatsheetId &&
        durationMs == other.durationMs &&
        date == other.date &&
        totalCardNumber == other.totalCardNumber &&
        validatedCardNumber == other.validatedCardNumber &&
        listEquality.equals(validatedCardIds, other.validatedCardIds) &&
        timeSpoken == other.timeSpoken;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        personaId,
        deckId,
        cheatsheetId,
        durationMs,
        date,
        totalCardNumber,
        validatedCardNumber,
        validatedCardIds,
        timeSpoken
      ]);
}

ConversationStruct createConversationStruct({
  int? id,
  String? userId,
  int? personaId,
  int? deckId,
  int? cheatsheetId,
  int? durationMs,
  DateTime? date,
  int? totalCardNumber,
  int? validatedCardNumber,
  int? timeSpoken,
}) =>
    ConversationStruct(
      id: id,
      userId: userId,
      personaId: personaId,
      deckId: deckId,
      cheatsheetId: cheatsheetId,
      durationMs: durationMs,
      date: date,
      totalCardNumber: totalCardNumber,
      validatedCardNumber: validatedCardNumber,
      timeSpoken: timeSpoken,
    );
