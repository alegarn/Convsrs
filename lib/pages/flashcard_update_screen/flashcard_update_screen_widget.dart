import '/backend/sqlite/sqlite_manager.dart';
import '/components/flashcard_component/insert_audio_flashcard/insert_audio_flashcard_widget.dart';
import '/components/ui/tag_list/tag_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'flashcard_update_screen_model.dart';
export 'flashcard_update_screen_model.dart';

class FlashcardUpdateScreenWidget extends StatefulWidget {
  const FlashcardUpdateScreenWidget({
    super.key,
    int? flashcardId,
    bool? isCreation,
    required this.deckId,
  })  : flashcardId = flashcardId ?? 1,
        isCreation = isCreation ?? true;

  final int flashcardId;
  final bool isCreation;
  final int? deckId;

  @override
  State<FlashcardUpdateScreenWidget> createState() =>
      _FlashcardUpdateScreenWidgetState();
}

class _FlashcardUpdateScreenWidgetState
    extends State<FlashcardUpdateScreenWidget> with TickerProviderStateMixin {
  late FlashcardUpdateScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlashcardUpdateScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isCreation) {
        // Flashcard creation
        await SQLiteManager.instance.flashcardCreate(
          userId: valueOrDefault<String>(
            FFAppState().userUuid,
            'userUUID',
          ),
          textRecto: 'text recto ',
          textVerso: 'text verso',
          audioRectoUrl: 'none',
          audioVersoUrl: 'none',
          imageRectoUrl: 'none',
          imageVersoUrl: 'none',
          currentRetrievalStep: 0,
          currentSpeakingStep: 0,
          toRecall: 0,
          currentRecallDate: 'none',
          nextRecallDate: 'none',
          successCount: 0,
          totalReviewCount: 0,
          mentalImageBool: 0,
          name: 'put name',
          currentSpeakingDate: 'none',
          nextSpeakingDate: 'none',
          tagIds: '[\"flashcard\"]',
        );
        // Return last Flashcard Id
        _model.lastFlashcardId1 =
            await SQLiteManager.instance.flashcardsSELECTLastId();
        // Link FlashcardsDeck
        await SQLiteManager.instance.decksFlashcardsCREATERow(
          deckId: widget.deckId!,
          flashcardId: _model.lastFlashcardId1!.first.id!,
        );
        // totalCards Deck Update
        await SQLiteManager.instance.decksIncrementTotalCards(
          deckId: widget.deckId!,
        );
        // Update Flashcard State
        _model.userId = valueOrDefault<String>(
          FFAppState().userUuid,
          'updateFlashcardDefault',
        );
        _model.name = 'put name';
        _model.textRecto = 'text recto ';
        _model.textVerso = 'text verso';
        _model.audioRectoUrl = 'none';
        _model.audioVersoUrl = 'none';
        _model.imageRectoUrl = 'none';
        _model.imageVersoUrl = 'none';
        _model.currentRetrievalStep = 1;
        _model.currentSpeakingStep = 1;
        _model.toRecall = 0;
        safeSetState(() {});
      } else {
        // read Flashcard with Id
        _model.listSQLite1flashcard =
            await SQLiteManager.instance.flashcardRead1WithId(
          flashcardId: widget.flashcardId,
        );
        // Update Flashcard State
        _model.name = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.name,
          'card',
        );
        _model.userId = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.userId,
          'carduserId',
        );
        _model.textRecto = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.textRecto,
          'cardTextRecto',
        );
        _model.textVerso = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.textVerso,
          'cardTextVerso',
        );
        _model.audioRectoUrl = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.audioRectoUrl,
          'cardAudioUrlRecto',
        );
        _model.audioVersoUrl = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.audioVersoUrl,
          'cardAudioVersoUrl',
        );
        _model.imageRectoUrl = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.imageRectoUrl,
          'cardImageUrl',
        );
        _model.imageVersoUrl = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.imageVersoUrl,
          'cardImageVersoUrl',
        );
        _model.currentRetrievalStep = valueOrDefault<int>(
          _model.listSQLite1flashcard?.first.currentRetrievalStep,
          0,
        );
        _model.currentSpeakingStep = valueOrDefault<int>(
          _model.listSQLite1flashcard?.first.currentSpeakingStep,
          0,
        );
        _model.toRecall = valueOrDefault<int>(
          _model.listSQLite1flashcard?.first.toRecall,
          0,
        );
        _model.flashcardInfos = _model.listSQLite1flashcard?.first;
        _model.currentRecallDate = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.currentRecallDate,
          'none',
        );
        _model.tagIdsState = valueOrDefault<String>(
          _model.listSQLite1flashcard?.first.tagIds,
          '\"[0]\"',
        );
        safeSetState(() {});
      }

      await Future.wait([
        Future(() async {
          // Update name field
          safeSetState(() {
            _model.cardNameFieldTextController?.text = _model.name;
            _model.cardNameFieldTextController?.selection =
                TextSelection.collapsed(
                    offset: _model.cardNameFieldTextController!.text.length);
          });
        }),
        Future(() async {
          // Modify textRecto
          safeSetState(() {
            _model.textRectoFieldTextController?.text = _model.textRecto;
            _model.textRectoFieldTextController?.selection =
                TextSelection.collapsed(
                    offset: _model.textRectoFieldTextController!.text.length);
          });
        }),
        Future(() async {
          // Modify textVerso
          safeSetState(() {
            _model.textVersoFieldTextController?.text = _model.textVerso;
            _model.textVersoFieldTextController?.selection =
                TextSelection.collapsed(
                    offset: _model.textVersoFieldTextController!.text.length);
          });
        }),
      ]);
    });

    _model.cardNameFieldTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      _model.name,
      'name',
    ));
    _model.cardNameFieldFocusNode ??= FocusNode();
    _model.cardNameFieldFocusNode!.addListener(() => safeSetState(() {}));
    _model.textRectoFieldTextController ??=
        TextEditingController(text: _model.textRecto);
    _model.textRectoFieldFocusNode ??= FocusNode();

    _model.textVersoFieldTextController ??=
        TextEditingController(text: _model.flashcardInfos?.textVerso);
    _model.textVersoFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'iconButtonOnActionTriggerAnimation': AnimationInfo(
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            'Flashcard Config',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 6,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 450.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        child: TextFormField(
                          controller: _model.cardNameFieldTextController,
                          focusNode: _model.cardNameFieldFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.cardNameFieldTextController',
                            const Duration(milliseconds: 2000),
                            () async {
                              _model.name =
                                  _model.cardNameFieldTextController.text;
                              safeSetState(() {});
                            },
                          ),
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Card Name',
                            labelStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Card title/name',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.center,
                          validator: _model.cardNameFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 5,
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    constraints: const BoxConstraints(
                                      maxHeight: 300.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                        topLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: Stack(
                                              children: [
                                                if (_model.showRecto)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Flexible(
                                                            flex: 2,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textRectoFieldTextController,
                                                              focusNode: _model
                                                                  .textRectoFieldFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.textRectoFieldTextController',
                                                                const Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                () async {
                                                                  // State textRecto Update
                                                                  _model.textRecto =
                                                                      valueOrDefault<
                                                                          String>(
                                                                    _model
                                                                        .textRectoFieldTextController
                                                                        .text,
                                                                    'textRectoState',
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Write your word here...',
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                filled: true,
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              validator: _model
                                                                  .textRectoFieldTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 4,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              constraints:
                                                                  const BoxConstraints(
                                                                maxHeight:
                                                                    350.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text:
                                                                    'Insert Image',
                                                                icon: const Icon(
                                                                  Icons
                                                                      .image_sharp,
                                                                  size: 15.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .insertAudioFlashcardModel1,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  const InsertAudioFlashcardWidget(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (!_model.showRecto)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Flexible(
                                                            flex: 2,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textVersoFieldTextController,
                                                              focusNode: _model
                                                                  .textVersoFieldFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.textVersoFieldTextController',
                                                                const Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                () async {
                                                                  _model.textVerso =
                                                                      valueOrDefault<
                                                                          String>(
                                                                    _model
                                                                        .textVersoFieldTextController
                                                                        .text,
                                                                    'textVersoState',
                                                                  );
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Write your word here...',
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              validator: _model
                                                                  .textVersoFieldTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 4,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  1.0,
                                                              constraints:
                                                                  const BoxConstraints(
                                                                maxHeight:
                                                                    350.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text:
                                                                    'Insert Image',
                                                                icon: const Icon(
                                                                  Icons
                                                                      .image_sharp,
                                                                  size: 15.0,
                                                                ),
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .insertAudioFlashcardModel2,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  const InsertAudioFlashcardWidget(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.showRecto == true
                                                      ? 'Recto'
                                                      : 'Verso',
                                                  'recto',
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FontStyle.italic,
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
                            Flexible(
                              flex: 1,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  // Toggle card face state
                                  _model.showRecto = !_model.showRecto;
                                  safeSetState(() {});
                                },
                                text: 'Flip',
                                icon: const Icon(
                                  Icons.flip,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.08,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 6,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 350.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.tagListModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TagListWidget(
                      tagIds: valueOrDefault<String>(
                        _model.tagIdsState,
                        'defaultPatameterState',
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 100.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x34111417),
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 12.0, 15.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderRadius: 30.0,
                                    borderWidth: 2.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    icon: Icon(
                                      Icons.verified_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 36.0,
                                    ),
                                    onPressed: () async {
                                      var shouldSetState = false;
                                      if (widget.isCreation) {
                                        // Create Flashcard
                                        await SQLiteManager.instance
                                            .flashcardCreate(
                                          userId: valueOrDefault<String>(
                                            FFAppState().userUuid,
                                            'finishCardUserUUID',
                                          ),
                                          textRecto: _model
                                              .textRectoFieldTextController
                                              .text,
                                          textVerso: _model
                                              .textVersoFieldTextController
                                              .text,
                                          audioRectoUrl: 'none',
                                          audioVersoUrl: 'none',
                                          imageRectoUrl: 'none',
                                          imageVersoUrl: 'none',
                                          currentRetrievalStep: 0,
                                          currentSpeakingStep: 0,
                                          toRecall: 0,
                                          currentRecallDate: 'none',
                                          nextRecallDate: 'none',
                                          successCount: 0,
                                          totalReviewCount: 0,
                                          mentalImageBool: 0,
                                          name: valueOrDefault<String>(
                                            _model.cardNameFieldTextController
                                                .text,
                                            'name',
                                          ),
                                          currentSpeakingDate: 'none',
                                          nextSpeakingDate: 'none',
                                          tagIds: '[1]',
                                        );
                                        // Return last Flashcard Id
                                        _model.lastFlashcardId =
                                            await SQLiteManager.instance
                                                .flashcardsSELECTLastId();
                                        shouldSetState = true;
                                        // Link FlashcardsDeck
                                        await SQLiteManager.instance
                                            .decksFlashcardsCREATERow(
                                          deckId: widget.deckId!,
                                          flashcardId:
                                              _model.lastFlashcardId!.first.id!,
                                        );
                                        // totalCards Deck Update
                                        await SQLiteManager.instance
                                            .decksIncrementTotalCards(
                                          deckId: widget.deckId!,
                                        );
                                        // Show the confirmation
                                        if (animationsMap[
                                                'iconButtonOnActionTriggerAnimation'] !=
                                            null) {
                                          await animationsMap[
                                                  'iconButtonOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      } else {
                                        // Update Flashcard
                                        await SQLiteManager.instance
                                            .flashcardUpdate(
                                          flashcardId: widget.flashcardId,
                                          name: valueOrDefault<String>(
                                            _model.cardNameFieldTextController
                                                .text,
                                            'name',
                                          ),
                                          textRecto: valueOrDefault<String>(
                                            _model.textRectoFieldTextController
                                                .text,
                                            'widget recto',
                                          ),
                                          textVerso: valueOrDefault<String>(
                                            _model.textVersoFieldTextController
                                                .text,
                                            'field text verso',
                                          ),
                                          audioRectoUrl: _model.audioRectoUrl,
                                          audioVersoUrl: _model.audioVersoUrl,
                                          imageRectoUrl: _model.imageRectoUrl,
                                          imageVersoUrl: _model.imageVersoUrl,
                                          currentRetrievalStep:
                                              valueOrDefault<int>(
                                            _model.currentRetrievalStep,
                                            0,
                                          ),
                                          currentSpeakingStep:
                                              valueOrDefault<int>(
                                            _model.currentSpeakingStep,
                                            0,
                                          ),
                                          toRecall: _model.toRecall,
                                          currentRecallDate:
                                              valueOrDefault<String>(
                                            _model.currentRecallDate,
                                            'updateCardDefault',
                                          ),
                                          nextRecallDate:
                                              valueOrDefault<String>(
                                            _model
                                                .flashcardInfos?.nextRecallDate,
                                            'none',
                                          ),
                                          successCount: valueOrDefault<int>(
                                            _model.flashcardInfos?.successCount,
                                            0,
                                          ),
                                          totalReviewCount: valueOrDefault<int>(
                                            _model.flashcardInfos
                                                ?.totalReviewCount,
                                            0,
                                          ),
                                          mentalImageBool: valueOrDefault<int>(
                                            _model.flashcardInfos
                                                ?.mentalImageBool,
                                            0,
                                          ),
                                          currentSpeakingDate:
                                              valueOrDefault<String>(
                                            _model.flashcardInfos
                                                ?.currentSpeakingDate,
                                            'none',
                                          ),
                                          nextSpeakingDate:
                                              valueOrDefault<String>(
                                            _model.flashcardInfos
                                                ?.nextSpeakingDate,
                                            'none',
                                          ),
                                          tagIds: valueOrDefault<String>(
                                            functions.formatSelectedTagsToIds(
                                                _model.tagListModel
                                                    .selectedTagListState
                                                    .toList()),
                                            '\"[1]\"',
                                          ),
                                        );
                                        // Navigate back
                                        context.safePop();
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      }

                                      if (shouldSetState) safeSetState(() {});
                                    },
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'iconButtonOnActionTriggerAnimation']!,
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
            ],
          ),
        ),
      ),
    );
  }
}
