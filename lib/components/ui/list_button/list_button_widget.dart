import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_button_model.dart';
export 'list_button_model.dart';

class ListButtonWidget extends StatefulWidget {
  const ListButtonWidget({super.key});

  @override
  State<ListButtonWidget> createState() => _ListButtonWidgetState();
}

class _ListButtonWidgetState extends State<ListButtonWidget> {
  late ListButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.chevron_right_rounded,
      color: FlutterFlowTheme.of(context).secondaryText,
      size: 30.0,
    );
  }
}
