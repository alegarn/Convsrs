import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/tags_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'cheatsheet_rows_screen_widget.dart' show CheatsheetRowsScreenWidget;
import 'package:flutter/material.dart';

class CheatsheetRowsScreenModel
    extends FlutterFlowModel<CheatsheetRowsScreenWidget> {
  ///  Local state fields for this page.

  bool isCreatingRow = false;

  bool isDeleting = false;

  List<TagStruct> selectedTagsState = [];
  void addToSelectedTagsState(TagStruct item) => selectedTagsState.add(item);
  void removeFromSelectedTagsState(TagStruct item) =>
      selectedTagsState.remove(item);
  void removeAtIndexFromSelectedTagsState(int index) =>
      selectedTagsState.removeAt(index);
  void insertAtIndexInSelectedTagsState(int index, TagStruct item) =>
      selectedTagsState.insert(index, item);
  void updateSelectedTagsStateAtIndex(
          int index, Function(TagStruct) updateFn) =>
      selectedTagsState[index] = updateFn(selectedTagsState[index]);

  List<TagStruct> allTagsState = [];
  void addToAllTagsState(TagStruct item) => allTagsState.add(item);
  void removeFromAllTagsState(TagStruct item) => allTagsState.remove(item);
  void removeAtIndexFromAllTagsState(int index) => allTagsState.removeAt(index);
  void insertAtIndexInAllTagsState(int index, TagStruct item) =>
      allTagsState.insert(index, item);
  void updateAllTagsStateAtIndex(int index, Function(TagStruct) updateFn) =>
      allTagsState[index] = updateFn(allTagsState[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for CheatsheetRowConceptField widget.
  FocusNode? cheatsheetRowConceptFieldFocusNode;
  TextEditingController? cheatsheetRowConceptFieldTextController;
  String? Function(BuildContext, String?)?
      cheatsheetRowConceptFieldTextControllerValidator;
  // State field(s) for CheatsheetRowDescriptionField widget.
  FocusNode? cheatsheetRowDescriptionFieldFocusNode;
  TextEditingController? cheatsheetRowDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      cheatsheetRowDescriptionFieldTextControllerValidator;
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
  // Model for SelectedTagsList.
  late TagsListModel selectedTagsListModel;
  // Model for AllTagsList.
  late TagsListModel allTagsListModel;

  @override
  void initState(BuildContext context) {
    selectedTagsListModel = createModel(context, () => TagsListModel());
    allTagsListModel = createModel(context, () => TagsListModel());
  }

  @override
  void dispose() {
    cheatsheetRowConceptFieldFocusNode?.dispose();
    cheatsheetRowConceptFieldTextController?.dispose();

    cheatsheetRowDescriptionFieldFocusNode?.dispose();
    cheatsheetRowDescriptionFieldTextController?.dispose();

    newTagFieldFocusNode?.dispose();
    newTagFieldTextController?.dispose();

    selectedTagsListModel.dispose();
    allTagsListModel.dispose();
  }

  /// Action blocks.
  Future getTagsInStateCheatsheetRows(BuildContext context) async {
    List<TagsGETAllFromCtgRow>? allTagsParameter;
    List<TagStruct>? selectedTagsParameter;

    // Get all tags
    allTagsParameter = await SQLiteManager.instance.tagsGETAllFromCtg(
      category: 'cheatsheetRow',
    );
    // Get selected tags from Ids
    selectedTagsParameter = await actions.getSelectedTagsFromTagIds(
      '[1]',
    );
    // Update selectedTags states
    selectedTagsState = selectedTagsParameter.toList().cast<TagStruct>();
    // Filter allTags
    allTagsState = functions
        .filterSelectedTagsInAllTags(selectedTagsState.toList(),
            functions.formatNewTags(allTagsParameter.toList()).toList())
        .toList()
        .cast<TagStruct>();
  }
}
