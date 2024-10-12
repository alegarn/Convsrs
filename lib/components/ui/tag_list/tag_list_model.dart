import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tag_list_widget.dart' show TagListWidget;
import 'package:flutter/material.dart';

class TagListModel extends FlutterFlowModel<TagListWidget> {
  ///  Local state fields for this component.

  List<TagStruct> tagList = [];
  void addToTagList(TagStruct item) => tagList.add(item);
  void removeFromTagList(TagStruct item) => tagList.remove(item);
  void removeAtIndexFromTagList(int index) => tagList.removeAt(index);
  void insertAtIndexInTagList(int index, TagStruct item) =>
      tagList.insert(index, item);
  void updateTagListAtIndex(int index, Function(TagStruct) updateFn) =>
      tagList[index] = updateFn(tagList[index]);

  List<TagStruct> selectedTagList = [];
  void addToSelectedTagList(TagStruct item) => selectedTagList.add(item);
  void removeFromSelectedTagList(TagStruct item) =>
      selectedTagList.remove(item);
  void removeAtIndexFromSelectedTagList(int index) =>
      selectedTagList.removeAt(index);
  void insertAtIndexInSelectedTagList(int index, TagStruct item) =>
      selectedTagList.insert(index, item);
  void updateSelectedTagListAtIndex(int index, Function(TagStruct) updateFn) =>
      selectedTagList[index] = updateFn(selectedTagList[index]);

  String newTag = 'no_tag';

  List<TagStruct> allTagsState = [];
  void addToAllTagsState(TagStruct item) => allTagsState.add(item);
  void removeFromAllTagsState(TagStruct item) => allTagsState.remove(item);
  void removeAtIndexFromAllTagsState(int index) => allTagsState.removeAt(index);
  void insertAtIndexInAllTagsState(int index, TagStruct item) =>
      allTagsState.insert(index, item);
  void updateAllTagsStateAtIndex(int index, Function(TagStruct) updateFn) =>
      allTagsState[index] = updateFn(allTagsState[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for NewTagField widget.
  FocusNode? newTagFieldFocusNode;
  TextEditingController? newTagFieldTextController;
  String? Function(BuildContext, String?)? newTagFieldTextControllerValidator;
  // Stores action output result for [Backend Call - SQLite (Tags GET all)] action in NewTagField widget.
  List<TagsGETAllRow>? allTagsNew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newTagFieldFocusNode?.dispose();
    newTagFieldTextController?.dispose();
  }
}
