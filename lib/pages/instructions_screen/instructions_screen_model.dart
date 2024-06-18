import '/flutter_flow/flutter_flow_util.dart';
import 'instructions_screen_widget.dart' show InstructionsScreenWidget;
import 'package:flutter/material.dart';

class InstructionsScreenModel
    extends FlutterFlowModel<InstructionsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
