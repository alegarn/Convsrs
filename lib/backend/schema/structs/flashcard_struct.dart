// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlashcardStruct extends BaseStruct {
  FlashcardStruct({
    int? id,
    String? userId,
    String? name,
    String? textRecto,
    String? textVerso,
    int? currentRetrievalStep,
    int? currentSpeakingStep,
    int? toRecall,
    String? currentSpeakingDate,
    String? nextSpeakingDate,
    int? successCount,
    int? totalReviewCount,
    int? mentalImageBool,
    String? audioRectoUrl,
    String? audioVersoUrl,
    String? imageRectoUrl,
    String? imageVersoUrl,
    String? currentRecallDate,
    String? nextRecallDate,
    String? tagIds,
  })  : _id = id,
        _userId = userId,
        _name = name,
        _textRecto = textRecto,
        _textVerso = textVerso,
        _currentRetrievalStep = currentRetrievalStep,
        _currentSpeakingStep = currentSpeakingStep,
        _toRecall = toRecall,
        _currentSpeakingDate = currentSpeakingDate,
        _nextSpeakingDate = nextSpeakingDate,
        _successCount = successCount,
        _totalReviewCount = totalReviewCount,
        _mentalImageBool = mentalImageBool,
        _audioRectoUrl = audioRectoUrl,
        _audioVersoUrl = audioVersoUrl,
        _imageRectoUrl = imageRectoUrl,
        _imageVersoUrl = imageVersoUrl,
        _currentRecallDate = currentRecallDate,
        _nextRecallDate = nextRecallDate,
        _tagIds = tagIds;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? 'aaaa';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? 'aaaa';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "textRecto" field.
  String? _textRecto;
  String get textRecto => _textRecto ?? 'none';
  set textRecto(String? val) => _textRecto = val;

  bool hasTextRecto() => _textRecto != null;

  // "textVerso" field.
  String? _textVerso;
  String get textVerso => _textVerso ?? 'none';
  set textVerso(String? val) => _textVerso = val;

  bool hasTextVerso() => _textVerso != null;

  // "currentRetrievalStep" field.
  int? _currentRetrievalStep;
  int get currentRetrievalStep => _currentRetrievalStep ?? 0;
  set currentRetrievalStep(int? val) => _currentRetrievalStep = val;

  void incrementCurrentRetrievalStep(int amount) =>
      currentRetrievalStep = currentRetrievalStep + amount;

  bool hasCurrentRetrievalStep() => _currentRetrievalStep != null;

  // "currentSpeakingStep" field.
  int? _currentSpeakingStep;
  int get currentSpeakingStep => _currentSpeakingStep ?? 1;
  set currentSpeakingStep(int? val) => _currentSpeakingStep = val;

  void incrementCurrentSpeakingStep(int amount) =>
      currentSpeakingStep = currentSpeakingStep + amount;

  bool hasCurrentSpeakingStep() => _currentSpeakingStep != null;

  // "toRecall" field.
  int? _toRecall;
  int get toRecall => _toRecall ?? 0;
  set toRecall(int? val) => _toRecall = val;

  void incrementToRecall(int amount) => toRecall = toRecall + amount;

  bool hasToRecall() => _toRecall != null;

  // "currentSpeakingDate" field.
  String? _currentSpeakingDate;
  String get currentSpeakingDate => _currentSpeakingDate ?? 'none';
  set currentSpeakingDate(String? val) => _currentSpeakingDate = val;

  bool hasCurrentSpeakingDate() => _currentSpeakingDate != null;

  // "nextSpeakingDate" field.
  String? _nextSpeakingDate;
  String get nextSpeakingDate => _nextSpeakingDate ?? 'none';
  set nextSpeakingDate(String? val) => _nextSpeakingDate = val;

  bool hasNextSpeakingDate() => _nextSpeakingDate != null;

  // "successCount" field.
  int? _successCount;
  int get successCount => _successCount ?? 0;
  set successCount(int? val) => _successCount = val;

  void incrementSuccessCount(int amount) =>
      successCount = successCount + amount;

  bool hasSuccessCount() => _successCount != null;

  // "totalReviewCount" field.
  int? _totalReviewCount;
  int get totalReviewCount => _totalReviewCount ?? 0;
  set totalReviewCount(int? val) => _totalReviewCount = val;

  void incrementTotalReviewCount(int amount) =>
      totalReviewCount = totalReviewCount + amount;

  bool hasTotalReviewCount() => _totalReviewCount != null;

  // "mentalImageBool" field.
  int? _mentalImageBool;
  int get mentalImageBool => _mentalImageBool ?? 0;
  set mentalImageBool(int? val) => _mentalImageBool = val;

  void incrementMentalImageBool(int amount) =>
      mentalImageBool = mentalImageBool + amount;

  bool hasMentalImageBool() => _mentalImageBool != null;

  // "audioRectoUrl" field.
  String? _audioRectoUrl;
  String get audioRectoUrl => _audioRectoUrl ?? 'none';
  set audioRectoUrl(String? val) => _audioRectoUrl = val;

  bool hasAudioRectoUrl() => _audioRectoUrl != null;

  // "audioVersoUrl" field.
  String? _audioVersoUrl;
  String get audioVersoUrl => _audioVersoUrl ?? 'none';
  set audioVersoUrl(String? val) => _audioVersoUrl = val;

  bool hasAudioVersoUrl() => _audioVersoUrl != null;

  // "imageRectoUrl" field.
  String? _imageRectoUrl;
  String get imageRectoUrl => _imageRectoUrl ?? 'none';
  set imageRectoUrl(String? val) => _imageRectoUrl = val;

  bool hasImageRectoUrl() => _imageRectoUrl != null;

  // "imageVersoUrl" field.
  String? _imageVersoUrl;
  String get imageVersoUrl => _imageVersoUrl ?? 'none';
  set imageVersoUrl(String? val) => _imageVersoUrl = val;

  bool hasImageVersoUrl() => _imageVersoUrl != null;

  // "currentRecallDate" field.
  String? _currentRecallDate;
  String get currentRecallDate => _currentRecallDate ?? 'none';
  set currentRecallDate(String? val) => _currentRecallDate = val;

  bool hasCurrentRecallDate() => _currentRecallDate != null;

  // "nextRecallDate" field.
  String? _nextRecallDate;
  String get nextRecallDate => _nextRecallDate ?? 'none';
  set nextRecallDate(String? val) => _nextRecallDate = val;

  bool hasNextRecallDate() => _nextRecallDate != null;

  // "tagIds" field.
  String? _tagIds;
  String get tagIds => _tagIds ?? '\"[1]\"';
  set tagIds(String? val) => _tagIds = val;

  bool hasTagIds() => _tagIds != null;

  static FlashcardStruct fromMap(Map<String, dynamic> data) => FlashcardStruct(
        id: castToType<int>(data['id']),
        userId: data['userId'] as String?,
        name: data['name'] as String?,
        textRecto: data['textRecto'] as String?,
        textVerso: data['textVerso'] as String?,
        currentRetrievalStep: castToType<int>(data['currentRetrievalStep']),
        currentSpeakingStep: castToType<int>(data['currentSpeakingStep']),
        toRecall: castToType<int>(data['toRecall']),
        currentSpeakingDate: data['currentSpeakingDate'] as String?,
        nextSpeakingDate: data['nextSpeakingDate'] as String?,
        successCount: castToType<int>(data['successCount']),
        totalReviewCount: castToType<int>(data['totalReviewCount']),
        mentalImageBool: castToType<int>(data['mentalImageBool']),
        audioRectoUrl: data['audioRectoUrl'] as String?,
        audioVersoUrl: data['audioVersoUrl'] as String?,
        imageRectoUrl: data['imageRectoUrl'] as String?,
        imageVersoUrl: data['imageVersoUrl'] as String?,
        currentRecallDate: data['currentRecallDate'] as String?,
        nextRecallDate: data['nextRecallDate'] as String?,
        tagIds: data['tagIds'] as String?,
      );

  static FlashcardStruct? maybeFromMap(dynamic data) => data is Map
      ? FlashcardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'name': _name,
        'textRecto': _textRecto,
        'textVerso': _textVerso,
        'currentRetrievalStep': _currentRetrievalStep,
        'currentSpeakingStep': _currentSpeakingStep,
        'toRecall': _toRecall,
        'currentSpeakingDate': _currentSpeakingDate,
        'nextSpeakingDate': _nextSpeakingDate,
        'successCount': _successCount,
        'totalReviewCount': _totalReviewCount,
        'mentalImageBool': _mentalImageBool,
        'audioRectoUrl': _audioRectoUrl,
        'audioVersoUrl': _audioVersoUrl,
        'imageRectoUrl': _imageRectoUrl,
        'imageVersoUrl': _imageVersoUrl,
        'currentRecallDate': _currentRecallDate,
        'nextRecallDate': _nextRecallDate,
        'tagIds': _tagIds,
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
        'textRecto': serializeParam(
          _textRecto,
          ParamType.String,
        ),
        'textVerso': serializeParam(
          _textVerso,
          ParamType.String,
        ),
        'currentRetrievalStep': serializeParam(
          _currentRetrievalStep,
          ParamType.int,
        ),
        'currentSpeakingStep': serializeParam(
          _currentSpeakingStep,
          ParamType.int,
        ),
        'toRecall': serializeParam(
          _toRecall,
          ParamType.int,
        ),
        'currentSpeakingDate': serializeParam(
          _currentSpeakingDate,
          ParamType.String,
        ),
        'nextSpeakingDate': serializeParam(
          _nextSpeakingDate,
          ParamType.String,
        ),
        'successCount': serializeParam(
          _successCount,
          ParamType.int,
        ),
        'totalReviewCount': serializeParam(
          _totalReviewCount,
          ParamType.int,
        ),
        'mentalImageBool': serializeParam(
          _mentalImageBool,
          ParamType.int,
        ),
        'audioRectoUrl': serializeParam(
          _audioRectoUrl,
          ParamType.String,
        ),
        'audioVersoUrl': serializeParam(
          _audioVersoUrl,
          ParamType.String,
        ),
        'imageRectoUrl': serializeParam(
          _imageRectoUrl,
          ParamType.String,
        ),
        'imageVersoUrl': serializeParam(
          _imageVersoUrl,
          ParamType.String,
        ),
        'currentRecallDate': serializeParam(
          _currentRecallDate,
          ParamType.String,
        ),
        'nextRecallDate': serializeParam(
          _nextRecallDate,
          ParamType.String,
        ),
        'tagIds': serializeParam(
          _tagIds,
          ParamType.String,
        ),
      }.withoutNulls;

  static FlashcardStruct fromSerializableMap(Map<String, dynamic> data) =>
      FlashcardStruct(
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
        textRecto: deserializeParam(
          data['textRecto'],
          ParamType.String,
          false,
        ),
        textVerso: deserializeParam(
          data['textVerso'],
          ParamType.String,
          false,
        ),
        currentRetrievalStep: deserializeParam(
          data['currentRetrievalStep'],
          ParamType.int,
          false,
        ),
        currentSpeakingStep: deserializeParam(
          data['currentSpeakingStep'],
          ParamType.int,
          false,
        ),
        toRecall: deserializeParam(
          data['toRecall'],
          ParamType.int,
          false,
        ),
        currentSpeakingDate: deserializeParam(
          data['currentSpeakingDate'],
          ParamType.String,
          false,
        ),
        nextSpeakingDate: deserializeParam(
          data['nextSpeakingDate'],
          ParamType.String,
          false,
        ),
        successCount: deserializeParam(
          data['successCount'],
          ParamType.int,
          false,
        ),
        totalReviewCount: deserializeParam(
          data['totalReviewCount'],
          ParamType.int,
          false,
        ),
        mentalImageBool: deserializeParam(
          data['mentalImageBool'],
          ParamType.int,
          false,
        ),
        audioRectoUrl: deserializeParam(
          data['audioRectoUrl'],
          ParamType.String,
          false,
        ),
        audioVersoUrl: deserializeParam(
          data['audioVersoUrl'],
          ParamType.String,
          false,
        ),
        imageRectoUrl: deserializeParam(
          data['imageRectoUrl'],
          ParamType.String,
          false,
        ),
        imageVersoUrl: deserializeParam(
          data['imageVersoUrl'],
          ParamType.String,
          false,
        ),
        currentRecallDate: deserializeParam(
          data['currentRecallDate'],
          ParamType.String,
          false,
        ),
        nextRecallDate: deserializeParam(
          data['nextRecallDate'],
          ParamType.String,
          false,
        ),
        tagIds: deserializeParam(
          data['tagIds'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FlashcardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FlashcardStruct &&
        id == other.id &&
        userId == other.userId &&
        name == other.name &&
        textRecto == other.textRecto &&
        textVerso == other.textVerso &&
        currentRetrievalStep == other.currentRetrievalStep &&
        currentSpeakingStep == other.currentSpeakingStep &&
        toRecall == other.toRecall &&
        currentSpeakingDate == other.currentSpeakingDate &&
        nextSpeakingDate == other.nextSpeakingDate &&
        successCount == other.successCount &&
        totalReviewCount == other.totalReviewCount &&
        mentalImageBool == other.mentalImageBool &&
        audioRectoUrl == other.audioRectoUrl &&
        audioVersoUrl == other.audioVersoUrl &&
        imageRectoUrl == other.imageRectoUrl &&
        imageVersoUrl == other.imageVersoUrl &&
        currentRecallDate == other.currentRecallDate &&
        nextRecallDate == other.nextRecallDate &&
        tagIds == other.tagIds;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        name,
        textRecto,
        textVerso,
        currentRetrievalStep,
        currentSpeakingStep,
        toRecall,
        currentSpeakingDate,
        nextSpeakingDate,
        successCount,
        totalReviewCount,
        mentalImageBool,
        audioRectoUrl,
        audioVersoUrl,
        imageRectoUrl,
        imageVersoUrl,
        currentRecallDate,
        nextRecallDate,
        tagIds
      ]);
}

FlashcardStruct createFlashcardStruct({
  int? id,
  String? userId,
  String? name,
  String? textRecto,
  String? textVerso,
  int? currentRetrievalStep,
  int? currentSpeakingStep,
  int? toRecall,
  String? currentSpeakingDate,
  String? nextSpeakingDate,
  int? successCount,
  int? totalReviewCount,
  int? mentalImageBool,
  String? audioRectoUrl,
  String? audioVersoUrl,
  String? imageRectoUrl,
  String? imageVersoUrl,
  String? currentRecallDate,
  String? nextRecallDate,
  String? tagIds,
}) =>
    FlashcardStruct(
      id: id,
      userId: userId,
      name: name,
      textRecto: textRecto,
      textVerso: textVerso,
      currentRetrievalStep: currentRetrievalStep,
      currentSpeakingStep: currentSpeakingStep,
      toRecall: toRecall,
      currentSpeakingDate: currentSpeakingDate,
      nextSpeakingDate: nextSpeakingDate,
      successCount: successCount,
      totalReviewCount: totalReviewCount,
      mentalImageBool: mentalImageBool,
      audioRectoUrl: audioRectoUrl,
      audioVersoUrl: audioVersoUrl,
      imageRectoUrl: imageRectoUrl,
      imageVersoUrl: imageVersoUrl,
      currentRecallDate: currentRecallDate,
      nextRecallDate: nextRecallDate,
      tagIds: tagIds,
    );
