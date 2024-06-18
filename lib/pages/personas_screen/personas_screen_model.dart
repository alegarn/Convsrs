import '/components/ui/list_crud_row/list_crud_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'personas_screen_widget.dart' show PersonasScreenWidget;
import 'package:flutter/material.dart';

class PersonasScreenModel extends FlutterFlowModel<PersonasScreenWidget> {
  ///  Local state fields for this page.

  bool isCreatingPersona = false;

  int? displayedOptionsId = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for ListCrudRow dynamic component.
  late FlutterFlowDynamicModels<ListCrudRowModel> listCrudRowModels;
  // State field(s) for PersonaNameField widget.
  FocusNode? personaNameFieldFocusNode;
  TextEditingController? personaNameFieldTextController;
  String? Function(BuildContext, String?)?
      personaNameFieldTextControllerValidator;
  // State field(s) for PersonaInfosField widget.
  FocusNode? personaInfosFieldFocusNode;
  TextEditingController? personaInfosFieldTextController;
  String? Function(BuildContext, String?)?
      personaInfosFieldTextControllerValidator;
  // State field(s) for PersonaSubjectField widget.
  FocusNode? personaSubjectFieldFocusNode;
  TextEditingController? personaSubjectFieldTextController;
  String? Function(BuildContext, String?)?
      personaSubjectFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    listCrudRowModels = FlutterFlowDynamicModels(() => ListCrudRowModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listCrudRowModels.dispose();
    personaNameFieldFocusNode?.dispose();
    personaNameFieldTextController?.dispose();

    personaInfosFieldFocusNode?.dispose();
    personaInfosFieldTextController?.dispose();

    personaSubjectFieldFocusNode?.dispose();
    personaSubjectFieldTextController?.dispose();
  }
}
