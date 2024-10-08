// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlashcardsRetrievalStatusStruct extends BaseStruct {
  FlashcardsRetrievalStatusStruct({
    int? id,
    String? status,
    int? toReviewAgainThisSessionCount,
    int? currentRetrievalStep,
    bool? hasMentalImage,
  })  : _id = id,
        _status = status,
        _toReviewAgainThisSessionCount = toReviewAgainThisSessionCount,
        _currentRetrievalStep = currentRetrievalStep,
        _hasMentalImage = hasMentalImage;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? 'waiting';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "toReviewAgainThisSessionCount" field.
  int? _toReviewAgainThisSessionCount;
  int get toReviewAgainThisSessionCount => _toReviewAgainThisSessionCount ?? 5;
  set toReviewAgainThisSessionCount(int? val) =>
      _toReviewAgainThisSessionCount = val;

  void incrementToReviewAgainThisSessionCount(int amount) =>
      toReviewAgainThisSessionCount = toReviewAgainThisSessionCount + amount;

  bool hasToReviewAgainThisSessionCount() =>
      _toReviewAgainThisSessionCount != null;

  // "currentRetrievalStep" field.
  int? _currentRetrievalStep;
  int get currentRetrievalStep => _currentRetrievalStep ?? 0;
  set currentRetrievalStep(int? val) => _currentRetrievalStep = val;

  void incrementCurrentRetrievalStep(int amount) =>
      currentRetrievalStep = currentRetrievalStep + amount;

  bool hasCurrentRetrievalStep() => _currentRetrievalStep != null;

  // "hasMentalImage" field.
  bool? _hasMentalImage;
  bool get hasMentalImage => _hasMentalImage ?? false;
  set hasMentalImage(bool? val) => _hasMentalImage = val;

  bool hasHasMentalImage() => _hasMentalImage != null;

  static FlashcardsRetrievalStatusStruct fromMap(Map<String, dynamic> data) =>
      FlashcardsRetrievalStatusStruct(
        id: castToType<int>(data['id']),
        status: data['status'] as String?,
        toReviewAgainThisSessionCount:
            castToType<int>(data['toReviewAgainThisSessionCount']),
        currentRetrievalStep: castToType<int>(data['currentRetrievalStep']),
        hasMentalImage: data['hasMentalImage'] as bool?,
      );

  static FlashcardsRetrievalStatusStruct? maybeFromMap(dynamic data) => data
          is Map
      ? FlashcardsRetrievalStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'toReviewAgainThisSessionCount': _toReviewAgainThisSessionCount,
        'currentRetrievalStep': _currentRetrievalStep,
        'hasMentalImage': _hasMentalImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'toReviewAgainThisSessionCount': serializeParam(
          _toReviewAgainThisSessionCount,
          ParamType.int,
        ),
        'currentRetrievalStep': serializeParam(
          _currentRetrievalStep,
          ParamType.int,
        ),
        'hasMentalImage': serializeParam(
          _hasMentalImage,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FlashcardsRetrievalStatusStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FlashcardsRetrievalStatusStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        toReviewAgainThisSessionCount: deserializeParam(
          data['toReviewAgainThisSessionCount'],
          ParamType.int,
          false,
        ),
        currentRetrievalStep: deserializeParam(
          data['currentRetrievalStep'],
          ParamType.int,
          false,
        ),
        hasMentalImage: deserializeParam(
          data['hasMentalImage'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FlashcardsRetrievalStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlashcardsRetrievalStatusStruct &&
        id == other.id &&
        status == other.status &&
        toReviewAgainThisSessionCount == other.toReviewAgainThisSessionCount &&
        currentRetrievalStep == other.currentRetrievalStep &&
        hasMentalImage == other.hasMentalImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        toReviewAgainThisSessionCount,
        currentRetrievalStep,
        hasMentalImage
      ]);
}

FlashcardsRetrievalStatusStruct createFlashcardsRetrievalStatusStruct({
  int? id,
  String? status,
  int? toReviewAgainThisSessionCount,
  int? currentRetrievalStep,
  bool? hasMentalImage,
}) =>
    FlashcardsRetrievalStatusStruct(
      id: id,
      status: status,
      toReviewAgainThisSessionCount: toReviewAgainThisSessionCount,
      currentRetrievalStep: currentRetrievalStep,
      hasMentalImage: hasMentalImage,
    );
