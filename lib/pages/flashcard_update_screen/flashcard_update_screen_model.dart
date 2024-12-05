import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/flashcard_component/insert_audio_flashcard/insert_audio_flashcard_widget.dart';
import '/components/ui/tags_list/tags_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'flashcard_update_screen_widget.dart' show FlashcardUpdateScreenWidget;
import 'package:flutter/material.dart';

class FlashcardUpdateScreenModel
    extends FlutterFlowModel<FlashcardUpdateScreenWidget> {
  ///  Local state fields for this page.

  String name = 'name';

  String userId = 'aaa';

  String textRecto = 'recto card text';

  String textVerso = 'verso card text';

  String audioRectoUrl = 'none';

  String audioVersoUrl = 'none';

  String imageRectoUrl = 'none';

  String imageVersoUrl = 'none';

  int currentRetrievalStep = 0;

  int currentSpeakingStep = 0;

  int toRecall = 0;

  FlashcardRead1WithIdRow? flashcardInfos;

  bool showRecto = true;

  String currentRecallDate = 'none';

  String? tagIdsState = 'tagIdsState';

  List<TagStruct> selectedTags = [];
  void addToSelectedTags(TagStruct item) => selectedTags.add(item);
  void removeFromSelectedTags(TagStruct item) => selectedTags.remove(item);
  void removeAtIndexFromSelectedTags(int index) => selectedTags.removeAt(index);
  void insertAtIndexInSelectedTags(int index, TagStruct item) =>
      selectedTags.insert(index, item);
  void updateSelectedTagsAtIndex(int index, Function(TagStruct) updateFn) =>
      selectedTags[index] = updateFn(selectedTags[index]);

  List<TagStruct> allTags = [];
  void addToAllTags(TagStruct item) => allTags.add(item);
  void removeFromAllTags(TagStruct item) => allTags.remove(item);
  void removeAtIndexFromAllTags(int index) => allTags.removeAt(index);
  void insertAtIndexInAllTags(int index, TagStruct item) =>
      allTags.insert(index, item);
  void updateAllTagsAtIndex(int index, Function(TagStruct) updateFn) =>
      allTags[index] = updateFn(allTags[index]);

  String? newTag = 'newTag';

  bool displayTagOptions = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (flashcards SELECT Last id)] action in FlashcardUpdateScreen widget.
  List<FlashcardsSELECTLastIdRow>? lastFlashcardId1;
  // Stores action output result for [Backend Call - SQLite (flashcard Read 1 with id)] action in FlashcardUpdateScreen widget.
  List<FlashcardRead1WithIdRow>? listSQLite1flashcard;
  // State field(s) for CardNameField widget.
  FocusNode? cardNameFieldFocusNode;
  TextEditingController? cardNameFieldTextController;
  String? Function(BuildContext, String?)? cardNameFieldTextControllerValidator;
  // State field(s) for TextRectoField widget.
  FocusNode? textRectoFieldFocusNode;
  TextEditingController? textRectoFieldTextController;
  String? Function(BuildContext, String?)?
      textRectoFieldTextControllerValidator;
  // Model for InsertAudioFlashcard component.
  late InsertAudioFlashcardModel insertAudioFlashcardModel1;
  // State field(s) for TextVersoField widget.
  FocusNode? textVersoFieldFocusNode;
  TextEditingController? textVersoFieldTextController;
  String? Function(BuildContext, String?)?
      textVersoFieldTextControllerValidator;
  // Model for InsertAudioFlashcard component.
  late InsertAudioFlashcardModel insertAudioFlashcardModel2;
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
  // Model for TagsList component.
  late TagsListModel tagsListModel1;
  // Model for TagsList component.
  late TagsListModel tagsListModel2;
  // Stores action output result for [Backend Call - SQLite (flashcards SELECT Last id)] action in finishCard widget.
  List<FlashcardsSELECTLastIdRow>? lastFlashcardId;

  @override
  void initState(BuildContext context) {
    insertAudioFlashcardModel1 =
        createModel(context, () => InsertAudioFlashcardModel());
    insertAudioFlashcardModel2 =
        createModel(context, () => InsertAudioFlashcardModel());
    tagsListModel1 = createModel(context, () => TagsListModel());
    tagsListModel2 = createModel(context, () => TagsListModel());
  }

  @override
  void dispose() {
    cardNameFieldFocusNode?.dispose();
    cardNameFieldTextController?.dispose();

    textRectoFieldFocusNode?.dispose();
    textRectoFieldTextController?.dispose();

    insertAudioFlashcardModel1.dispose();
    textVersoFieldFocusNode?.dispose();
    textVersoFieldTextController?.dispose();

    insertAudioFlashcardModel2.dispose();
    newTagFieldFocusNode?.dispose();
    newTagFieldTextController?.dispose();

    tagsListModel1.dispose();
    tagsListModel2.dispose();
  }

  /// Action blocks.
  Future manageGetTags(
    BuildContext context, {
    String? tagIds,
  }) async {
    List<TagsGETAllFromCtgRow>? allTagsParameter;
    List<TagStruct>? selectedTagsParameter;

    // Get all tags
    allTagsParameter = await SQLiteManager.instance.tagsGETAllFromCtg(
      category: 'flashcard',
    );
    // Get selected tags from Ids
    selectedTagsParameter = await actions.getSelectedTagsFromTagIds(
      valueOrDefault<String>(
        tagIds,
        '[1]',
      ),
    );
    // Update selectedTags states
    selectedTags = selectedTagsParameter.toList().cast<TagStruct>();
    // Filter allTags
    allTags = functions
        .filterSelectedTagsInAllTags(selectedTags.toList(),
            functions.formatNewTags(allTagsParameter.toList()).toList())
        .toList()
        .cast<TagStruct>();
  }

  Future transfertItemToAllTags(
    BuildContext context, {
    TagStruct? tagItem,
  }) async {
    if (!allTags.contains(tagItem)) {
      // Add to allTags
      addToAllTags(tagItem!);
    }
    // Remove from selectedTags
    removeFromSelectedTags(tagItem!);
  }
}
