import '/backend/sqlite/sqlite_manager.dart';
import '/components/flashcard_component/insert_audio_flashcard/insert_audio_flashcard_widget.dart';
import '/components/ui/tag_list/tag_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
  // Model for tagList component.
  late TagListModel tagListModel;
  // Stores action output result for [Backend Call - SQLite (flashcards SELECT Last id)] action in finishCard widget.
  List<FlashcardsSELECTLastIdRow>? lastFlashcardId;

  @override
  void initState(BuildContext context) {
    insertAudioFlashcardModel1 =
        createModel(context, () => InsertAudioFlashcardModel());
    insertAudioFlashcardModel2 =
        createModel(context, () => InsertAudioFlashcardModel());
    tagListModel = createModel(context, () => TagListModel());
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
    tagListModel.dispose();
  }
}
