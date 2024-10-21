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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (Deck Read 1 from id)] action in FlashcardsScreen widget.
  List<DeckRead1FromIdRow>? deckInfos;
  // Stores action output result for [Backend Call - SQLite (Tags GET all)] action in FlashcardsScreen widget.
  List<TagsGETAllRow>? allTagsForState;
  // Models for FlashcardListCrudRow.
  late FlutterFlowDynamicModels<ListCrudRowModel> flashcardListCrudRowModels;
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
  // Stores action output result for [Backend Call - SQLite (Tags GET all)] action in tagList widget.
  List<TagsGETAllRow>? allTagsNew;
  // Stores action output result for [Backend Call - SQLite (flashcards SELECT Last id)] action in CreateFlashcardButton widget.
  List<FlashcardsSELECTLastIdRow>? lastFlashcardId;

  @override
  void initState(BuildContext context) {
    flashcardListCrudRowModels =
        FlutterFlowDynamicModels(() => ListCrudRowModel());
    tagListModel = createModel(context, () => TagListModel());
  }

  @override
  void dispose() {
    flashcardListCrudRowModels.dispose();
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
