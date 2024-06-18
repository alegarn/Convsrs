import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'retrieval_screen_model.dart';
export 'retrieval_screen_model.dart';

class RetrievalScreenWidget extends StatefulWidget {
  const RetrievalScreenWidget({
    super.key,
    int? deckId,
    required this.flashcards,
  }) : deckId = deckId ?? 1;

  final int deckId;
  final List<FlashcardsInfosForRetrievalSessionRow>? flashcards;

  @override
  State<RetrievalScreenWidget> createState() => _RetrievalScreenWidgetState();
}

class _RetrievalScreenWidgetState extends State<RetrievalScreenWidget>
    with TickerProviderStateMixin {
  late RetrievalScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RetrievalScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Loaded Flashcards animation
      if (animationsMap['columnOnActionTriggerAnimation1'] != null) {
        animationsMap['columnOnActionTriggerAnimation1']!
            .controller
            .forward(from: 0.0);
      }
      // Reset counter
      _model.counter = 0;
      while (_model.counter <
          valueOrDefault<int>(
            widget.flashcards?.length,
            0,
          )) {
        // Set a flashcard in State
        _model.addToCardToReviewListState(FlashcardStruct(
          id: valueOrDefault<int>(
            widget.flashcards?[_model.counter].id,
            0,
          ),
          name: valueOrDefault<String>(
            widget.flashcards?[_model.counter].name,
            'name',
          ),
          textRecto: valueOrDefault<String>(
            widget.flashcards?[_model.counter].textRecto,
            'textRecto',
          ),
          textVerso: valueOrDefault<String>(
            widget.flashcards?[_model.counter].textVerso,
            'textVerso0',
          ),
          currentRetrievalStep: valueOrDefault<int>(
            widget.flashcards?[_model.counter].currentRetrievalStep,
            0,
          ),
          currentSpeakingStep: valueOrDefault<int>(
            widget.flashcards?[_model.counter].currentSpeakingStep,
            0,
          ),
          toRecall: valueOrDefault<int>(
            widget.flashcards?[_model.counter].toRecall,
            0,
          ),
          currentSpeakingDate: valueOrDefault<String>(
            widget.flashcards?[_model.counter].currentSpeakingDate,
            '0',
          ),
          nextSpeakingDate: valueOrDefault<String>(
            widget.flashcards?[_model.counter].currentSpeakingDate,
            '0',
          ),
          successCount: valueOrDefault<int>(
            widget.flashcards?[_model.counter].successCount,
            0,
          ),
          totalReviewCount: valueOrDefault<int>(
            widget.flashcards?[_model.counter].totalReviewCount,
            0,
          ),
          mentalImageBool: valueOrDefault<int>(
            widget.flashcards?[_model.counter].mentalImageBool,
            0,
          ),
          audioRectoUrl: 'none',
          audioVersoUrl: 'none',
          imageRectoUrl: 'none',
          imageVersoUrl: 'none',
          currentRecallDate: valueOrDefault<String>(
            widget.flashcards?[_model.counter].currentRecallDate,
            '0',
          ),
          nextRecallDate: valueOrDefault<String>(
            widget.flashcards?[_model.counter].nextRecallDate,
            '0',
          ),
          userId: FFAppState().userUuid,
        ));
        // +1 counter
        _model.counter = _model.counter + 1;
        setState(() {});
      }
      // Loaded FlashcardsToReview
      if (animationsMap['columnOnActionTriggerAnimation2'] != null) {
        animationsMap['columnOnActionTriggerAnimation2']!
            .controller
            .forward(from: 0.0);
      }
      // Set Total Cards Count
      _model.totalCardsCount = valueOrDefault<int>(
        _model.cardToReviewListState.length,
        0,
      );
      // Counter reset
      _model.counter = 0;
      while (_model.counter <
          valueOrDefault<int>(
            widget.flashcards?.length,
            0,
          )) {
        // Update cardsStatus
        _model.addToCardsStatus(FlashcardsRetrievalStatusStruct(
          id: valueOrDefault<int>(
            widget.flashcards?[_model.counter].id,
            0,
          ),
          status: 'waiting',
          toReviewAgainThisSessionCount:
              FFAppState().timeCountToValidateRetrieval,
          currentRetrievalStep: valueOrDefault<int>(
            widget.flashcards?[_model.counter].currentRetrievalStep,
            0,
          ),
        ));
        // +1 counter
        _model.counter = _model.counter + 1;
      }
      // Loaded CardStats animation
      if (animationsMap['rowOnActionTriggerAnimation'] != null) {
        animationsMap['rowOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      // Extract First flashcard (array 0)
      _model.currentCard = _model.cardToReviewListState.first;
      // set currentCardId, currentCardFrontText, currentCardBackText
      _model.currentCardId = valueOrDefault<int>(
        _model.currentCard?.id,
        0,
      );
      _model.currentCardFrontText = valueOrDefault<String>(
        _model.currentCard?.textRecto,
        'none',
      );
      _model.currentCardBackText = valueOrDefault<String>(
        _model.currentCard?.textVerso,
        'none',
      );
      _model.currentCardFaceShown = false;
      setState(() {});
      // Launch timer
      _model.retrievalTimerController.onStartTimer();
    });

    animationsMap.addAll({
      'columnOnActionTriggerAnimation1': AnimationInfo(
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
      'columnOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: const Color(0x5802F811),
            angle: 0.524,
          ),
        ],
      ),
      'rowOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xFCC92424),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FlipEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 2.0,
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Retrieval Session',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  // Stop Retrieval
                  await _model.endOfRetrievalSession(
                    context,
                    userId: currentUserUid,
                    deckId: widget.deckId,
                  );
                },
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Cards Reviewed',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.cardReviewedList.length
                                            .toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '/',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        3.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.totalCardsCount.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowTimer(
                                initialTime: _model.retrievalTimerInitialTimeMs,
                                getDisplayTime: (value) =>
                                    StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: false,
                                  milliSecond: false,
                                ),
                                controller: _model.retrievalTimerController,
                                updateStateInterval:
                                    const Duration(milliseconds: 1000),
                                onChanged: (value, displayTime, shouldUpdate) {
                                  _model.retrievalTimerMilliseconds = value;
                                  _model.retrievalTimerValue = displayTime;
                                  if (shouldUpdate) setState(() {});
                                },
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ).animateOnActionTrigger(
                        animationsMap['rowOnActionTriggerAnimation']!,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Stack(
                            children: [
                              if (_model.currentCardFaceShown == false)
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      // Card animation
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation'] !=
                                          null) {
                                        await animationsMap[
                                                'containerOnActionTriggerAnimation']!
                                            .controller
                                            .forward(from: 0.0);
                                      }
                                      // Flip Card
                                      _model.currentCardFaceShown =
                                          !_model.currentCardFaceShown;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.currentCard?.textRecto,
                                            'textRecto',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation']!,
                                  ),
                                ),
                              if (_model.currentCardFaceShown == true)
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.currentCard?.textVerso,
                                          'textVerso',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ).animateOnActionTrigger(
                  animationsMap['columnOnActionTriggerAnimation2']!,
                ),
              ),
              if (_model.currentCardFaceShown == true)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 32.0, 10.0, 32.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              // currentCardIsRemembered
                              _model.currentCardIsRemembered = false;
                              // set counter
                              _model.counter = 0;
                              while (
                                  _model.counter < _model.cardsStatus.length) {
                                if (_model.currentCardId ==
                                    _model.cardsStatus[_model.counter].id) {
                                  // currentRetrievalStep reset
                                  _model.updateCardsStatusAtIndex(
                                    _model.counter,
                                    (e) => e..currentRetrievalStep = 0,
                                  );
                                  _model.updateCurrentCardStruct(
                                    (e) => e..currentRetrievalStep = 0,
                                  );
                                  // Update the card status / toReviewAgainThisSessionCount
                                  _model.updateCardsStatusAtIndex(
                                    _model.counter,
                                    (e) => e
                                      ..status = 'failed'
                                      ..toReviewAgainThisSessionCount =
                                          valueOrDefault<int>(
                                        _model.cardsStatus[_model.counter]
                                                    .currentRetrievalStep ==
                                                0
                                            ? 5
                                            : 0,
                                        0,
                                      ),
                                  );
                                  break;
                                } else {
                                  // increment counter
                                  _model.counter = _model.counter + 1;
                                }
                              }
                              if (functions
                                  .isCurrentcardToReviewAgainThisSession(
                                      _model.currentCard!,
                                      _model.cardsStatus.toList())) {
                                // Remove currentCard from cardToReviewListState
                                _model
                                    .removeAtIndexFromCardToReviewListState(0);
                                // Set currentCard to the end of FlashcardsList
                                _model.addToCardToReviewListState(
                                    _model.currentCard!);
                              } else {
                                // set currentCard update fields
                                _model.updateCurrentCardStruct(
                                  (e) => e
                                    ..currentRetrievalStep = 1
                                    ..incrementTotalReviewCount(1)
                                    ..currentSpeakingStep = 1,
                                );
                                _model.cardFailedCount =
                                    _model.cardFailedCount + 1;
                                // update cardReviewedList, add currentCard
                                _model
                                    .addToCardReviewedList(_model.currentCard!);
                                // Remove currentCard from cardToReviewListState
                                _model
                                    .removeAtIndexFromCardToReviewListState(0);
                                // Set currentCard to the end of FlashcardsList
                                _model.addToCardToReviewListState(
                                    _model.currentCard!);
                              }

                              if ((_model.cardToReviewListState.length == 1) &&
                                  (valueOrDefault<int>(
                                        _model.cardsStatus
                                            .where((e) =>
                                                _model.cardToReviewListState
                                                    .first.id ==
                                                e.id)
                                            .toList()
                                            .first
                                            .toReviewAgainThisSessionCount,
                                        0,
                                      ) ==
                                      0)) {
                                // RetrievalSession Stops
                                await _model.endOfRetrievalSession(
                                  context,
                                  userId: valueOrDefault<String>(
                                    FFAppState().userUuid,
                                    'RetrievalScreenUserUUID',
                                  ),
                                  deckId: widget.deckId,
                                );
                                return;
                              } else {
                                // Add next flashard to currentCard
                                _model.currentCard =
                                    _model.cardToReviewListState.first;
                                // Reset currentCardFaceShown
                                _model.currentCardFaceShown =
                                    !_model.currentCardFaceShown;
                                // Display new cardInfos, update states
                                _model.currentCardFrontText =
                                    valueOrDefault<String>(
                                  _model.currentCard?.textRecto,
                                  'error',
                                );
                                _model.currentCardBackText =
                                    valueOrDefault<String>(
                                  _model.currentCard?.textVerso,
                                  'error',
                                );
                                _model.currentCardId = valueOrDefault<int>(
                                  _model.currentCard?.id,
                                  0,
                                );
                                setState(() {});
                              }
                            },
                            text: 'Not remember',
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 32.0, 10.0, 32.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              // currentCardIsRemembered
                              _model.currentCardIsRemembered = true;
                              // set counter
                              _model.counter = 0;
                              while (
                                  _model.counter < _model.cardsStatus.length) {
                                if (_model.currentCardId ==
                                    _model.cardsStatus[_model.counter].id) {
                                  // Update the card status / toReviewAgainThisSessionCount
                                  _model.updateCardsStatusAtIndex(
                                    _model.counter,
                                    (e) => e
                                      ..status = 'succeeded'
                                      ..toReviewAgainThisSessionCount =
                                          valueOrDefault<int>(
                                        _model.cardsStatus[_model.counter]
                                                    .currentRetrievalStep ==
                                                1
                                            ? valueOrDefault<int>(
                                                _model
                                                        .cardsStatus[
                                                            _model.counter]
                                                        .toReviewAgainThisSessionCount -
                                                    1,
                                                0,
                                              )
                                            : 0,
                                        0,
                                      ),
                                  );
                                  break;
                                } else {
                                  // increment counter
                                  _model.counter = _model.counter + 1;
                                }
                              }
                              if (functions
                                  .isCurrentcardToReviewAgainThisSession(
                                      _model.currentCard!,
                                      _model.cardsStatus.toList())) {
                                // Remove currentCard from cardToReviewListState
                                _model
                                    .removeAtIndexFromCardToReviewListState(0);
                                // Set currentCard to the end of FlashcardsList
                                _model.addToCardToReviewListState(
                                    _model.currentCard!);
                              } else {
                                // set currentCard update fields
                                _model.updateCurrentCardStruct(
                                  (e) => e
                                    ..incrementTotalReviewCount(1)
                                    ..incrementSuccessCount(1)
                                    ..toRecall = 1,
                                );
                                // Add Validated Count +1
                                _model.cardValidatedCount =
                                    _model.cardValidatedCount + 1;
                                // update cardReviewedList, add currentCard
                                _model
                                    .addToCardReviewedList(_model.currentCard!);
                                // Remove currentCard from cardToReviewListState
                                _model
                                    .removeAtIndexFromCardToReviewListState(0);
                              }

                              if (_model.cardToReviewListState.isEmpty) {
                                // RetrievalSession ends
                                await _model.endOfRetrievalSession(
                                  context,
                                  userId: valueOrDefault<String>(
                                    FFAppState().userUuid,
                                    'SuccessButtonDefaultUserUUId',
                                  ),
                                  deckId: widget.deckId,
                                );
                                return;
                              } else {
                                // Add next flashard to currentCard
                                _model.currentCard =
                                    _model.cardToReviewListState.first;
                                // Reset currentCardFaceShown
                                _model.currentCardFaceShown =
                                    !_model.currentCardFaceShown;
                                // Display new cardInfos, update states
                                _model.currentCardFrontText =
                                    valueOrDefault<String>(
                                  _model.currentCard?.textRecto,
                                  'error',
                                );
                                _model.currentCardBackText =
                                    valueOrDefault<String>(
                                  _model.currentCard?.textVerso,
                                  'error',
                                );
                                _model.currentCardId = valueOrDefault<int>(
                                  _model.currentCard?.id,
                                  0,
                                );
                                setState(() {});
                                return;
                              }
                            },
                            text: 'Success',
                            options: FFButtonOptions(
                              width: 300.0,
                              height: 50.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).success,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ).animateOnActionTrigger(
            animationsMap['columnOnActionTriggerAnimation1']!,
          ),
        ),
      ),
    );
  }
}
