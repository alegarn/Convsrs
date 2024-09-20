import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'retrieval_end_screen_widget.dart' show RetrievalEndScreenWidget;
import 'package:flutter/material.dart';

class RetrievalEndScreenModel
    extends FlutterFlowModel<RetrievalEndScreenWidget> {
  ///  Local state fields for this page.

  String? lastSessionResults = 'data (sretrievalSession)';

  int? totalDeckWordLearned = 0;

  String? deckName = 'my deck';

  int? totalCards = 0;

  int? wordsToBeLearned = 0;

  int? wordsLearned = 0;

  int? deckCardsCount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (Deck Read 1 from id)] action in RetrievalEndScreen widget.
  List<DeckRead1FromIdRow>? deckRow;
  // Stores action output result for [Backend Call - SQLite (deckFlashcards countTotalWordsLearned from deck id)] action in RetrievalEndScreen widget.
  List<DeckFlashcardsCountTotalWordsLearnedFromDeckIdRow>?
      totalDeckWordLearnedCount;
  // Stores action output result for [Backend Call - SQLite (Deck Count cards in deck using deckId)] action in RetrievalEndScreen widget.
  List<DeckCountCardsInDeckUsingDeckIdRow>? countTotalFlashcardsInDeck;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
