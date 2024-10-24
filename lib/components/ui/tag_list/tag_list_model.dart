import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tag_list_widget.dart' show TagListWidget;
import 'package:flutter/material.dart';

class TagListModel extends FlutterFlowModel<TagListWidget> {
  ///  Local state fields for this component.

  List<TagStruct> selectedTagsComponentState = [];
  void addToSelectedTagsComponentState(TagStruct item) =>
      selectedTagsComponentState.add(item);
  void removeFromSelectedTagsComponentState(TagStruct item) =>
      selectedTagsComponentState.remove(item);
  void removeAtIndexFromSelectedTagsComponentState(int index) =>
      selectedTagsComponentState.removeAt(index);
  void insertAtIndexInSelectedTagsComponentState(int index, TagStruct item) =>
      selectedTagsComponentState.insert(index, item);
  void updateSelectedTagsComponentStateAtIndex(
          int index, Function(TagStruct) updateFn) =>
      selectedTagsComponentState[index] =
          updateFn(selectedTagsComponentState[index]);

  List<TagStruct> allTagsComponentState = [];
  void addToAllTagsComponentState(TagStruct item) =>
      allTagsComponentState.add(item);
  void removeFromAllTagsComponentState(TagStruct item) =>
      allTagsComponentState.remove(item);
  void removeAtIndexFromAllTagsComponentState(int index) =>
      allTagsComponentState.removeAt(index);
  void insertAtIndexInAllTagsComponentState(int index, TagStruct item) =>
      allTagsComponentState.insert(index, item);
  void updateAllTagsComponentStateAtIndex(
          int index, Function(TagStruct) updateFn) =>
      allTagsComponentState[index] = updateFn(allTagsComponentState[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for NewTagField widget.
  FocusNode? newTagFieldFocusNode;
  TextEditingController? newTagFieldTextController;
  String? Function(BuildContext, String?)? newTagFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newTagFieldFocusNode?.dispose();
    newTagFieldTextController?.dispose();
  }
}
