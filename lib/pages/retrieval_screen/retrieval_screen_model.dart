import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'retrieval_screen_widget.dart' show RetrievalScreenWidget;
import 'package:flutter/material.dart';

class RetrievalScreenModel extends FlutterFlowModel<RetrievalScreenWidget> {
  ///  Local state fields for this page.

  List<FlashcardStruct> cardToReviewListState = [];
  void addToCardToReviewListState(FlashcardStruct item) =>
      cardToReviewListState.add(item);
  void removeFromCardToReviewListState(FlashcardStruct item) =>
      cardToReviewListState.remove(item);
  void removeAtIndexFromCardToReviewListState(int index) =>
      cardToReviewListState.removeAt(index);
  void insertAtIndexInCardToReviewListState(int index, FlashcardStruct item) =>
      cardToReviewListState.insert(index, item);
  void updateCardToReviewListStateAtIndex(
          int index, Function(FlashcardStruct) updateFn) =>
      cardToReviewListState[index] = updateFn(cardToReviewListState[index]);

  List<FlashcardStruct> cardReviewedList = [];
  void addToCardReviewedList(FlashcardStruct item) =>
      cardReviewedList.add(item);
  void removeFromCardReviewedList(FlashcardStruct item) =>
      cardReviewedList.remove(item);
  void removeAtIndexFromCardReviewedList(int index) =>
      cardReviewedList.removeAt(index);
  void insertAtIndexInCardReviewedList(int index, FlashcardStruct item) =>
      cardReviewedList.insert(index, item);
  void updateCardReviewedListAtIndex(
          int index, Function(FlashcardStruct) updateFn) =>
      cardReviewedList[index] = updateFn(cardReviewedList[index]);

  int cardValidatedCount = 0;

  double validatedPercent = 0.0;

  List<String> cardsValidationCounts = [];
  void addToCardsValidationCounts(String item) =>
      cardsValidationCounts.add(item);
  void removeFromCardsValidationCounts(String item) =>
      cardsValidationCounts.remove(item);
  void removeAtIndexFromCardsValidationCounts(int index) =>
      cardsValidationCounts.removeAt(index);
  void insertAtIndexInCardsValidationCounts(int index, String item) =>
      cardsValidationCounts.insert(index, item);
  void updateCardsValidationCountsAtIndex(
          int index, Function(String) updateFn) =>
      cardsValidationCounts[index] = updateFn(cardsValidationCounts[index]);

  bool currentCardFaceShown = true;

  String currentCardFrontText = 'Text Front';

  String currentCardBackText = 'Text Back';

  bool currentCardIsRemembered = true;

  FlashcardStruct? currentCard;
  void updateCurrentCardStruct(Function(FlashcardStruct) updateFn) {
    updateFn(currentCard ??= FlashcardStruct());
  }

  int cardFailedCount = 0;

  List<FlashcardsRetrievalStatusStruct> cardsStatus = [];
  void addToCardsStatus(FlashcardsRetrievalStatusStruct item) =>
      cardsStatus.add(item);
  void removeFromCardsStatus(FlashcardsRetrievalStatusStruct item) =>
      cardsStatus.remove(item);
  void removeAtIndexFromCardsStatus(int index) => cardsStatus.removeAt(index);
  void insertAtIndexInCardsStatus(
          int index, FlashcardsRetrievalStatusStruct item) =>
      cardsStatus.insert(index, item);
  void updateCardsStatusAtIndex(
          int index, Function(FlashcardsRetrievalStatusStruct) updateFn) =>
      cardsStatus[index] = updateFn(cardsStatus[index]);

  int totalCardsCount = 0;

  int? currentCardId;

  int counter = 0;

  int? mentImageBool = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RetrievalTimer widget.
  final retrievalTimerInitialTimeMs = 0;
  int retrievalTimerMilliseconds = 0;
  String retrievalTimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController retrievalTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    retrievalTimerController.dispose();
  }

  /// Action blocks.
  Future endOfRetrievalSession(
    BuildContext context, {
    String? userId,
    int? deckId,
  }) async {
    List<SRSParametersGetConversationStepsIntervalsSecFromStepNumberRow>?
        speakingStepsIntervals;
    List<SRSParametersGetRetrievalIntervalDurationSecFromStepNumberRow>?
        retrievalIntervalDurationSec;

    // Dialog box, please wait
    unawaited(
      () async {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Retrieval session end'),
              content: const Text(
                  'The retrieval session is finished, results are processed, please wait (:'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
      }(),
    );
    // create retrievalSession
    await SQLiteManager.instance.retrievalSessionsCREATE(
      userId: valueOrDefault<String>(
        FFAppState().userUuid,
        'endOfRetrievalSessionUserUUID',
      ),
      durationSec: retrievalTimerMilliseconds,
      totalCardNumber: totalCardsCount,
      failNumber: cardFailedCount,
      successNumber: cardValidatedCount,
      date: functions.dateNow(),
    );
    // Insert retrievalSessionsDecks
    await SQLiteManager.instance.retrievalSessionsDecksCreateINSERTANewRecord(
      deckId: widget!.deckId,
    );
    while (cardReviewedList.isNotEmpty) {
      // get first item to currentCard
      currentCard = cardReviewedList.first;
      // Get conversationStepsIntervalsSec string from current Flashcard's stepNumber
      speakingStepsIntervals = await SQLiteManager.instance
          .sRSParametersGetConversationStepsIntervalsSecFromStepNumber(
        stepNumber: valueOrDefault<int>(
          valueOrDefault<int>(
                currentCard?.currentRetrievalStep,
                0,
              ) +
              1,
          1,
        ),
      );
      // Get retrievalIntervalDurationSec
      retrievalIntervalDurationSec = await SQLiteManager.instance
          .sRSParametersGetRetrievalIntervalDurationSecFromStepNumber(
        stepNumber: valueOrDefault<int>(
          valueOrDefault<int>(
                currentCard?.currentRetrievalStep,
                0,
              ) +
              1,
          1,
        ),
      );
      // Update Flashcard with currentCard
      await SQLiteManager.instance.flashcardUpdate(
        currentRetrievalStep: valueOrDefault<int>(
          valueOrDefault<int>(
                currentCard?.currentRetrievalStep,
                0,
              ) +
              1,
          1,
        ),
        currentSpeakingStep: 0,
        successCount: currentCard?.successCount,
        toRecall: 1,
        totalReviewCount: valueOrDefault<int>(
          valueOrDefault<int>(
                currentCard?.totalReviewCount,
                0,
              ) +
              1,
          0,
        ),
        currentSpeakingDate: functions.dateNow(),
        nextSpeakingDate: valueOrDefault<String>(
          functions.dateNow(),
          'none',
        ),
        flashcardId: currentCard?.id,
        name: currentCard?.name,
        textRecto: currentCard?.textRecto,
        textVerso: currentCard?.textVerso,
        audioRectoUrl: 'none',
        audioVersoUrl: 'none',
        imageRectoUrl: 'none',
        imageVersoUrl: 'none',
        currentRecallDate: valueOrDefault<String>(
          functions.calculateNextRecallDate(retrievalIntervalDurationSec
              .first.retrievalIntervalDurationSec),
          'none',
        ),
        nextRecallDate: valueOrDefault<String>(
          functions.calculateNextRecallDate(retrievalIntervalDurationSec
              .first.retrievalIntervalDurationSec),
          'none',
        ),
        mentalImageBool: valueOrDefault<int>(
          currentCard?.mentalImageBool,
          0,
        ),
      );
      // Remove ReviewedList item
      removeAtIndexFromCardReviewedList(0);
    }
    // Change screen
    if (Navigator.of(context).canPop()) {
      context.pop();
    }
    context.pushNamed(
      'RetrievalEndScreen',
      queryParameters: {
        'retrivalSessionTime': serializeParam(
          retrievalTimerMilliseconds,
          ParamType.int,
        ),
        'validationsSuccess': serializeParam(
          cardValidatedCount,
          ParamType.int,
        ),
        'validationsFail': serializeParam(
          cardFailedCount,
          ParamType.int,
        ),
        'deckId': serializeParam(
          widget!.deckId,
          ParamType.int,
        ),
        'sessionWordsCount': serializeParam(
          totalCardsCount,
          ParamType.int,
        ),
      }.withoutNulls,
    );
  }

  Future retrievalSessionStart(BuildContext context) async {
    List<FlashcardsInfosForRetrievalSessionRow>? flashcardsToReviewRowsCopy;

    // Set Total Cards Count
    totalCardsCount = valueOrDefault<int>(
      cardToReviewListState.length,
      0,
    );
    // Call the Flashcards (db)
    flashcardsToReviewRowsCopy =
        await SQLiteManager.instance.flashcardsInfosForRetrievalSession(
      userId: FFAppState().userUuid,
      deckId: widget!.deckId,
      numberOfCard: FFAppState().cardPerRetrieval,
    );
    // Rows to cardToReviewListState
    cardToReviewListState = functions
        .updateCardToReviewListState(flashcardsToReviewRowsCopy.toList())!
        .toList()
        .cast<FlashcardStruct>();
    // set cardsStatus
    cardsStatus = functions
        .setCardsRetrievalStatus(cardToReviewListState.toList(), 5)
        .toList()
        .cast<FlashcardsRetrievalStatusStruct>();
    // Extract First flashcard
    currentCard = cardToReviewListState.first;
    // set currentCardId with currentCard id
    currentCardId = valueOrDefault<int>(
      currentCard?.id,
      0,
    );
    // Add recto text
    currentCardFrontText = valueOrDefault<String>(
      currentCard?.hasTextRecto().toString(),
      'none',
    );
    // Add Verso text
    currentCardBackText = valueOrDefault<String>(
      currentCard?.hasTextVerso().toString(),
      'none',
    );
  }
}
