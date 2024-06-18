import '/components/ui/list_button/list_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'list_crud_row_widget.dart' show ListCrudRowWidget;
import 'package:flutter/material.dart';

class ListCrudRowModel extends FlutterFlowModel<ListCrudRowWidget> {
  ///  Local state fields for this component.

  bool isShowingOptions = false;

  ///  State fields for stateful widgets in this component.

  // Model for ListButton component.
  late ListButtonModel listButtonModel;

  @override
  void initState(BuildContext context) {
    listButtonModel = createModel(context, () => ListButtonModel());
  }

  @override
  void dispose() {
    listButtonModel.dispose();
  }
}
