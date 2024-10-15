import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/ui/list_crud_row/list_crud_row_widget.dart';
import '/components/ui/tag_list/tag_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'flashcards_screen_widget.dart' show FlashcardsScreenWidget;
import 'package:flutter/material.dart';

class FlashcardsScreenModel extends FlutterFlowModel<FlashcardsScreenWidget> {
  ///  Local state fields for this page.

  bool isCreatingFlashcard = false;

  bool isShowingDelete = false;

  int? showingDeleteRowId = 0;

  List<TagStruct> allTagsState = [];
  void addToAllTagsState(TagStruct item) => allTagsState.add(item);
  void removeFromAllTagsState(TagStruct item) => allTagsState.remove(item);
  void removeAtIndexFromAllTagsState(int index) => allTagsState.removeAt(index);
  void insertAtIndexInAllTagsState(int index, TagStruct item) =>
      allTagsState.insert(index, item);
  void updateAllTagsStateAtIndex(int index, Function(TagStruct) updateFn) =>
      allTagsState[index] = updateFn(allTagsState[index]);

  List<TagStruct> selectedTagState = [];
  void addToSelectedTagState(TagStruct item) => selectedTagState.add(item);
  void removeFromSelectedTagState(TagStruct item) =>
      selectedTagState.remove(item);
  void removeAtIndexFromSelectedTagState(int index) =>
      selectedTagState.removeAt(index);
  void insertAtIndexInSelectedTagState(int index, TagStruct item) =>
      selectedTagState.insert(index, item);
  void updateSelectedTagStateAtIndex(int index, Function(TagStruct) updateFn) =>
      selectedTagState[index] = updateFn(selectedTagState[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (Deck Read 1 from id)] action in FlashcardsScreen widget.
  List<DeckRead1FromIdRow>? deckInfos;
  // Models for ListCrudRow dynamic component.
  late FlutterFlowDynamicModels<ListCrudRowModel> listCrudRowModels;
  // Stores action output result for [Backend Call - SQLite (Tags GET all)] action in AddFlashcardButton widget.
  List<TagsGETAllRow>? allTags;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // State field(s) for TextRectoField widget.
  FocusNode? textRectoFieldFocusNode;
  TextEditingController? textRectoFieldTextController;
  String? Function(BuildContext, String?)?
      textRectoFieldTextControllerValidator;
  // State field(s) for TextVersoField widget.
  FocusNode? textVersoFieldFocusNode;
  TextEditingController? textVersoFieldTextController;
  String? Function(BuildContext, String?)?
      textVersoFieldTextControllerValidator;
  // Model for tagList component.
  late TagListModel tagListModel;
  // Stores action output result for [Backend Call - SQLite (flashcards SELECT Last id)] action in CreateFlashcardButton widget.
  List<FlashcardsSELECTLastIdRow>? lastFlashcardId;

  @override
  void initState(BuildContext context) {
    listCrudRowModels = FlutterFlowDynamicModels(() => ListCrudRowModel());
    tagListModel = createModel(context, () => TagListModel());
  }

  @override
  void dispose() {
    listCrudRowModels.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    textRectoFieldFocusNode?.dispose();
    textRectoFieldTextController?.dispose();

    textVersoFieldFocusNode?.dispose();
    textVersoFieldTextController?.dispose();

    tagListModel.dispose();
  }

  /// Action blocks.
  Future flashcardCreation(BuildContext context) async {}
}
