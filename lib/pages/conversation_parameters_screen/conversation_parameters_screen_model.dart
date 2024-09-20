import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'conversation_parameters_screen_widget.dart'
    show ConversationParametersScreenWidget;
import 'package:flutter/material.dart';

class ConversationParametersScreenModel
    extends FlutterFlowModel<ConversationParametersScreenWidget> {
  ///  Local state fields for this page.

  List<SRSParametersREADAllRow> srsParameterState = [];
  void addToSrsParameterState(SRSParametersREADAllRow item) =>
      srsParameterState.add(item);
  void removeFromSrsParameterState(SRSParametersREADAllRow item) =>
      srsParameterState.remove(item);
  void removeAtIndexFromSrsParameterState(int index) =>
      srsParameterState.removeAt(index);
  void insertAtIndexInSrsParameterState(
          int index, SRSParametersREADAllRow item) =>
      srsParameterState.insert(index, item);
  void updateSrsParameterStateAtIndex(
          int index, Function(SRSParametersREADAllRow) updateFn) =>
      srsParameterState[index] = updateFn(srsParameterState[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (SRS Parameters READ all)] action in ConversationParametersScreen widget.
  List<SRSParametersREADAllRow>? srsParameters;
  // State field(s) for StepNumberTextField widget.
  FocusNode? stepNumberTextFieldFocusNode;
  TextEditingController? stepNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      stepNumberTextFieldTextControllerValidator;
  // State field(s) for StepToValidateConvTextField widget.
  FocusNode? stepToValidateConvTextFieldFocusNode;
  TextEditingController? stepToValidateConvTextFieldTextController;
  String? Function(BuildContext, String?)?
      stepToValidateConvTextFieldTextControllerValidator;
  // State field(s) for CardInRetrievalTextField widget.
  FocusNode? cardInRetrievalTextFieldFocusNode;
  TextEditingController? cardInRetrievalTextFieldTextController;
  String? Function(BuildContext, String?)?
      cardInRetrievalTextFieldTextControllerValidator;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<SRSParametersREADAllRow>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    stepNumberTextFieldFocusNode?.dispose();
    stepNumberTextFieldTextController?.dispose();

    stepToValidateConvTextFieldFocusNode?.dispose();
    stepToValidateConvTextFieldTextController?.dispose();

    cardInRetrievalTextFieldFocusNode?.dispose();
    cardInRetrievalTextFieldTextController?.dispose();

    paginatedDataTableController.dispose();
  }
}
