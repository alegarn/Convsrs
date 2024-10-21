import '/flutter_flow/flutter_flow_util.dart';
import 'tag_list_widget.dart' show TagListWidget;
import 'package:flutter/material.dart';

class TagListModel extends FlutterFlowModel<TagListWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NewTagField widget.
  FocusNode? newTagFieldFocusNode;
  TextEditingController? newTagFieldTextController;
  String? Function(BuildContext, String?)? newTagFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newTagFieldFocusNode?.dispose();
    newTagFieldTextController?.dispose();
  }
}
