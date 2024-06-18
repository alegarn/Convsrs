import '/components/ui/list_button/list_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'navigate_list_item_widget.dart' show NavigateListItemWidget;
import 'package:flutter/material.dart';

class NavigateListItemModel extends FlutterFlowModel<NavigateListItemWidget> {
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
