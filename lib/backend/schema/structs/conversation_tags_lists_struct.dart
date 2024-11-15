// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConversationTagsListsStruct extends BaseStruct {
  ConversationTagsListsStruct({
    List<TagStruct>? tagsLists,
    List<FlashcardConversationStatusStruct>? flashcardInfosList,
  })  : _tagsLists = tagsLists,
        _flashcardInfosList = flashcardInfosList;

  // "tagsLists" field.
  List<TagStruct>? _tagsLists;
  List<TagStruct> get tagsLists => _tagsLists ?? const [];
  set tagsLists(List<TagStruct>? val) => _tagsLists = val;

  void updateTagsLists(Function(List<TagStruct>) updateFn) {
    updateFn(_tagsLists ??= []);
  }

  bool hasTagsLists() => _tagsLists != null;

  // "flashcardInfosList" field.
  List<FlashcardConversationStatusStruct>? _flashcardInfosList;
  List<FlashcardConversationStatusStruct> get flashcardInfosList =>
      _flashcardInfosList ?? const [];
  set flashcardInfosList(List<FlashcardConversationStatusStruct>? val) =>
      _flashcardInfosList = val;

  void updateFlashcardInfosList(
      Function(List<FlashcardConversationStatusStruct>) updateFn) {
    updateFn(_flashcardInfosList ??= []);
  }

  bool hasFlashcardInfosList() => _flashcardInfosList != null;

  static ConversationTagsListsStruct fromMap(Map<String, dynamic> data) =>
      ConversationTagsListsStruct(
        tagsLists: getStructList(
          data['tagsLists'],
          TagStruct.fromMap,
        ),
        flashcardInfosList: getStructList(
          data['flashcardInfosList'],
          FlashcardConversationStatusStruct.fromMap,
        ),
      );

  static ConversationTagsListsStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversationTagsListsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tagsLists': _tagsLists?.map((e) => e.toMap()).toList(),
        'flashcardInfosList':
            _flashcardInfosList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tagsLists': serializeParam(
          _tagsLists,
          ParamType.DataStruct,
          isList: true,
        ),
        'flashcardInfosList': serializeParam(
          _flashcardInfosList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ConversationTagsListsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConversationTagsListsStruct(
        tagsLists: deserializeStructParam<TagStruct>(
          data['tagsLists'],
          ParamType.DataStruct,
          true,
          structBuilder: TagStruct.fromSerializableMap,
        ),
        flashcardInfosList:
            deserializeStructParam<FlashcardConversationStatusStruct>(
          data['flashcardInfosList'],
          ParamType.DataStruct,
          true,
          structBuilder: FlashcardConversationStatusStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ConversationTagsListsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConversationTagsListsStruct &&
        listEquality.equals(tagsLists, other.tagsLists) &&
        listEquality.equals(flashcardInfosList, other.flashcardInfosList);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tagsLists, flashcardInfosList]);
}

ConversationTagsListsStruct createConversationTagsListsStruct() =>
    ConversationTagsListsStruct();
