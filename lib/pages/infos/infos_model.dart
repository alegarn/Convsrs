import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'infos_widget.dart' show InfosWidget;
import 'package:flutter/material.dart';

class InfosModel extends FlutterFlowModel<InfosWidget> {
  ///  Local state fields for this page.

  List<FlashcardReadAllRow> flashcards = [];
  void addToFlashcards(FlashcardReadAllRow item) => flashcards.add(item);
  void removeFromFlashcards(FlashcardReadAllRow item) =>
      flashcards.remove(item);
  void removeAtIndexFromFlashcards(int index) => flashcards.removeAt(index);
  void insertAtIndexInFlashcards(int index, FlashcardReadAllRow item) =>
      flashcards.insert(index, item);
  void updateFlashcardsAtIndex(
          int index, Function(FlashcardReadAllRow) updateFn) =>
      flashcards[index] = updateFn(flashcards[index]);

  List<DecksREADFromUserIdRow> decks = [];
  void addToDecks(DecksREADFromUserIdRow item) => decks.add(item);
  void removeFromDecks(DecksREADFromUserIdRow item) => decks.remove(item);
  void removeAtIndexFromDecks(int index) => decks.removeAt(index);
  void insertAtIndexInDecks(int index, DecksREADFromUserIdRow item) =>
      decks.insert(index, item);
  void updateDecksAtIndex(
          int index, Function(DecksREADFromUserIdRow) updateFn) =>
      decks[index] = updateFn(decks[index]);

  List<RetrievalSessionsREADAllFromUserIdRow> retrievalSessionsState = [];
  void addToRetrievalSessionsState(
          RetrievalSessionsREADAllFromUserIdRow item) =>
      retrievalSessionsState.add(item);
  void removeFromRetrievalSessionsState(
          RetrievalSessionsREADAllFromUserIdRow item) =>
      retrievalSessionsState.remove(item);
  void removeAtIndexFromRetrievalSessionsState(int index) =>
      retrievalSessionsState.removeAt(index);
  void insertAtIndexInRetrievalSessionsState(
          int index, RetrievalSessionsREADAllFromUserIdRow item) =>
      retrievalSessionsState.insert(index, item);
  void updateRetrievalSessionsStateAtIndex(int index,
          Function(RetrievalSessionsREADAllFromUserIdRow) updateFn) =>
      retrievalSessionsState[index] = updateFn(retrievalSessionsState[index]);

  List<RetrievalSessionsDecksREADAllRow> retrievalSessionsDecksId = [];
  void addToRetrievalSessionsDecksId(RetrievalSessionsDecksREADAllRow item) =>
      retrievalSessionsDecksId.add(item);
  void removeFromRetrievalSessionsDecksId(
          RetrievalSessionsDecksREADAllRow item) =>
      retrievalSessionsDecksId.remove(item);
  void removeAtIndexFromRetrievalSessionsDecksId(int index) =>
      retrievalSessionsDecksId.removeAt(index);
  void insertAtIndexInRetrievalSessionsDecksId(
          int index, RetrievalSessionsDecksREADAllRow item) =>
      retrievalSessionsDecksId.insert(index, item);
  void updateRetrievalSessionsDecksIdAtIndex(
          int index, Function(RetrievalSessionsDecksREADAllRow) updateFn) =>
      retrievalSessionsDecksId[index] =
          updateFn(retrievalSessionsDecksId[index]);

  List<SRSParametersREADAllRow> srsParametersState = [];
  void addToSrsParametersState(SRSParametersREADAllRow item) =>
      srsParametersState.add(item);
  void removeFromSrsParametersState(SRSParametersREADAllRow item) =>
      srsParametersState.remove(item);
  void removeAtIndexFromSrsParametersState(int index) =>
      srsParametersState.removeAt(index);
  void insertAtIndexInSrsParametersState(
          int index, SRSParametersREADAllRow item) =>
      srsParametersState.insert(index, item);
  void updateSrsParametersStateAtIndex(
          int index, Function(SRSParametersREADAllRow) updateFn) =>
      srsParametersState[index] = updateFn(srsParametersState[index]);

  List<ConversationsREADAllRow> conversationsState = [];
  void addToConversationsState(ConversationsREADAllRow item) =>
      conversationsState.add(item);
  void removeFromConversationsState(ConversationsREADAllRow item) =>
      conversationsState.remove(item);
  void removeAtIndexFromConversationsState(int index) =>
      conversationsState.removeAt(index);
  void insertAtIndexInConversationsState(
          int index, ConversationsREADAllRow item) =>
      conversationsState.insert(index, item);
  void updateConversationsStateAtIndex(
          int index, Function(ConversationsREADAllRow) updateFn) =>
      conversationsState[index] = updateFn(conversationsState[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - SQLite (Flashcard Read all)] action in Infos widget.
  List<FlashcardReadAllRow>? flashcardsTable;
  // Stores action output result for [Backend Call - SQLite (Flashcards read all from deck name and id)] action in Infos widget.
  List<FlashcardsReadAllFromDeckNameAndIdRow>? flashcardsNormal;
  // Stores action output result for [Backend Call - SQLite (Decks READ from userId)] action in Infos widget.
  List<DecksREADFromUserIdRow>? decksOutput;
  // Stores action output result for [Backend Call - SQLite (retrievalSessions READ all from userId)] action in Infos widget.
  List<RetrievalSessionsREADAllFromUserIdRow>? retrievalSessions;
  // Stores action output result for [Backend Call - SQLite (retrievalSessionsDecks READ all)] action in Infos widget.
  List<RetrievalSessionsDecksREADAllRow>? retrievalSessionsDecks;
  // Stores action output result for [Backend Call - SQLite (SRS Parameters READ all)] action in Infos widget.
  List<SRSParametersREADAllRow>? srsParameters;
  // Stores action output result for [Backend Call - SQLite (Conversations READ all)] action in Infos widget.
  List<ConversationsREADAllRow>? conversations;
  // State field(s) for FlashCardDataTable widget.
  final flashCardDataTableController1 =
      FlutterFlowDataTableController<FlashcardReadAllRow>();
  // State field(s) for FlashCardDataTable widget.
  final flashCardDataTableController2 =
      FlutterFlowDataTableController<RetrievalSessionsREADAllFromUserIdRow>();
  // State field(s) for FlashCardDataTable widget.
  final flashCardDataTableController3 =
      FlutterFlowDataTableController<RetrievalSessionsDecksREADAllRow>();
  // State field(s) for FlashCardDataTable widget.
  final flashCardDataTableController4 =
      FlutterFlowDataTableController<SRSParametersREADAllRow>();
  // State field(s) for FlashCardDataTable widget.
  final flashCardDataTableController5 =
      FlutterFlowDataTableController<ConversationsREADAllRow>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
