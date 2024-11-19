import '/components/ui/list_button/list_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_crud_row_model.dart';
export 'list_crud_row_model.dart';

class ListCrudRowWidget extends StatefulWidget {
  const ListCrudRowWidget({
    super.key,
    String? rowName,
    int? elementdId,
    required this.navigateAction,
    required this.deleteRowQueryAction,
    bool? isVisible,
  })  : rowName = rowName ?? 'rowName',
        elementdId = elementdId ?? 0,
        isVisible = isVisible ?? true;

  final String rowName;
  final int elementdId;
  final Future Function()? navigateAction;
  final Future Function()? deleteRowQueryAction;
  final bool isVisible;

  @override
  State<ListCrudRowWidget> createState() => _ListCrudRowWidgetState();
}

class _ListCrudRowWidgetState extends State<ListCrudRowWidget> {
  late ListCrudRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListCrudRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: valueOrDefault<bool>(
        (widget.isVisible == true) || (widget.isVisible == null),
        true,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 72.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).alternate,
                offset: const Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
          ),
          child: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!_model.isShowingOptions)
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        // Navigate to
                        await widget.navigateAction?.call();
                      },
                      onLongPress: () async {
                        // Show/Hide options
                        _model.isShowingOptions = !_model.isShowingOptions;
                        safeSetState(() {});
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.rectangle,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          widget.rowName,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 24.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    // Display/Hide isShowOptions state
                    _model.isShowingOptions = !_model.isShowingOptions;
                    safeSetState(() {});
                  },
                  child: wrapWithModel(
                    model: _model.listButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const ListButtonWidget(),
                  ),
                ),
                if (_model.isShowingOptions)
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 1.0, 0.0, 1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                // Delete Row Query
                                await widget.deleteRowQueryAction?.call();
                              },
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                constraints: BoxConstraints(
                                  minWidth: 50.0,
                                  minHeight:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  maxHeight:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0x00F90303),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: const Color(0xFFF60404),
                                    width: 2.0,
                                  ),
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 3.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      'Delete: ${valueOrDefault<String>(
                                        widget.rowName,
                                        'rowName',
                                      )} ?',
                                      'delete flashcard ?',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: const Color(0xFFF90303),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
