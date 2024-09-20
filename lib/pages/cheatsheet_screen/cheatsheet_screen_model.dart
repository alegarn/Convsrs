import '/flutter_flow/flutter_flow_util.dart';
import 'cheatsheet_screen_widget.dart' show CheatsheetScreenWidget;
import 'package:flutter/material.dart';

class CheatsheetScreenModel extends FlutterFlowModel<CheatsheetScreenWidget> {
  ///  Local state fields for this page.

  bool isCreatingRow = false;

  bool isDeleting = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CheatsheetRowConceptField widget.
  FocusNode? cheatsheetRowConceptFieldFocusNode;
  TextEditingController? cheatsheetRowConceptFieldTextController;
  String? Function(BuildContext, String?)?
      cheatsheetRowConceptFieldTextControllerValidator;
  // State field(s) for CheatsheetRowDescriptionField widget.
  FocusNode? cheatsheetRowDescriptionFieldFocusNode;
  TextEditingController? cheatsheetRowDescriptionFieldTextController;
  String? Function(BuildContext, String?)?
      cheatsheetRowDescriptionFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cheatsheetRowConceptFieldFocusNode?.dispose();
    cheatsheetRowConceptFieldTextController?.dispose();

    cheatsheetRowDescriptionFieldFocusNode?.dispose();
    cheatsheetRowDescriptionFieldTextController?.dispose();
  }
}
