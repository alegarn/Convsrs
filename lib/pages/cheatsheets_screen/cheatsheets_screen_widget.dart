import '/backend/sqlite/sqlite_manager.dart';
import '/components/ui/list_crud_row/list_crud_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cheatsheets_screen_model.dart';
export 'cheatsheets_screen_model.dart';

class CheatsheetsScreenWidget extends StatefulWidget {
  const CheatsheetsScreenWidget({
    super.key,
    bool? isConversation,
    this.deckId,
    int? personaId,
    this.conversationMode,
  })  : isConversation = isConversation ?? true,
        personaId = personaId ?? 0;

  final bool isConversation;
  final int? deckId;
  final int personaId;
  final String? conversationMode;

  @override
  State<CheatsheetsScreenWidget> createState() =>
      _CheatsheetsScreenWidgetState();
}

class _CheatsheetsScreenWidgetState extends State<CheatsheetsScreenWidget> {
  late CheatsheetsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheatsheetsScreenModel());

    _model.cheatsheetNameFieldTextController ??= TextEditingController();
    _model.cheatsheetNameFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Cheatsheets',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).accent4,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 12.0),
                            child: Text(
                              'Manage your cheatsheets',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.87,
                        decoration: const BoxDecoration(),
                        child:
                            FutureBuilder<List<CheatsheetsREADListIdNameRow>>(
                          future:
                              SQLiteManager.instance.cheatsheetsREADListIdName(
                            userId: FFAppState().userUuid,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final listViewCheatsheetsREADListIdNameRowList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  listViewCheatsheetsREADListIdNameRowList
                                      .length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewCheatsheetsREADListIdNameRow =
                                    listViewCheatsheetsREADListIdNameRowList[
                                        listViewIndex];
                                return wrapWithModel(
                                  model: _model.listCrudRowModels.getModel(
                                    listViewIndex.toString(),
                                    listViewIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: ListCrudRowWidget(
                                    key: Key(
                                      'Keyyu2_${listViewIndex.toString()}',
                                    ),
                                    rowName:
                                        listViewCheatsheetsREADListIdNameRow
                                            .name,
                                    elementdId:
                                        listViewCheatsheetsREADListIdNameRow.id,
                                    navigateAction: () async {
                                      if (widget.isConversation) {
                                        // ConversationScreen

                                        context.pushNamed(
                                          'ConversationScreen',
                                          queryParameters: {
                                            'personaId': serializeParam(
                                              valueOrDefault<int>(
                                                widget.personaId,
                                                1,
                                              ),
                                              ParamType.int,
                                            ),
                                            'deckId': serializeParam(
                                              widget.deckId,
                                              ParamType.int,
                                            ),
                                            'cheatsheetId': serializeParam(
                                              listViewCheatsheetsREADListIdNameRow
                                                  .id,
                                              ParamType.int,
                                            ),
                                            'conversationMode': serializeParam(
                                              widget.conversationMode,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        return;
                                      } else {
                                        // Path to update CheatSheet

                                        context.pushNamed(
                                          'CheatsheetRowsScreen',
                                          queryParameters: {
                                            'cheatsheetId': serializeParam(
                                              listViewCheatsheetsREADListIdNameRow
                                                  .id,
                                              ParamType.int,
                                            ),
                                            'deckId': serializeParam(
                                              widget.deckId,
                                              ParamType.int,
                                            ),
                                            'cheatsheetName': serializeParam(
                                              listViewCheatsheetsREADListIdNameRow
                                                  .name,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        return;
                                      }
                                    },
                                    deleteRowQueryAction: () async {
                                      // Query delete cheatsheet
                                      await SQLiteManager.instance
                                          .cheatsheetDELETEById(
                                        id: listViewCheatsheetsREADListIdNameRow
                                            .id,
                                      );
                                      // Update component

                                      safeSetState(() {});
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.8, 0.9),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderRadius: 50.0,
                  borderWidth: 0.0,
                  buttonSize: MediaQuery.sizeOf(context).width * 0.15,
                  fillColor: FlutterFlowTheme.of(context).secondary,
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).accent4,
                    size: 34.0,
                  ),
                  onPressed: () async {
                    // Show Modal
                    _model.isCreatingCheatsheet = !_model.isCreatingCheatsheet;
                    safeSetState(() {});
                  },
                ),
              ),
              if (valueOrDefault<bool>(
                _model.isCreatingCheatsheet,
                false,
              ))
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Create your cheatsheet',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: TextFormField(
                              controller:
                                  _model.cheatsheetNameFieldTextController,
                              focusNode: _model.cheatsheetNameFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.cheatsheetNameFieldTextController',
                                const Duration(milliseconds: 2000),
                                () => safeSetState(() {}),
                              ),
                              autofocus: true,
                              textInputAction: TextInputAction.done,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Cheatsheet name:',
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                hintText: 'Type name here...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model
                                  .cheatsheetNameFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                // Create a Cheatsheet
                                await SQLiteManager.instance.cheatsheetCREATE(
                                  userId: valueOrDefault<String>(
                                    FFAppState().userUuid,
                                    'defaultCheatsheetsUserUUID',
                                  ),
                                  name: _model
                                      .cheatsheetNameFieldTextController.text,
                                );
                                // Hide Modal
                                _model.isCreatingCheatsheet =
                                    !_model.isCreatingCheatsheet;
                                safeSetState(() {});
                              },
                              text: 'Validate',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).success,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 48.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                // Hide Modal
                                _model.isCreatingCheatsheet =
                                    !_model.isCreatingCheatsheet;
                                safeSetState(() {});
                              },
                              text: 'Cancel',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).error,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                      fontSize: 48.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
