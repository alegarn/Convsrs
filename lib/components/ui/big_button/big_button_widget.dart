import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'big_button_model.dart';
export 'big_button_model.dart';

class BigButtonWidget extends StatefulWidget {
  const BigButtonWidget({super.key});

  @override
  State<BigButtonWidget> createState() => _BigButtonWidgetState();
}

class _BigButtonWidgetState extends State<BigButtonWidget> {
  late BigButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BigButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: FFButtonWidget(
        onPressed: () {
          print('bigButton pressed ...');
        },
        text: 'Decks',
        options: FFButtonOptions(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.25,
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          iconPadding: const EdgeInsets.all(0.0),
          color: FlutterFlowTheme.of(context).primary,
          textStyle: FlutterFlowTheme.of(context).displayLarge.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).info,
                letterSpacing: 0.0,
              ),
          elevation: 3.0,
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          hoverColor: FlutterFlowTheme.of(context).accent1,
        ),
      ),
    );
  }
}
