import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/ui/list_crud_row/list_crud_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'flashcards_screen_widget.dart' show FlashcardsScreenWidget;
import 'package:flutter/material.dart';

class FlashcardsScreenModel extends FlutterFlowModel<FlashcardsScreenWidget> {
  ///  Local state fields for this page.

  bool isCreatingFlashcard = false;

  bool isShowingDelete = false;

  int? showingDeleteRowId = 0;

  List<TagStruct> selectedTagsPageState = [];
  void addToSelectedTagsPageState(TagStruct item) =>
      selectedTagsPageState.add(item);
  void removeFromSelectedTagsPageState(TagStruct item) =>
      selectedTagsPageState.remove(item);
  void removeAtIndexFromSelectedTagsPageState(int index) =>
      selectedTagsPageState.removeAt(index);
  void insertAtIndexInSelectedTagsPageState(int index, TagStruct item) =>
      selectedTagsPageState.insert(index, item);
  void updateSelectedTagsPageStateAtIndex(
          int index, Function(TagStruct) updateFn) =>
      selectedTagsPageState[index] = updateFn(selectedTagsPageState[index]);

  List<TagStruct> allTagsPageState = [];
  void addToAllTagsPageState(TagStruct item) => allTagsPageState.add(item);
  void removeFromAllTagsPageState(TagStruct item) =>
      allTagsPageState.remove(item);
  void removeAtIndexFromAllTagsPageState(int index) =>
      allTagsPageState.removeAt(index);
  void insertAtIndexInAllTagsPageState(int index, TagStruct item) =>
      allTagsPageState.insert(index, item);
  void updateAllTagsPageStateAtIndex(int index, Function(TagStruct) updateFn) =>
      allTagsPageState[index] = updateFn(allTagsPageState[index]);

  List<DecksFlashcardForListStruct> flashcardsState = [];
  void addToFlashcardsState(DecksFlashcardForListStruct item) =>
      flashcardsState.add(item);
  void removeFromFlashcardsState(DecksFlashcardForListStruct item) =>
      flashcardsState.remove(item);
  void removeAtIndexFromFlashcardsState(int index) =>
      flashcardsState.removeAt(index);
  void insertAtIndexInFlashcardsState(
          int index, DecksFlashcardForListStruct item) =>
      flashcardsState.insert(index, item);
  void updateFlashcardsStateAtIndex(
          int index, Function(DecksFlashcardForListStruct) updateFn) =>
      flashcardsState[index] = updateFn(flashcardsState[index]);

  bool isFilterVisible = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (Deck Read 1 from id)] action in FlashcardsScreen widget.
  List<DeckRead1FromIdRow>? deckInfos;
  // Stores action output result for [Backend Call - SQLite (Flashcards read all from deck name and id)] action in FlashcardsScreen widget.
  List<FlashcardsReadAllFromDeckNameAndIdRow>? deckFlashcards;
  // State field(s) for FilterTextField widget.
  FocusNode? filterTextFieldFocusNode;
  TextEditingController? filterTextFieldTextController;
  String? Function(BuildContext, String?)?
      filterTextFieldTextControllerValidator;
  // Models for FlashcardListCrudRow.
  late FlutterFlowDynamicModels<ListCrudRowModel> flashcardListCrudRowModels;
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
  // Stores action output result for [Backend Call - SQLite (flashcards SELECT Last id)] action in CreateFlashcardButton widget.
  List<FlashcardsSELECTLastIdRow>? lastFlashcardId;
  // Stores action output result for [Backend Call - SQLite (Flashcards read all from deck name and id)] action in CreateFlashcardButton widget.
  List<FlashcardsReadAllFromDeckNameAndIdRow>? deckFlashcardsOncreation;

  @override
  void initState(BuildContext context) {
    flashcardListCrudRowModels =
        FlutterFlowDynamicModels(() => ListCrudRowModel());
  }

  @override
  void dispose() {
    filterTextFieldFocusNode?.dispose();
    filterTextFieldTextController?.dispose();

    flashcardListCrudRowModels.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    textRectoFieldFocusNode?.dispose();
    textRectoFieldTextController?.dispose();

    textVersoFieldFocusNode?.dispose();
    textVersoFieldTextController?.dispose();

    newTagFieldFocusNode?.dispose();
    newTagFieldTextController?.dispose();
  }

  /// Action blocks.
  Future getTagsInState(BuildContext context) async {
    List<TagsGETAllFromCtgRow>? allTagsForState;

    // Get all Tags
    allTagsForState = await SQLiteManager.instance.tagsGETAllFromCtg(
      category: 'flashcard',
    );
    // Get allTags in state
    allTagsPageState = functions
        .formatNewTags(allTagsForState.toList())
        .toList()
        .cast<TagStruct>();
    // Add no_tag to selectedTags (test notà
    selectedTagsPageState =
        functions.newSelectedTag().toList().cast<TagStruct>();
    // allTags update
    allTagsPageState = functions
        .filterSelectedTagsInAllTags(selectedTagsPageState.toList(),
            functions.formatNewTags(allTagsForState.toList()).toList())
        .toList()
        .cast<TagStruct>();
  }
}
