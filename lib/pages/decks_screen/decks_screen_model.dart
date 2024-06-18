import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'decks_screen_widget.dart' show DecksScreenWidget;
import 'package:flutter/material.dart';

class DecksScreenModel extends FlutterFlowModel<DecksScreenWidget> {
  ///  Local state fields for this page.

  List<String> deckListState = [];
  void addToDeckListState(String item) => deckListState.add(item);
  void removeFromDeckListState(String item) => deckListState.remove(item);
  void removeAtIndexFromDeckListState(int index) =>
      deckListState.removeAt(index);
  void insertAtIndexInDeckListState(int index, String item) =>
      deckListState.insert(index, item);
  void updateDeckListStateAtIndex(int index, Function(String) updateFn) =>
      deckListState[index] = updateFn(deckListState[index]);

  bool isCreatingDeck = false;

  bool isDeleting = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - SQLite (Flashcards infos for retrieval session)] action in RetrievalButton widget.
  List<FlashcardsInfosForRetrievalSessionRow>? deckRetrieval;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
