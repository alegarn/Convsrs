import '/flutter_flow/flutter_flow_util.dart';
import 'conversation_end_screen_widget.dart' show ConversationEndScreenWidget;
import 'package:flutter/material.dart';

class ConversationEndScreenModel
    extends FlutterFlowModel<ConversationEndScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
