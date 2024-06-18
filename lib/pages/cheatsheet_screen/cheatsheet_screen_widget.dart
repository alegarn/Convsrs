import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'cheatsheet_screen_model.dart';
export 'cheatsheet_screen_model.dart';

class CheatsheetScreenWidget extends StatefulWidget {
  const CheatsheetScreenWidget({
    super.key,
    this.cheatsheetName,
    int? cheatsheetId,
    int? deckId,
  })  : cheatsheetId = cheatsheetId ?? 1,
        deckId = deckId ?? 0;

  final String? cheatsheetName;
  final int cheatsheetId;
  final int deckId;

  @override
  State<CheatsheetScreenWidget> createState() => _CheatsheetScreenWidgetState();
}

class _CheatsheetScreenWidgetState extends State<CheatsheetScreenWidget>
    with TickerProviderStateMixin {
  late CheatsheetScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheatsheetScreenModel());

    _model.cheatsheetRowConceptFieldTextController ??= TextEditingController();
    _model.cheatsheetRowConceptFieldFocusNode ??= FocusNode();

    _model.cheatsheetRowDescriptionFieldTextController ??=
        TextEditingController();
    _model.cheatsheetRowDescriptionFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xFFFFF000),
            angle: 0.524,
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.07),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            title: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              constraints: const BoxConstraints(
                maxWidth: 600.0,
                maxHeight: 100.0,
              ),
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
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
                  Text(
                    valueOrDefault<String>(
                      widget.cheatsheetName,
                      'cheatsheet name',
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              'Concept',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                            child: VerticalDivider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              'Description',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ]
                            .divide(const SizedBox(width: 10.0))
                            .around(const SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 9,
                    child:
                        FutureBuilder<List<CheatsheetRowsREADConceptAnswerRow>>(
                      future: SQLiteManager.instance
                          .cheatsheetRowsREADConceptAnswer(
                        cheatsheetId: widget.cheatsheetId,
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
                        final cheatsheetListViewCheatsheetRowsREADConceptAnswerRowList =
                            snapshot.data!;
                        return ReorderableListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              cheatsheetListViewCheatsheetRowsREADConceptAnswerRowList
                                  .length,
                          itemBuilder: (context, cheatsheetListViewIndex) {
                            final cheatsheetListViewCheatsheetRowsREADConceptAnswerRow =
                                cheatsheetListViewCheatsheetRowsREADConceptAnswerRowList[
                                    cheatsheetListViewIndex];
                            return Container(
                              key: ValueKey("ListView_mnfio1s9" '_' +
                                  cheatsheetListViewIndex.toString()),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onLongPress: () async {
                                  // Show/Hide button
                                  _model.isDeleting = !_model.isDeleting;
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 5.0, 2.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                          flex: 4,
                                          child: SelectionArea(
                                              child: AutoSizeText(
                                            cheatsheetListViewCheatsheetRowsREADConceptAnswerRow
                                                .concept,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            minFontSize: 14.0,
                                          )),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                          child: VerticalDivider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: SelectionArea(
                                              child: AutoSizeText(
                                            cheatsheetListViewCheatsheetRowsREADConceptAnswerRow
                                                .answer,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            minFontSize: 14.0,
                                          )),
                                        ),
                                        if (_model.isDeleting)
                                          FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                            icon: Icon(
                                              Icons.close_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              // Perform query
                                              await SQLiteManager.instance
                                                  .cheatsheetRowsDELETEId(
                                                id: cheatsheetListViewCheatsheetRowsREADConceptAnswerRow
                                                    .id,
                                              );
                                              // Display the updated content

                                              setState(() {});
                                            },
                                          ),
                                      ]
                                          .divide(const SizedBox(width: 3.0))
                                          .around(const SizedBox(width: 3.0)),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          onReorder: (int reorderableOldIndex,
                              int reorderableNewIndex) async {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.8, 0.8),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.15,
                height: MediaQuery.sizeOf(context).height * 0.07,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).accent2,
                  borderRadius: 50.0,
                  borderWidth: 1.0,
                  buttonSize: MediaQuery.sizeOf(context).width * 0.15,
                  fillColor: FlutterFlowTheme.of(context).success,
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 48.0,
                  ),
                  onPressed: () async {
                    _model.isCreatingRow = !_model.isCreatingRow;
                    setState(() {});
                  },
                ),
              ),
            ),
            if (valueOrDefault<bool>(
              _model.isCreatingRow,
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
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Create your cheatsheet\'s concept/description',
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
                                controller: _model
                                    .cheatsheetRowConceptFieldTextController,
                                focusNode:
                                    _model.cheatsheetRowConceptFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.cheatsheetRowConceptFieldTextController',
                                  const Duration(milliseconds: 1000),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Row concept:',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Type concept here...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                    .cheatsheetRowConceptFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              child: TextFormField(
                                controller: _model
                                    .cheatsheetRowDescriptionFieldTextController,
                                focusNode: _model
                                    .cheatsheetRowDescriptionFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.cheatsheetRowDescriptionFieldTextController',
                                  const Duration(milliseconds: 500),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Row description:',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Type description here...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                    .cheatsheetRowDescriptionFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  // Create Cheatsheet Row
                                  await SQLiteManager.instance
                                      .cheatsheetRowCREATE(
                                    concept: valueOrDefault<String>(
                                      _model
                                          .cheatsheetRowConceptFieldTextController
                                          .text,
                                      'concept',
                                    ),
                                    answer: valueOrDefault<String>(
                                      _model
                                          .cheatsheetRowDescriptionFieldTextController
                                          .text,
                                      'none',
                                    ),
                                    conceptAudioUrl: 'none',
                                    answerAudioUrl: 'none',
                                    cheatsheetId: valueOrDefault<int>(
                                      widget.cheatsheetId,
                                      0,
                                    ),
                                  );
                                  // Created cheatsheet row animation
                                  if (animationsMap[
                                          'buttonOnActionTriggerAnimation1'] !=
                                      null) {
                                    animationsMap[
                                            'buttonOnActionTriggerAnimation1']!
                                        .controller
                                      ..reset()
                                      ..repeat();
                                  }
                                  // End creating UI
                                  _model.isCreatingRow = !_model.isCreatingRow;
                                  setState(() {});
                                  if (animationsMap[
                                          'buttonOnActionTriggerAnimation1'] !=
                                      null) {
                                    animationsMap[
                                            'buttonOnActionTriggerAnimation1']!
                                        .controller
                                        .stop();
                                  }
                                },
                                text: 'Validate',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
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
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'buttonOnActionTriggerAnimation1']!,
                              ),
                            ),
                            Flexible(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  // Close Modal
                                  _model.isCreatingRow = !_model.isCreatingRow;
                                  setState(() {});
                                  if (animationsMap[
                                          'buttonOnActionTriggerAnimation2'] !=
                                      null) {
                                    await animationsMap[
                                            'buttonOnActionTriggerAnimation2']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
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
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'buttonOnActionTriggerAnimation2']!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
