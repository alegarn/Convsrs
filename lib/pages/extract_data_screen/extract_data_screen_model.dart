import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'extract_data_screen_widget.dart' show ExtractDataScreenWidget;
import 'package:flutter/material.dart';

class ExtractDataScreenModel extends FlutterFlowModel<ExtractDataScreenWidget> {
  ///  Local state fields for this page.

  String csvDataState = 'Csv Data';

  List<DataExtractREADAllNoDataRow> extractDataState = [];
  void addToExtractDataState(DataExtractREADAllNoDataRow item) =>
      extractDataState.add(item);
  void removeFromExtractDataState(DataExtractREADAllNoDataRow item) =>
      extractDataState.remove(item);
  void removeAtIndexFromExtractDataState(int index) =>
      extractDataState.removeAt(index);
  void insertAtIndexInExtractDataState(
          int index, DataExtractREADAllNoDataRow item) =>
      extractDataState.insert(index, item);
  void updateExtractDataStateAtIndex(
          int index, Function(DataExtractREADAllNoDataRow) updateFn) =>
      extractDataState[index] = updateFn(extractDataState[index]);

  List<SqliteSequenceREADAllRow> tables = [];
  void addToTables(SqliteSequenceREADAllRow item) => tables.add(item);
  void removeFromTables(SqliteSequenceREADAllRow item) => tables.remove(item);
  void removeAtIndexFromTables(int index) => tables.removeAt(index);
  void insertAtIndexInTables(int index, SqliteSequenceREADAllRow item) =>
      tables.insert(index, item);
  void updateTablesAtIndex(
          int index, Function(SqliteSequenceREADAllRow) updateFn) =>
      tables[index] = updateFn(tables[index]);

  int loopCounter = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<DataExtractREADAllNoDataRow>();
  // Stores action output result for [Backend Call - SQLite (dataExtract READ data from tableName)] action in ExtractButton widget.
  List<DataExtractREADDataFromTableNameRow>? extractDataFromTableName;
  // Stores action output result for [Backend Call - SQLite (sqliteSequence READ all)] action in Button widget.
  List<SqliteSequenceREADAllRow>? sqliteSequence;
  // Stores action output result for [Backend Call - SQLite (retrievalSessions READ all from userId)] action in Button widget.
  List<RetrievalSessionsREADAllFromUserIdRow>? retrievalSessions;
  // Stores action output result for [Backend Call - SQLite (User select User)] action in Button widget.
  List<UserSelectUserRow>? user;
  // Stores action output result for [Backend Call - SQLite (personas READ all)] action in Button widget.
  List<PersonasREADAllRow>? personas;
  // Stores action output result for [Backend Call - SQLite (Flashcard Read all)] action in Button widget.
  List<FlashcardReadAllRow>? flashcards;
  // Stores action output result for [Backend Call - SQLite (Decks READ from userId)] action in Button widget.
  List<DecksREADFromUserIdRow>? decks;
  // Stores action output result for [Backend Call - SQLite (Conversations READ all)] action in Button widget.
  List<ConversationsREADAllRow>? conversations;
  // Stores action output result for [Backend Call - SQLite (SRS Parameters READ all)] action in Button widget.
  List<SRSParametersREADAllRow>? srsParameters;
  // Stores action output result for [Backend Call - SQLite (retrievalSessionsDecks READ all)] action in Button widget.
  List<RetrievalSessionsDecksREADAllRow>? retrievalSessionsDecks;
  // Stores action output result for [Backend Call - SQLite (conversationsFlashcards READ all)] action in Button widget.
  List<ConversationsFlashcardsREADAllRow>? conversationsFlashcards;
  // Stores action output result for [Backend Call - SQLite (decksFlashcards READ all)] action in Button widget.
  List<DecksFlashcardsREADAllRow>? decksFlashcards;
  // Stores action output result for [Backend Call - SQLite (conversationPersonas)] action in Button widget.
  List<ConversationPersonasRow>? conversationPersonas;
  // Stores action output result for [Backend Call - SQLite (cheatsheets READ all by userId)] action in Button widget.
  List<CheatsheetsREADAllByUserIdRow>? cheatsheets;
  // Stores action output result for [Backend Call - SQLite (cheatsheet Rows READ all)] action in Button widget.
  List<CheatsheetRowsREADAllRow>? cheatsheetRows;
  // Stores action output result for [Backend Call - SQLite (dataExtract READ all no data)] action in Button widget.
  List<DataExtractREADAllNoDataRow>? dataExtract;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
