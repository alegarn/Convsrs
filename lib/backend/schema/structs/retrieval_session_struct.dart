// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetrievalSessionStruct extends BaseStruct {
  RetrievalSessionStruct({
    int? id,
    String? userId,
    int? durationSec,
    int? totalCardNumber,
    int? failNumber,
    int? successNumber,
    DateTime? date,
    List<String>? speakingRetrievalDates,
  })  : _id = id,
        _userId = userId,
        _durationSec = durationSec,
        _totalCardNumber = totalCardNumber,
        _failNumber = failNumber,
        _successNumber = successNumber,
        _date = date,
        _speakingRetrievalDates = speakingRetrievalDates;

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

  // "durationSec" field.
  int? _durationSec;
  int get durationSec => _durationSec ?? 0;
  set durationSec(int? val) => _durationSec = val;

  void incrementDurationSec(int amount) => durationSec = durationSec + amount;

  bool hasDurationSec() => _durationSec != null;

  // "totalCardNumber" field.
  int? _totalCardNumber;
  int get totalCardNumber => _totalCardNumber ?? 0;
  set totalCardNumber(int? val) => _totalCardNumber = val;

  void incrementTotalCardNumber(int amount) =>
      totalCardNumber = totalCardNumber + amount;

  bool hasTotalCardNumber() => _totalCardNumber != null;

  // "failNumber" field.
  int? _failNumber;
  int get failNumber => _failNumber ?? 0;
  set failNumber(int? val) => _failNumber = val;

  void incrementFailNumber(int amount) => failNumber = failNumber + amount;

  bool hasFailNumber() => _failNumber != null;

  // "successNumber" field.
  int? _successNumber;
  int get successNumber => _successNumber ?? 0;
  set successNumber(int? val) => _successNumber = val;

  void incrementSuccessNumber(int amount) =>
      successNumber = successNumber + amount;

  bool hasSuccessNumber() => _successNumber != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "speakingRetrievalDates" field.
  List<String>? _speakingRetrievalDates;
  List<String> get speakingRetrievalDates =>
      _speakingRetrievalDates ?? const [];
  set speakingRetrievalDates(List<String>? val) =>
      _speakingRetrievalDates = val;

  void updateSpeakingRetrievalDates(Function(List<String>) updateFn) {
    updateFn(_speakingRetrievalDates ??= []);
  }

  bool hasSpeakingRetrievalDates() => _speakingRetrievalDates != null;

  static RetrievalSessionStruct fromMap(Map<String, dynamic> data) =>
      RetrievalSessionStruct(
        id: castToType<int>(data['id']),
        userId: data['userId'] as String?,
        durationSec: castToType<int>(data['durationSec']),
        totalCardNumber: castToType<int>(data['totalCardNumber']),
        failNumber: castToType<int>(data['failNumber']),
        successNumber: castToType<int>(data['successNumber']),
        date: data['date'] as DateTime?,
        speakingRetrievalDates: getDataList(data['speakingRetrievalDates']),
      );

  static RetrievalSessionStruct? maybeFromMap(dynamic data) => data is Map
      ? RetrievalSessionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'durationSec': _durationSec,
        'totalCardNumber': _totalCardNumber,
        'failNumber': _failNumber,
        'successNumber': _successNumber,
        'date': _date,
        'speakingRetrievalDates': _speakingRetrievalDates,
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
        'durationSec': serializeParam(
          _durationSec,
          ParamType.int,
        ),
        'totalCardNumber': serializeParam(
          _totalCardNumber,
          ParamType.int,
        ),
        'failNumber': serializeParam(
          _failNumber,
          ParamType.int,
        ),
        'successNumber': serializeParam(
          _successNumber,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'speakingRetrievalDates': serializeParam(
          _speakingRetrievalDates,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static RetrievalSessionStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RetrievalSessionStruct(
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
        durationSec: deserializeParam(
          data['durationSec'],
          ParamType.int,
          false,
        ),
        totalCardNumber: deserializeParam(
          data['totalCardNumber'],
          ParamType.int,
          false,
        ),
        failNumber: deserializeParam(
          data['failNumber'],
          ParamType.int,
          false,
        ),
        successNumber: deserializeParam(
          data['successNumber'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        speakingRetrievalDates: deserializeParam<String>(
          data['speakingRetrievalDates'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'RetrievalSessionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RetrievalSessionStruct &&
        id == other.id &&
        userId == other.userId &&
        durationSec == other.durationSec &&
        totalCardNumber == other.totalCardNumber &&
        failNumber == other.failNumber &&
        successNumber == other.successNumber &&
        date == other.date &&
        listEquality.equals(
            speakingRetrievalDates, other.speakingRetrievalDates);
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        durationSec,
        totalCardNumber,
        failNumber,
        successNumber,
        date,
        speakingRetrievalDates
      ]);
}

RetrievalSessionStruct createRetrievalSessionStruct({
  int? id,
  String? userId,
  int? durationSec,
  int? totalCardNumber,
  int? failNumber,
  int? successNumber,
  DateTime? date,
}) =>
    RetrievalSessionStruct(
      id: id,
      userId: userId,
      durationSec: durationSec,
      totalCardNumber: totalCardNumber,
      failNumber: failNumber,
      successNumber: successNumber,
      date: date,
    );
