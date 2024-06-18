// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeckStruct extends BaseStruct {
  DeckStruct({
    int? id,
    String? userId,
    String? name,
    int? totalCards,
    double? deckSuccessRate,
  })  : _id = id,
        _userId = userId,
        _name = name,
        _totalCards = totalCards,
        _deckSuccessRate = deckSuccessRate;

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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "totalCards" field.
  int? _totalCards;
  int get totalCards => _totalCards ?? 0;
  set totalCards(int? val) => _totalCards = val;

  void incrementTotalCards(int amount) => totalCards = totalCards + amount;

  bool hasTotalCards() => _totalCards != null;

  // "deckSuccessRate" field.
  double? _deckSuccessRate;
  double get deckSuccessRate => _deckSuccessRate ?? 0.0;
  set deckSuccessRate(double? val) => _deckSuccessRate = val;

  void incrementDeckSuccessRate(double amount) =>
      deckSuccessRate = deckSuccessRate + amount;

  bool hasDeckSuccessRate() => _deckSuccessRate != null;

  static DeckStruct fromMap(Map<String, dynamic> data) => DeckStruct(
        id: castToType<int>(data['id']),
        userId: data['userId'] as String?,
        name: data['name'] as String?,
        totalCards: castToType<int>(data['totalCards']),
        deckSuccessRate: castToType<double>(data['deckSuccessRate']),
      );

  static DeckStruct? maybeFromMap(dynamic data) =>
      data is Map ? DeckStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'name': _name,
        'totalCards': _totalCards,
        'deckSuccessRate': _deckSuccessRate,
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
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'totalCards': serializeParam(
          _totalCards,
          ParamType.int,
        ),
        'deckSuccessRate': serializeParam(
          _deckSuccessRate,
          ParamType.double,
        ),
      }.withoutNulls;

  static DeckStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeckStruct(
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
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        totalCards: deserializeParam(
          data['totalCards'],
          ParamType.int,
          false,
        ),
        deckSuccessRate: deserializeParam(
          data['deckSuccessRate'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DeckStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeckStruct &&
        id == other.id &&
        userId == other.userId &&
        name == other.name &&
        totalCards == other.totalCards &&
        deckSuccessRate == other.deckSuccessRate;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, userId, name, totalCards, deckSuccessRate]);
}

DeckStruct createDeckStruct({
  int? id,
  String? userId,
  String? name,
  int? totalCards,
  double? deckSuccessRate,
}) =>
    DeckStruct(
      id: id,
      userId: userId,
      name: name,
      totalCards: totalCards,
      deckSuccessRate: deckSuccessRate,
    );
