import '/components/ui/list_crud_row/list_crud_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cheatsheets_screen_widget.dart' show CheatsheetsScreenWidget;
import 'package:flutter/material.dart';

class CheatsheetsScreenModel extends FlutterFlowModel<CheatsheetsScreenWidget> {
  ///  Local state fields for this page.

  bool isCreatingCheatsheet = false;

  int? rowIdToDelete = 0;

  ///  State fields for stateful widgets in this page.

  // Models for ListCrudRow dynamic component.
  late FlutterFlowDynamicModels<ListCrudRowModel> listCrudRowModels;
  // State field(s) for CheatsheetNameField widget.
  FocusNode? cheatsheetNameFieldFocusNode;
  TextEditingController? cheatsheetNameFieldTextController;
  String? Function(BuildContext, String?)?
      cheatsheetNameFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    listCrudRowModels = FlutterFlowDynamicModels(() => ListCrudRowModel());
  }

  @override
  void dispose() {
    listCrudRowModels.dispose();
    cheatsheetNameFieldFocusNode?.dispose();
    cheatsheetNameFieldTextController?.dispose();
  }
}
