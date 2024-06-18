import '/backend/sqlite/sqlite_manager.dart';
import '/components/ui/list_crud_row/list_crud_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'flashcards_screen_widget.dart' show FlashcardsScreenWidget;
import 'package:flutter/material.dart';

class FlashcardsScreenModel extends FlutterFlowModel<FlashcardsScreenWidget> {
  ///  Local state fields for this page.

  bool isCreatingFlashcard = false;

  bool isShowingDelete = false;

  int? showingDeleteRowId = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - SQLite (Deck Read 1 from id)] action in FlashcardsScreen widget.
  List<DeckRead1FromIdRow>? deckInfos;
  // Models for ListCrudRow dynamic component.
  late FlutterFlowDynamicModels<ListCrudRowModel> listCrudRowModels;
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
  // Stores action output result for [Backend Call - SQLite (flashcards SELECT Last id)] action in CreateFlashcardButton widget.
  List<FlashcardsSELECTLastIdRow>? lastFlashcardId;

  @override
  void initState(BuildContext context) {
    listCrudRowModels = FlutterFlowDynamicModels(() => ListCrudRowModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listCrudRowModels.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    textRectoFieldFocusNode?.dispose();
    textRectoFieldTextController?.dispose();

    textVersoFieldFocusNode?.dispose();
    textVersoFieldTextController?.dispose();
  }

  /// Action blocks.
  Future flashcardCreation(BuildContext context) async {}
}
