import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/flashcard_component/flip_card_component/flip_card_component_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'conversation_screen_widget.dart' show ConversationScreenWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ConversationScreenModel
    extends FlutterFlowModel<ConversationScreenWidget> {
  ///  Local state fields for this page.

  bool isSpeaking = true;

  int? timeSpoken = 0;

  List<CheatsheetRowStruct> cheatsheetRows = [];
  void addToCheatsheetRows(CheatsheetRowStruct item) =>
      cheatsheetRows.add(item);
  void removeFromCheatsheetRows(CheatsheetRowStruct item) =>
      cheatsheetRows.remove(item);
  void removeAtIndexFromCheatsheetRows(int index) =>
      cheatsheetRows.removeAt(index);
  void insertAtIndexInCheatsheetRows(int index, CheatsheetRowStruct item) =>
      cheatsheetRows.insert(index, item);
  void updateCheatsheetRowsAtIndex(
          int index, Function(CheatsheetRowStruct) updateFn) =>
      cheatsheetRows[index] = updateFn(cheatsheetRows[index]);

  int? conversationDuration = 0;

  int? totalCardNumber = 0;

  int? validatedCardNumber = 0;

  int? timeToValidateWord = 7;

  FlashcardConversationStatusStruct? loopCurrentItem;
  void updateLoopCurrentItemStruct(
      Function(FlashcardConversationStatusStruct) updateFn) {
    updateFn(loopCurrentItem ??= FlashcardConversationStatusStruct());
  }

  int? loopCounter = 0;

  bool showVerso = true;

  bool showOptionButtons = false;

  List<ConversationTagsListsStruct> conversationTagsLists = [];
  void addToConversationTagsLists(ConversationTagsListsStruct item) =>
      conversationTagsLists.add(item);
  void removeFromConversationTagsLists(ConversationTagsListsStruct item) =>
      conversationTagsLists.remove(item);
  void removeAtIndexFromConversationTagsLists(int index) =>
      conversationTagsLists.removeAt(index);
  void insertAtIndexInConversationTagsLists(
          int index, ConversationTagsListsStruct item) =>
      conversationTagsLists.insert(index, item);
  void updateConversationTagsListsAtIndex(
          int index, Function(ConversationTagsListsStruct) updateFn) =>
      conversationTagsLists[index] = updateFn(conversationTagsLists[index]);

  ConversationTagsListsStruct? bigLoopCurrentItem;
  void updateBigLoopCurrentItemStruct(
      Function(ConversationTagsListsStruct) updateFn) {
    updateFn(bigLoopCurrentItem ??= ConversationTagsListsStruct());
  }

  int bigLoopCounter = 0;

  bool isScreenReversedState = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (Flashcards for conversation with deckId)] action in ConversationScreen widget.
  List<FlashcardsForConversationWithDeckIdRow>? flashcardsConvOutput;
  // Stores action output result for [Custom Action - getConversationTagsLists] action in ConversationScreen widget.
  List<ConversationTagsListsStruct>? conversationTagsList;
  // Stores action output result for [Backend Call - SQLite (Cheatsheet Rows READ concept answer)] action in ConversationScreen widget.
  List<CheatsheetRowsREADConceptAnswerRow>? cheatsheetRowsOutput;
  // State field(s) for ConversationPagesViews widget.
  PageController? conversationPagesViewsController;

  int get conversationPagesViewsCurrentIndex =>
      conversationPagesViewsController != null &&
              conversationPagesViewsController!.hasClients &&
              conversationPagesViewsController!.page != null
          ? conversationPagesViewsController!.page!.round()
          : 0;
  // State field(s) for FilterTextField widget.
  FocusNode? filterTextFieldFocusNode;
  TextEditingController? filterTextFieldTextController;
  String? Function(BuildContext, String?)?
      filterTextFieldTextControllerValidator;
  // Model for FlipCardComponent component.
  late FlipCardComponentModel flipCardComponentModel;
  // Stores action output result for [Backend Call - SQLite (conversations READ last conversationID)] action in StopConversationButton widget.
  List<ConversationsREADLastConversationIDRow>? conversationId;
  // Stores action output result for [Backend Call - SQLite (flashcard Read 1 with id)] action in StopConversationButton widget.
  List<FlashcardRead1WithIdRow>? flashcardToUpdate;
  // Stores action output result for [Backend Call - SQLite (SRS Parameters get conversationStepsIntervalsSec from stepNumber)] action in StopConversationButton widget.
  List<SRSParametersGetConversationStepsIntervalsSecFromStepNumberRow>?
      converstationStepsIntervalsSec;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for TotalTimer widget.
  final totalTimerInitialTimeMs = 0;
  int totalTimerMilliseconds = 0;
  String totalTimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController totalTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  @override
  void initState(BuildContext context) {
    flipCardComponentModel =
        createModel(context, () => FlipCardComponentModel());
  }

  @override
  void dispose() {
    filterTextFieldFocusNode?.dispose();
    filterTextFieldTextController?.dispose();

    flipCardComponentModel.dispose();
    timerController.dispose();
    totalTimerController.dispose();
  }
}
