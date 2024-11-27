import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cheatsheet_rows_update_screen_widget.dart'
    show CheatsheetRowsUpdateScreenWidget;
import 'package:flutter/material.dart';

class CheatsheetRowsUpdateScreenModel
    extends FlutterFlowModel<CheatsheetRowsUpdateScreenWidget> {
  ///  Local state fields for this page.

  List<TagStruct> allTags = [];
  void addToAllTags(TagStruct item) => allTags.add(item);
  void removeFromAllTags(TagStruct item) => allTags.remove(item);
  void removeAtIndexFromAllTags(int index) => allTags.removeAt(index);
  void insertAtIndexInAllTags(int index, TagStruct item) =>
      allTags.insert(index, item);
  void updateAllTagsAtIndex(int index, Function(TagStruct) updateFn) =>
      allTags[index] = updateFn(allTags[index]);

  List<TagStruct> selectedTags = [];
  void addToSelectedTags(TagStruct item) => selectedTags.add(item);
  void removeFromSelectedTags(TagStruct item) => selectedTags.remove(item);
  void removeAtIndexFromSelectedTags(int index) => selectedTags.removeAt(index);
  void insertAtIndexInSelectedTags(int index, TagStruct item) =>
      selectedTags.insert(index, item);
  void updateSelectedTagsAtIndex(int index, Function(TagStruct) updateFn) =>
      selectedTags[index] = updateFn(selectedTags[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (Tags GET all from ctg)] action in CheatsheetRowsUpdateScreen widget.
  List<TagsGETAllFromCtgRow>? allTagsOutput;
  // Stores action output result for [Custom Action - getSelectedTagsFromTagIds] action in CheatsheetRowsUpdateScreen widget.
  List<TagStruct>? selectedTagsOutput;
  // State field(s) for ConceptTextField widget.
  FocusNode? conceptTextFieldFocusNode;
  TextEditingController? conceptTextFieldTextController;
  String? Function(BuildContext, String?)?
      conceptTextFieldTextControllerValidator;
  // State field(s) for DescriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;
  // State field(s) for NewTagField widget.
  FocusNode? newTagFieldFocusNode;
  TextEditingController? newTagFieldTextController;
  String? Function(BuildContext, String?)? newTagFieldTextControllerValidator;
  // Stores action output result for [Custom Action - verifyIfTagExist] action in NewTagField widget.
  String? tagExistString;
  // Stores action output result for [Backend Call - SQLite (Tags GET all from ctg)] action in NewTagField widget.
  List<TagsGETAllFromCtgRow>? allTagsNewFalse;
  // Stores action output result for [Backend Call - SQLite (Tags GET all from ctg)] action in NewTagField widget.
  List<TagsGETAllFromCtgRow>? allTagsNewUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    conceptTextFieldFocusNode?.dispose();
    conceptTextFieldTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();

    newTagFieldFocusNode?.dispose();
    newTagFieldTextController?.dispose();
  }
}
