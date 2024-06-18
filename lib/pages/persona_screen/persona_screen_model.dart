import '/flutter_flow/flutter_flow_util.dart';
import 'persona_screen_widget.dart' show PersonaScreenWidget;
import 'package:flutter/material.dart';

class PersonaScreenModel extends FlutterFlowModel<PersonaScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
