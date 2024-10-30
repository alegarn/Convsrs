import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/flashcard_component/flip_card_component/flip_card_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'conversation_screen_model.dart';
export 'conversation_screen_model.dart';

class ConversationScreenWidget extends StatefulWidget {
  const ConversationScreenWidget({
    super.key,
    int? personaId,
    int? deckId,
    int? cheatsheetId,
    required this.conversationMode,
  })  : personaId = personaId ?? 1,
        deckId = deckId ?? 1,
        cheatsheetId = cheatsheetId ?? 1;

  final int personaId;
  final int deckId;
  final int cheatsheetId;
  final String? conversationMode;

  @override
  State<ConversationScreenWidget> createState() =>
      _ConversationScreenWidgetState();
}

class _ConversationScreenWidgetState extends State<ConversationScreenWidget>
    with TickerProviderStateMixin {
  late ConversationScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConversationScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Flashcards to use
      _model.flashcardsConvOutput =
          await SQLiteManager.instance.flashcardsForConversationWithDeckId(
        deckId: widget.deckId,
      );
      // Fetch the tags from tags ids in flashcards
      _model.conversationTagsList = await actions.getConversationTagsLists(
        functions
            .updateFlashcardConversationStatus(
                _model.flashcardsConvOutput?.toList())
            ?.toList(),
      );
      // Update ConversationTagsLists with tags
      _model.conversationTagsLists = _model.conversationTagsList!
          .toList()
          .cast<ConversationTagsListsStruct>();
      // totalCardNumber state
      _model.totalCardNumber = valueOrDefault<int>(
        _model.flashcardsConvOutput?.length,
        0,
      );
      // Update the timeToValidateWord
      _model.timeToValidateWord = FFAppState().timeCountToValidateConversation;
      await Future.wait([
        Future(() async {
          // Set timer
          _model.timerController.onResetTimer();
        }),
        Future(() async {
          // Put to 0 timer
          _model.totalTimerController.onResetTimer();
        }),
      ]);
      // Conversation Timer starts
      _model.totalTimerController.onStartTimer();
    });

    animationsMap.addAll({
      'pageViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 70.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
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
      'listViewOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 50.0),
            end: const Offset(0.0, 0.0),
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 530.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 30.0),
                            child: PageView(
                              controller:
                                  _model.conversationPagesViewsController ??=
                                      PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                Stack(
                                  children: [
                                    SafeArea(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        constraints: BoxConstraints(
                                          maxWidth:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          maxHeight: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final tags = _model
                                                .conversationTagsLists
                                                .toList();

                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    tags.length, (tagsIndex) {
                                                  final tagsItem =
                                                      tags[tagsIndex];
                                                  return ClipRRect(
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        minHeight: 100.0,
                                                        maxWidth:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                      ),
                                                      decoration:
                                                          const BoxDecoration(),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.getNamesFromTagList(
                                                                  tagsItem
                                                                      .tagsLists
                                                                      .toList()),
                                                              'no_tag',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final flashcardsPerTagCombinationList =
                                                                    tagsItem
                                                                        .flashcardInfosList
                                                                        .toList();

                                                                return Wrap(
                                                                  spacing: 1.0,
                                                                  runSpacing:
                                                                      1.0,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      WrapCrossAlignment
                                                                          .start,
                                                                  direction: Axis
                                                                      .horizontal,
                                                                  runAlignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                  verticalDirection:
                                                                      VerticalDirection
                                                                          .down,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  children: List.generate(
                                                                      flashcardsPerTagCombinationList
                                                                          .length,
                                                                      (flashcardsPerTagCombinationListIndex) {
                                                                    final flashcardsPerTagCombinationListItem =
                                                                        flashcardsPerTagCombinationList[
                                                                            flashcardsPerTagCombinationListIndex];
                                                                    return Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          // FlashcardStatus Update
                                                                          _model
                                                                              .updateConversationTagsListsAtIndex(
                                                                            tagsIndex,
                                                                            (e) => e
                                                                              ..updateFlashcardInfosList(
                                                                                (e) => e[valueOrDefault<int>(
                                                                                  flashcardsPerTagCombinationListIndex,
                                                                                  1,
                                                                                )]
                                                                                  ..incrementTimesValidatedByClickCount(1),
                                                                              ),
                                                                          );
                                                                          safeSetState(
                                                                              () {});
                                                                          if (tagsItem
                                                                                  .flashcardInfosList[valueOrDefault<int>(
                                                                                flashcardsPerTagCombinationListIndex,
                                                                                0,
                                                                              )]
                                                                                  .timesValidatedByClickCount ==
                                                                              _model.timeToValidateWord) {
                                                                            // wordIsValidated
                                                                            _model.updateConversationTagsListsAtIndex(
                                                                              valueOrDefault<int>(
                                                                                tagsIndex,
                                                                                0,
                                                                              ),
                                                                              (e) => e
                                                                                ..updateFlashcardInfosList(
                                                                                  (e) => e[valueOrDefault<int>(
                                                                                    flashcardsPerTagCombinationListIndex,
                                                                                    0,
                                                                                  )]
                                                                                    ..isFullyValidated = true,
                                                                                ),
                                                                            );
                                                                            // State WordValidatedCount
                                                                            _model.validatedCardNumber =
                                                                                _model.validatedCardNumber! + 1;
                                                                            safeSetState(() {});
                                                                          } else {
                                                                            return;
                                                                          }
                                                                        },
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                                                                              maxHeight: 300.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: valueOrDefault<Color>(
                                                                                flashcardsPerTagCombinationListItem.isFullyValidated ? FlutterFlowTheme.of(context).warning : FlutterFlowTheme.of(context).primary,
                                                                                FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              boxShadow: const [
                                                                                BoxShadow(
                                                                                  blurRadius: 4.0,
                                                                                  color: Color(0x33000000),
                                                                                  offset: Offset(
                                                                                    0.0,
                                                                                    2.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  AutoSizeText(
                                                                                    valueOrDefault<String>(
                                                                                      _model.showVerso
                                                                                          ? valueOrDefault<String>(
                                                                                              flashcardsPerTagCombinationListItem.textVerso,
                                                                                              'textVerso',
                                                                                            )
                                                                                          : valueOrDefault<String>(
                                                                                              flashcardsPerTagCombinationListItem.textRecto,
                                                                                              'textRecto',
                                                                                            ),
                                                                                      'Verso',
                                                                                    ),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: flashcardsPerTagCombinationListItem.isFullyValidated ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryBackground,
                                                                                          fontSize: 48.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      flashcardsPerTagCombinationListItem.timesValidatedByClickCount.toString(),
                                                                                      '0',
                                                                                    ).maybeHandleOverflow(
                                                                                      maxChars: 2,
                                                                                    ),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: flashcardsPerTagCombinationListItem.isFullyValidated ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).warning,
                                                                                          fontSize: 24.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontStyle: FontStyle.italic,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ).animateOnActionTrigger(
                                                                        animationsMap[
                                                                            'containerOnActionTriggerAnimation']!,
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: SizedBox(
                                        height: double.infinity,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.95, 0.97),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 20.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    valueOrDefault<Color>(
                                                  _model.showOptionButtons
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                                ),
                                                icon: const Icon(
                                                  Icons.dialpad,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () async {
                                                  // Card face swap
                                                  _model.showOptionButtons =
                                                      !_model.showOptionButtons;
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                            if (_model.showOptionButtons)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.7, 0.95),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  icon: const Icon(
                                                    Icons.swap_horiz_outlined,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () async {
                                                    // Card face swap
                                                    _model.showVerso =
                                                        !_model.showVerso;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            if (_model.showOptionButtons)
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.45, 0.95),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  icon: const Icon(
                                                    Icons.content_copy_outlined,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () async {
                                                    // Card face swap
                                                    await Clipboard.setData(
                                                        ClipboardData(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                      functions.extractFlashcards(
                                                          _model
                                                              .conversationTagsLists
                                                              .toList()),
                                                      'textRecto : textVerso',
                                                    )));
                                                  },
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Stack(
                                  children: [
                                    FutureBuilder<
                                        List<
                                            CheatsheetRowsREADConceptAnswerRow>>(
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final cheatSheetListViewCheatsheetRowsREADConceptAnswerRowList =
                                            snapshot.data!;

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              cheatSheetListViewCheatsheetRowsREADConceptAnswerRowList
                                                  .length,
                                          itemBuilder: (context,
                                              cheatSheetListViewIndex) {
                                            final cheatSheetListViewCheatsheetRowsREADConceptAnswerRow =
                                                cheatSheetListViewCheatsheetRowsREADConceptAnswerRowList[
                                                    cheatSheetListViewIndex];
                                            return Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.08,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3.0,
                                                                    0.0,
                                                                    3.0,
                                                                    0.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          cheatSheetListViewCheatsheetRowsREADConceptAnswerRow
                                                              .concept,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3.0,
                                                                    0.0,
                                                                    3.0,
                                                                    0.0),
                                                        child: SelectionArea(
                                                            child: Text(
                                                          cheatSheetListViewCheatsheetRowsREADConceptAnswerRow
                                                              .answer,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ).animateOnActionTrigger(
                                          animationsMap[
                                              'listViewOnActionTriggerAnimation']!,
                                        );
                                      },
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.9, 0.95),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: const Icon(
                                                Icons.swap_horiz_outlined,
                                                color: Colors.white,
                                              ),
                                              onPressed: () async {
                                                // Card face swap
                                                if (animationsMap[
                                                        'listViewOnActionTriggerAnimation'] !=
                                                    null) {
                                                  animationsMap[
                                                          'listViewOnActionTriggerAnimation']!
                                                      .controller
                                                      .forward(from: 0.0);
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                wrapWithModel(
                                  model: _model.flipCardComponentModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: FlipCardComponentWidget(
                                    deckId: widget.deckId,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-0.9, 1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller:
                                    _model.conversationPagesViewsController ??=
                                        PageController(initialPage: 0),
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.conversationPagesViewsController!
                                      .animateToPage(
                                    i,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  safeSetState(() {});
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 2.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 16.0,
                                  dotHeight: 4.0,
                                  dotColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  activeDotColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['pageViewOnPageLoadAnimation']!),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 25.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.checklist_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await _model.conversationPagesViewsController
                                  ?.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 25.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.list_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await _model.conversationPagesViewsController
                                  ?.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 25.0,
                            borderWidth: 1.0,
                            buttonSize: 45.0,
                            fillColor: FlutterFlowTheme.of(context).accent1,
                            icon: Icon(
                              Icons.add,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await _model.conversationPagesViewsController
                                  ?.animateToPage(
                                2,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 50.0,
                            borderWidth: 1.0,
                            fillColor: FlutterFlowTheme.of(context).error,
                            icon: Icon(
                              Icons.cancel_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 50.0,
                            ),
                            onPressed: () async {
                              // Timer stop
                              _model.totalTimerController.onStopTimer();
                              // Create conversation
                              await SQLiteManager.instance.conversationCREATE(
                                userId: FFAppState().userUuid,
                                personaId: widget.personaId,
                                deckId: widget.deckId,
                                cheatsheetId: widget.cheatsheetId,
                                durationMs: _model.totalTimerMilliseconds,
                                date: functions.dateNow(),
                                totalCardNumber: valueOrDefault<int>(
                                  _model.flashcardsConvOutput?.length,
                                  0,
                                ),
                                validatedCardNumber: valueOrDefault<int>(
                                  _model.validatedCardNumber,
                                  0,
                                ),
                                validatedCardIds: valueOrDefault<String>(
                                  functions.createListValidatedCardsIds(
                                      _model.conversationTagsLists.toList()),
                                  '[]',
                                ),
                                timeSpoken: _model.timeSpoken!,
                              );
                              // ConversationId
                              _model.conversationId = await SQLiteManager
                                  .instance
                                  .conversationsREADLastConversationID();
                              // Second Timer Stop
                              _model.timerController.onStopTimer();
                              // Reset BigLoopCounter / loopCounter
                              _model.loopCounter = 0;
                              _model.bigLoopCounter = 0;
                              while (_model.conversationTagsLists.length >=
                                  valueOrDefault<int>(
                                    _model.bigLoopCounter,
                                    0,
                                  )) {
                                // save BigLoopCurrentItem
                                _model.bigLoopCurrentItem =
                                    _model.conversationTagsLists[
                                        _model.bigLoopCounter];
                                while (_model
                                        .conversationTagsLists[
                                            _model.bigLoopCounter]
                                        .flashcardInfosList
                                        .length >=
                                    _model.loopCounter!) {
                                  // Update loopCurrentItem with its flashcard
                                  _model.loopCurrentItem = _model
                                      .conversationTagsLists[
                                          _model.bigLoopCounter]
                                      .flashcardInfosList[_model.loopCounter!];
                                  safeSetState(() {});
                                  if (_model
                                          .loopCurrentItem?.isFullyValidated ==
                                      true) {
                                    // Flashcard info extract
                                    _model.flashcardToUpdate =
                                        await SQLiteManager.instance
                                            .flashcardRead1WithId(
                                      flashcardId: valueOrDefault<int>(
                                        _model.loopCurrentItem?.id,
                                        1,
                                      ),
                                    );
                                    // converstationStepsIntervalsSec from stepNumber
                                    _model.converstationStepsIntervalsSec =
                                        await SQLiteManager.instance
                                            .sRSParametersGetConversationStepsIntervalsSecFromStepNumber(
                                      stepNumber: valueOrDefault<int>(
                                        valueOrDefault<int>(
                                                  _model
                                                      .flashcardToUpdate
                                                      ?.first
                                                      .currentSpeakingStep,
                                                  0,
                                                ) ==
                                                0
                                            ? 1
                                            : valueOrDefault<int>(
                                                _model.flashcardToUpdate?.first
                                                    .currentSpeakingStep,
                                                1,
                                              ),
                                        1,
                                      ),
                                    );
                                    if (() {
                                      if (functions.extractLenghtInStringArray(
                                              valueOrDefault<String>(
                                            _model
                                                .converstationStepsIntervalsSec
                                                ?.first
                                                .conversationStepsIntervalsSec,
                                            '[0]',
                                          )) <
                                          valueOrDefault<int>(
                                            _model.flashcardToUpdate?.first
                                                .currentSpeakingStep,
                                            1,
                                          )) {
                                        return false;
                                      } else if (functions
                                              .extractLenghtInStringArray(
                                                  valueOrDefault<String>(
                                            _model
                                                .converstationStepsIntervalsSec
                                                ?.first
                                                .conversationStepsIntervalsSec,
                                            '[0]',
                                          )) >=
                                          valueOrDefault<int>(
                                            _model.flashcardToUpdate?.first
                                                .currentSpeakingStep,
                                            1,
                                          )) {
                                        return true;
                                      } else {
                                        return true;
                                      }
                                    }()) {
                                      // Update currentSpeakingDate, currentSpeakingStep in corresponding Flashcard
                                      await SQLiteManager.instance
                                          .flashcardUpdate(
                                        flashcardId: valueOrDefault<int>(
                                          _model.loopCurrentItem?.id,
                                          0,
                                        ),
                                        currentSpeakingStep:
                                            valueOrDefault<int>(
                                          valueOrDefault<int>(
                                                _model.flashcardToUpdate?.first
                                                    .currentSpeakingStep,
                                                1,
                                              ) +
                                              1,
                                          1,
                                        ),
                                        currentSpeakingDate:
                                            valueOrDefault<String>(
                                          functions
                                              .updateFlashcardCurrentSpeakingDate(
                                                  valueOrDefault<int>(
                                                    _model
                                                        .flashcardToUpdate
                                                        ?.first
                                                        .currentSpeakingStep,
                                                    1,
                                                  ),
                                                  valueOrDefault<String>(
                                                    _model
                                                        .converstationStepsIntervalsSec
                                                        ?.first
                                                        .conversationStepsIntervalsSec,
                                                    '[0]',
                                                  ),
                                                  valueOrDefault<String>(
                                                    _model
                                                        .flashcardToUpdate
                                                        ?.first
                                                        .currentSpeakingDate,
                                                    'none',
                                                  )),
                                          'none',
                                        ),
                                        name: valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first.name,
                                          'conversationUpdateDefault',
                                        ),
                                        textRecto: valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .textRecto,
                                          'conversationUpdateDefault',
                                        ),
                                        textVerso: valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .textVerso,
                                          'conversationUpdateDefault',
                                        ),
                                        audioRectoUrl: valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .audioRectoUrl,
                                          'conversationUpdateDefault',
                                        ),
                                        audioVersoUrl: valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .audioVersoUrl,
                                          'conversationUpdateDefault',
                                        ),
                                        imageRectoUrl: valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .imageRectoUrl,
                                          'conversationUpdateDefault',
                                        ),
                                        imageVersoUrl: valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .imageVersoUrl,
                                          'conversationUpdateDefault',
                                        ),
                                        currentRetrievalStep:
                                            valueOrDefault<int>(
                                          _model.flashcardToUpdate?.first
                                              .currentRetrievalStep,
                                          1,
                                        ),
                                        toRecall: valueOrDefault<int>(
                                          _model.flashcardToUpdate?.first
                                              .toRecall,
                                          0,
                                        ),
                                        currentRecallDate:
                                            valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .currentRecallDate,
                                          'conversationUpdateDefault',
                                        ),
                                        nextRecallDate: valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .nextRecallDate,
                                          'nextRecallDateDefault',
                                        ),
                                        successCount: valueOrDefault<int>(
                                          _model.flashcardToUpdate?.first
                                              .successCount,
                                          1,
                                        ),
                                        totalReviewCount: valueOrDefault<int>(
                                          _model.flashcardToUpdate?.first
                                              .totalReviewCount,
                                          1,
                                        ),
                                        mentalImageBool: valueOrDefault<int>(
                                          _model.flashcardToUpdate?.first
                                              .mentalImageBool,
                                          1,
                                        ),
                                        nextSpeakingDate:
                                            valueOrDefault<String>(
                                          _model.flashcardToUpdate?.first
                                              .nextSpeakingDate,
                                          'conversationUpdateDefault',
                                        ),
                                        tagIds: valueOrDefault<String>(
                                          _model
                                              .flashcardToUpdate?.first.tagIds,
                                          '\"[1]\"',
                                        ),
                                      );
                                    }
                                  }
                                  // insert conversationsFlashcards row
                                  await SQLiteManager.instance
                                      .conversationsFlashcardsCREATEAfterConversation(
                                    flashcardId: valueOrDefault<int>(
                                      _model.loopCurrentItem?.id,
                                      0,
                                    ),
                                    conversationId: valueOrDefault<int>(
                                      _model.conversationId?.first.id,
                                      0,
                                    ),
                                  );
                                  // loopCounter incrementation
                                  _model.loopCounter = _model.loopCounter! + 1;
                                }
                                // Reset loopCounter
                                _model.loopCounter = 0;
                                // BigLoopCounter incrementation
                                _model.bigLoopCounter =
                                    _model.bigLoopCounter + 1;
                              }
                              // New conversationsPersonas
                              await SQLiteManager.instance
                                  .conversationPersonasCREATEAfterConversation(
                                personaId: valueOrDefault<String>(
                                  widget.personaId.toString(),
                                  '0',
                                ),
                                conversationId: valueOrDefault<int>(
                                  _model.conversationId?.first.id,
                                  0,
                                ),
                              );
                              // Go to next screen

                              context.goNamed(
                                'ConversationEndScreen',
                                queryParameters: {
                                  'conversationTime': serializeParam(
                                    _model.totalTimerMilliseconds,
                                    ParamType.int,
                                  ),
                                  'totalWords': serializeParam(
                                    valueOrDefault<int>(
                                      _model.totalCardNumber,
                                      0,
                                    ),
                                    ParamType.int,
                                  ),
                                  'validationsSuccess': serializeParam(
                                    _model.validatedCardNumber,
                                    ParamType.int,
                                  ),
                                  'validationsFail': serializeParam(
                                    valueOrDefault<int>(
                                      (_model.totalCardNumber!) -
                                          (_model.validatedCardNumber!),
                                      0,
                                    ),
                                    ParamType.int,
                                  ),
                                  'newCardCreated': serializeParam(
                                    0,
                                    ParamType.int,
                                  ),
                                  'wordToBeLearned': serializeParam(
                                    '0',
                                    ParamType.String,
                                  ),
                                  'deckId': serializeParam(
                                    widget.deckId,
                                    ParamType.int,
                                  ),
                                  'personaId': serializeParam(
                                    widget.personaId,
                                    ParamType.int,
                                  ),
                                  'totalWordLearned': serializeParam(
                                    0,
                                    ParamType.int,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 200),
                                  ),
                                },
                              );

                              safeSetState(() {});
                            },
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 0.79),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: const Icon(
                          Icons.record_voice_over,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          if (_model.isSpeaking) {
                            // Stop
                            _model.timerController.onStopTimer();
                            // New timeSpoken
                            _model.timeSpoken = _model.timerMilliseconds;
                          } else {
                            // Start
                            _model.timerController.onStartTimer();
                          }

                          // isSpeaking value toggled
                          _model.isSpeaking = !_model.isSpeaking;
                          safeSetState(() {});
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: FlutterFlowTimer(
                          initialTime: _model.timerInitialTimeMs,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            milliSecond: false,
                          ),
                          controller: _model.timerController,
                          updateStateInterval: const Duration(milliseconds: 1000),
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) safeSetState(() {});
                          },
                          textAlign: TextAlign.justify,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Text(
                        'Total',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: FlutterFlowTimer(
                          initialTime: _model.totalTimerInitialTimeMs,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            milliSecond: false,
                          ),
                          controller: _model.totalTimerController,
                          updateStateInterval: const Duration(milliseconds: 1000),
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.totalTimerMilliseconds = value;
                            _model.totalTimerValue = displayTime;
                            if (shouldUpdate) safeSetState(() {});
                          },
                          textAlign: TextAlign.justify,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
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
    );
  }
}
