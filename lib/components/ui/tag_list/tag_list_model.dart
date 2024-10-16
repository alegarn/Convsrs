import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tag_list_widget.dart' show TagListWidget;
import 'package:flutter/material.dart';

class TagListModel extends FlutterFlowModel<TagListWidget> {
  ///  Local state fields for this component.

  List<TagStruct> selectedTagListState = [];
  void addToSelectedTagListState(TagStruct item) =>
      selectedTagListState.add(item);
  void removeFromSelectedTagListState(TagStruct item) =>
      selectedTagListState.remove(item);
  void removeAtIndexFromSelectedTagListState(int index) =>
      selectedTagListState.removeAt(index);
  void insertAtIndexInSelectedTagListState(int index, TagStruct item) =>
      selectedTagListState.insert(index, item);
  void updateSelectedTagListStateAtIndex(
          int index, Function(TagStruct) updateFn) =>
      selectedTagListState[index] = updateFn(selectedTagListState[index]);

  String newTag = 'no_tag';

  List<TagStruct> allTagsListState = [];
  void addToAllTagsListState(TagStruct item) => allTagsListState.add(item);
  void removeFromAllTagsListState(TagStruct item) =>
      allTagsListState.remove(item);
  void removeAtIndexFromAllTagsListState(int index) =>
      allTagsListState.removeAt(index);
  void insertAtIndexInAllTagsListState(int index, TagStruct item) =>
      allTagsListState.insert(index, item);
  void updateAllTagsListStateAtIndex(int index, Function(TagStruct) updateFn) =>
      allTagsListState[index] = updateFn(allTagsListState[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - SQLite (Tags GET all)] action in tagList widget.
  List<TagsGETAllRow>? allTags;
  // Stores action output result for [Custom Action - getSelectedTagsFromTagIds] action in tagList widget.
  List<TagStruct>? selectedTag;
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
