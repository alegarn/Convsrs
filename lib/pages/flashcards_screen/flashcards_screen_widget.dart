import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/ui/list_crud_row/list_crud_row_widget.dart';
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
import 'flashcards_screen_model.dart';
export 'flashcards_screen_model.dart';

class FlashcardsScreenWidget extends StatefulWidget {
  const FlashcardsScreenWidget({
    super.key,
    int? deckId,
    String? deckName,
  })  : deckId = deckId ?? 1,
        deckName = deckName ?? 'deckName';

  final int deckId;
  final String deckName;

  @override
  State<FlashcardsScreenWidget> createState() => _FlashcardsScreenWidgetState();
}

class _FlashcardsScreenWidgetState extends State<FlashcardsScreenWidget>
    with TickerProviderStateMixin {
  late FlashcardsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlashcardsScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Get deck from Id
      _model.deckInfos = await SQLiteManager.instance.deckRead1FromId(
        id: widget.deckId,
      );
      // Get all Tags
      _model.allTagsForState = await SQLiteManager.instance.tagsGETAll();
      // allTags update
      _model.allTagsPageState = functions
          .filterSelectedTagsInAllTags(_model.selectedTagsPageState.toList(),
              functions.formatNewTags(_model.allTags?.toList()).toList())
          .toList()
          .cast<TagStruct>();
      // Add no_tag to selectedTags
      _model.selectedTagsPageState = _model.allTagsPageState
          .where((e) =>
              valueOrDefault<int>(
                e.id,
                1,
              ) ==
              1)
          .toList()
          .toList()
          .cast<TagStruct>();
      safeSetState(() {});
    });

    _model.nameFieldTextController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();

    _model.textRectoFieldTextController ??= TextEditingController();
    _model.textRectoFieldFocusNode ??= FocusNode();

    _model.textVersoFieldTextController ??= TextEditingController();
    _model.textVersoFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
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
            'Flashcards',
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
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              1.0,
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 12.0),
                            child: Text(
                              'Deck: ${valueOrDefault<String>(
                                widget.deckName,
                                'deckName',
                              )}',
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
                        child: FutureBuilder<
                            List<FlashcardsReadAllFromDeckNameAndIdRow>>(
                          future: SQLiteManager.instance
                              .flashcardsReadAllFromDeckNameAndId(
                            deckId: widget.deckId,
                            userId: valueOrDefault<String>(
                              FFAppState().userUuid,
                              'FlashcardsScreenUserUUID',
                            ),
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
                            final flashcardListViewFlashcardsReadAllFromDeckNameAndIdRowList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  flashcardListViewFlashcardsReadAllFromDeckNameAndIdRowList
                                      .length,
                              itemBuilder: (context, flashcardListViewIndex) {
                                final flashcardListViewFlashcardsReadAllFromDeckNameAndIdRow =
                                    flashcardListViewFlashcardsReadAllFromDeckNameAndIdRowList[
                                        flashcardListViewIndex];
                                return wrapWithModel(
                                  model: _model.flashcardListCrudRowModels
                                      .getModel(
                                    flashcardListViewIndex.toString(),
                                    flashcardListViewIndex,
                                  ),
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: ListCrudRowWidget(
                                    key: Key(
                                      'Keybpt_${flashcardListViewIndex.toString()}',
                                    ),
                                    rowName: valueOrDefault<String>(
                                      flashcardListViewFlashcardsReadAllFromDeckNameAndIdRow
                                          .name,
                                      'deck',
                                    ),
                                    elementdId:
                                        flashcardListViewFlashcardsReadAllFromDeckNameAndIdRow
                                            .id,
                                    navigateAction: () async {
                                      // Navigate to FlashcardUpdate

                                      context.pushNamed(
                                        'FlashcardUpdateScreen',
                                        queryParameters: {
                                          'flashcardId': serializeParam(
                                            flashcardListViewFlashcardsReadAllFromDeckNameAndIdRow
                                                .id,
                                            ParamType.int,
                                          ),
                                          'isCreation': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                          'deckId': serializeParam(
                                            widget.deckId,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    deleteRowQueryAction: () async {
                                      // Flashcard Remove row query by Id
                                      await SQLiteManager.instance
                                          .flashcardDeleteWithId(
                                        flashcardId: valueOrDefault<int>(
                                          flashcardListViewFlashcardsReadAllFromDeckNameAndIdRow
                                              .id,
                                          0,
                                        ),
                                      );
                                      // Delete row decksFlashcards
                                      await SQLiteManager.instance
                                          .decksFlashcardsDELETERowByFlashcardId(
                                        flashcardId:
                                            flashcardListViewFlashcardsReadAllFromDeckNameAndIdRow
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
                    size: 48.0,
                  ),
                  onPressed: () async {
                    // Get all tags
                    _model.allTags = await SQLiteManager.instance.tagsGETAll();
                    // Show modal
                    _model.isCreatingFlashcard = !_model.isCreatingFlashcard;
                    safeSetState(() {});

                    safeSetState(() {});
                  },
                ),
              ),
              if (_model.isCreatingFlashcard)
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    constraints: const BoxConstraints(
                      maxHeight: 950.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Create your Flashcard',
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
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                child: TextFormField(
                                  controller: _model.nameFieldTextController,
                                  focusNode: _model.nameFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.nameFieldTextController',
                                    const Duration(milliseconds: 2000),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Flashcard name:',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Typeflashcard\'s  name here...',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                  minLines: 1,
                                  validator: _model
                                      .nameFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                child: TextFormField(
                                  controller:
                                      _model.textRectoFieldTextController,
                                  focusNode: _model.textRectoFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textRectoFieldTextController',
                                    const Duration(milliseconds: 2000),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Text recto: (known)',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        'Type flashcard\'s text recto here...',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
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
                                  maxLines: 3,
                                  minLines: 1,
                                  validator: _model
                                      .textRectoFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                child: TextFormField(
                                  controller:
                                      _model.textVersoFieldTextController,
                                  focusNode: _model.textVersoFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textVersoFieldTextController',
                                    const Duration(milliseconds: 2000),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Text verso: (to learn)',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        'Type flascard\'s text verso here...',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 3,
                                  minLines: 1,
                                  validator: _model
                                      .textVersoFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 10.0),
                              child: wrapWithModel(
                                model: _model.tagListModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TagListWidget(
                                  tagIds: '[1]',
                                  selectedTags: _model.selectedTagsPageState,
                                  allTags: _model.allTagsPageState,
                                  moveTagFromSelectedTags:
                                      (selectedTagItem) async {
                                    if (!_model.allTagsPageState
                                        .contains(selectedTagItem)) {
                                      // Add to allTags
                                      _model.addToAllTagsPageState(
                                          selectedTagItem);
                                    }
                                    // Remove from selectedTags
                                    _model.removeFromSelectedTagsPageState(
                                        selectedTagItem);
                                    safeSetState(() {});
                                  },
                                  moveTagFromAllTags: (allTagItem) async {
                                    if (!_model.selectedTagsPageState
                                        .contains(allTagItem)) {
                                      // Put in selectedTags
                                      _model.addToSelectedTagsPageState(
                                          allTagItem);
                                    }
                                    // Remove from allTags
                                    _model
                                        .removeFromAllTagsPageState(allTagItem);
                                    safeSetState(() {});
                                  },
                                  newTagCallback: (tagName) async {
                                    // Create new tag (need to verify existance)
                                    await SQLiteManager.instance.tagsINSERTNew(
                                      name: valueOrDefault<String>(
                                        tagName,
                                        'tagName',
                                      ),
                                      categoriesList: '[\"flashcard\"]',
                                    );
                                    // Get new tag for the list
                                    _model.allTagsNew = await SQLiteManager
                                        .instance
                                        .tagsGETAll();
                                    // Format the tags
                                    _model.allTagsPageState = functions
                                        .formatNewTags(
                                            _model.allTagsNew?.toList())
                                        .toList()
                                        .cast<TagStruct>();
                                    safeSetState(() {});
                                    // Reset field
                                    safeSetState(() {
                                      _model.tagListModel
                                          .newTagFieldTextController
                                          ?.clear();
                                    });

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: FFButtonWidget(
                              onPressed: () async {
                                // Create Flashcard
                                await SQLiteManager.instance.flashcardCreate(
                                  userId: valueOrDefault<String>(
                                    FFAppState().userUuid,
                                    'CreateFlashcardUserUUID',
                                  ),
                                  textRecto:
                                      _model.textRectoFieldTextController.text,
                                  textVerso:
                                      _model.textVersoFieldTextController.text,
                                  name: _model.nameFieldTextController.text,
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
                                  currentSpeakingDate: 'none',
                                  nextSpeakingDate: 'none',
                                  tagIds: valueOrDefault<String>(
                                    functions.formatSelectedTagsToIds(
                                        _model.selectedTagsPageState.toList()),
                                    '\"[1]\"',
                                  ),
                                );
                                // Return last Flashcard Id
                                _model.lastFlashcardId = await SQLiteManager
                                    .instance
                                    .flashcardsSELECTLastId();
                                // Link FlashcardsDeck
                                await SQLiteManager.instance
                                    .decksFlashcardsCREATERow(
                                  deckId: widget.deckId,
                                  flashcardId:
                                      _model.lastFlashcardId!.first.id!,
                                );
                                // totalCards Deck Update
                                await SQLiteManager.instance
                                    .decksIncrementTotalCards(
                                  deckId: widget.deckId,
                                );
                                // Button shines
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'buttonOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                // Reset tags states
                                _model.selectedTagsPageState = [];
                                _model.allTagsPageState = [];
                                // Reset fields
                                safeSetState(() {
                                  _model.nameFieldTextController?.clear();
                                  _model.textRectoFieldTextController?.clear();
                                  _model.textVersoFieldTextController?.clear();
                                  _model.tagListModel.newTagFieldTextController
                                      ?.clear();
                                });
                                // isCreatingFlashacard toggle
                                _model.isCreatingFlashcard =
                                    !_model.isCreatingFlashcard;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              text: 'Validate',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.5,
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
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation']!,
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
    );
  }
}
