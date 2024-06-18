// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetrievalSessionsDeckStruct extends BaseStruct {
  RetrievalSessionsDeckStruct({
    int? id,
    int? retrievalSessionId,
    int? deckId,
  })  : _id = id,
        _retrievalSessionId = retrievalSessionId,
        _deckId = deckId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "retrievalSessionId" field.
  int? _retrievalSessionId;
  int get retrievalSessionId => _retrievalSessionId ?? 0;
  set retrievalSessionId(int? val) => _retrievalSessionId = val;

  void incrementRetrievalSessionId(int amount) =>
      retrievalSessionId = retrievalSessionId + amount;

  bool hasRetrievalSessionId() => _retrievalSessionId != null;

  // "deckId" field.
  int? _deckId;
  int get deckId => _deckId ?? 0;
  set deckId(int? val) => _deckId = val;

  void incrementDeckId(int amount) => deckId = deckId + amount;

  bool hasDeckId() => _deckId != null;

  static RetrievalSessionsDeckStruct fromMap(Map<String, dynamic> data) =>
      RetrievalSessionsDeckStruct(
        id: castToType<int>(data['id']),
        retrievalSessionId: castToType<int>(data['retrievalSessionId']),
        deckId: castToType<int>(data['deckId']),
      );

  static RetrievalSessionsDeckStruct? maybeFromMap(dynamic data) => data is Map
      ? RetrievalSessionsDeckStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'retrievalSessionId': _retrievalSessionId,
        'deckId': _deckId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'retrievalSessionId': serializeParam(
          _retrievalSessionId,
          ParamType.int,
        ),
        'deckId': serializeParam(
          _deckId,
          ParamType.int,
        ),
      }.withoutNulls;

  static RetrievalSessionsDeckStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RetrievalSessionsDeckStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        retrievalSessionId: deserializeParam(
          data['retrievalSessionId'],
          ParamType.int,
          false,
        ),
        deckId: deserializeParam(
          data['deckId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RetrievalSessionsDeckStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RetrievalSessionsDeckStruct &&
        id == other.id &&
        retrievalSessionId == other.retrievalSessionId &&
        deckId == other.deckId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, retrievalSessionId, deckId]);
}

RetrievalSessionsDeckStruct createRetrievalSessionsDeckStruct({
  int? id,
  int? retrievalSessionId,
  int? deckId,
}) =>
    RetrievalSessionsDeckStruct(
      id: id,
      retrievalSessionId: retrievalSessionId,
      deckId: deckId,
    );
