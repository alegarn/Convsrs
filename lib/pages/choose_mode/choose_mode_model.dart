import '/flutter_flow/flutter_flow_util.dart';
import 'choose_mode_widget.dart' show ChooseModeWidget;
import 'package:flutter/material.dart';

class ChooseModeModel extends FlutterFlowModel<ChooseModeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
