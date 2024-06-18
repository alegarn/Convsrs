// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SrsParameterStruct extends BaseStruct {
  SrsParameterStruct({
    int? id,
    String? userId,
    int? stepNumber,
    int? retrievalIntervalDurationSec,
    String? conversationStepsIntervalsSec,
  })  : _id = id,
        _userId = userId,
        _stepNumber = stepNumber,
        _retrievalIntervalDurationSec = retrievalIntervalDurationSec,
        _conversationStepsIntervalsSec = conversationStepsIntervalsSec;

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

  // "stepNumber" field.
  int? _stepNumber;
  int get stepNumber => _stepNumber ?? 0;
  set stepNumber(int? val) => _stepNumber = val;

  void incrementStepNumber(int amount) => stepNumber = stepNumber + amount;

  bool hasStepNumber() => _stepNumber != null;

  // "retrievalIntervalDurationSec" field.
  int? _retrievalIntervalDurationSec;
  int get retrievalIntervalDurationSec => _retrievalIntervalDurationSec ?? 0;
  set retrievalIntervalDurationSec(int? val) =>
      _retrievalIntervalDurationSec = val;

  void incrementRetrievalIntervalDurationSec(int amount) =>
      retrievalIntervalDurationSec = retrievalIntervalDurationSec + amount;

  bool hasRetrievalIntervalDurationSec() =>
      _retrievalIntervalDurationSec != null;

  // "conversationStepsIntervalsSec" field.
  String? _conversationStepsIntervalsSec;
  String get conversationStepsIntervalsSec =>
      _conversationStepsIntervalsSec ?? '';
  set conversationStepsIntervalsSec(String? val) =>
      _conversationStepsIntervalsSec = val;

  bool hasConversationStepsIntervalsSec() =>
      _conversationStepsIntervalsSec != null;

  static SrsParameterStruct fromMap(Map<String, dynamic> data) =>
      SrsParameterStruct(
        id: castToType<int>(data['id']),
        userId: data['userId'] as String?,
        stepNumber: castToType<int>(data['stepNumber']),
        retrievalIntervalDurationSec:
            castToType<int>(data['retrievalIntervalDurationSec']),
        conversationStepsIntervalsSec:
            data['conversationStepsIntervalsSec'] as String?,
      );

  static SrsParameterStruct? maybeFromMap(dynamic data) => data is Map
      ? SrsParameterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'stepNumber': _stepNumber,
        'retrievalIntervalDurationSec': _retrievalIntervalDurationSec,
        'conversationStepsIntervalsSec': _conversationStepsIntervalsSec,
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
        'stepNumber': serializeParam(
          _stepNumber,
          ParamType.int,
        ),
        'retrievalIntervalDurationSec': serializeParam(
          _retrievalIntervalDurationSec,
          ParamType.int,
        ),
        'conversationStepsIntervalsSec': serializeParam(
          _conversationStepsIntervalsSec,
          ParamType.String,
        ),
      }.withoutNulls;

  static SrsParameterStruct fromSerializableMap(Map<String, dynamic> data) =>
      SrsParameterStruct(
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
        stepNumber: deserializeParam(
          data['stepNumber'],
          ParamType.int,
          false,
        ),
        retrievalIntervalDurationSec: deserializeParam(
          data['retrievalIntervalDurationSec'],
          ParamType.int,
          false,
        ),
        conversationStepsIntervalsSec: deserializeParam(
          data['conversationStepsIntervalsSec'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SrsParameterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SrsParameterStruct &&
        id == other.id &&
        userId == other.userId &&
        stepNumber == other.stepNumber &&
        retrievalIntervalDurationSec == other.retrievalIntervalDurationSec &&
        conversationStepsIntervalsSec == other.conversationStepsIntervalsSec;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        stepNumber,
        retrievalIntervalDurationSec,
        conversationStepsIntervalsSec
      ]);
}

SrsParameterStruct createSrsParameterStruct({
  int? id,
  String? userId,
  int? stepNumber,
  int? retrievalIntervalDurationSec,
  String? conversationStepsIntervalsSec,
}) =>
    SrsParameterStruct(
      id: id,
      userId: userId,
      stepNumber: stepNumber,
      retrievalIntervalDurationSec: retrievalIntervalDurationSec,
      conversationStepsIntervalsSec: conversationStepsIntervalsSec,
    );
