import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  int? cardsToRetrieveCount = 0;

  int? cardsToPracticeCount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (cardsToBeRetrievedCount)] action in HomePage widget.
  List<CardsToBeRetrievedCountRow>? cardsToBeRetrievedCount;
  // Stores action output result for [Backend Call - SQLite (cardsToBePracticeCount)] action in HomePage widget.
  List<CardsToBePracticeCountRow>? cardsToBePracticedCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
