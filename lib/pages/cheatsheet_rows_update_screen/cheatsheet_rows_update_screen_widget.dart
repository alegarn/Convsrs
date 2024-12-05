import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/ui/tags_list/tags_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'cheatsheet_rows_update_screen_model.dart';
export 'cheatsheet_rows_update_screen_model.dart';

class CheatsheetRowsUpdateScreenWidget extends StatefulWidget {
  const CheatsheetRowsUpdateScreenWidget({
    super.key,
    String? concept,
    String? description,
    String? tagIds,
    int? cheatsheetId,
    int? id,
  })  : concept = concept ?? 'concept',
        description = description ?? 'description',
        tagIds = tagIds ?? '[1]',
        cheatsheetId = cheatsheetId ?? 1,
        id = id ?? 1;

  final String concept;
  final String description;
  final String tagIds;
  final int cheatsheetId;
  final int id;

  @override
  State<CheatsheetRowsUpdateScreenWidget> createState() =>
      _CheatsheetRowsUpdateScreenWidgetState();
}

class _CheatsheetRowsUpdateScreenWidgetState
    extends State<CheatsheetRowsUpdateScreenWidget>
    with TickerProviderStateMixin {
  late CheatsheetRowsUpdateScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheatsheetRowsUpdateScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // GET All tags
      _model.allTagsOutput = await SQLiteManager.instance.tagsGETAllFromCtg(
        category: 'cheatsheetRow',
      );
      // Get Tags
      _model.selectedTagsOutput = await actions.getSelectedTagsFromTagIds(
        widget.tagIds,
      );
      // Get selected tags in state
      _model.selectedTags =
          _model.selectedTagsOutput!.toList().cast<TagStruct>();
      safeSetState(() {});
      // Update allTags State
      _model.allTags = functions
          .filterSelectedTagsInAllTags(_model.selectedTags.toList(),
              functions.formatNewTags(_model.allTagsOutput?.toList()).toList())
          .toList()
          .cast<TagStruct>();
      safeSetState(() {});
    });

    _model.conceptTextFieldTextController ??=
        TextEditingController(text: widget.concept);
    _model.conceptTextFieldFocusNode ??= FocusNode();

    _model.descriptionTextFieldTextController ??=
        TextEditingController(text: widget.description);
    _model.descriptionTextFieldFocusNode ??= FocusNode();

    _model.newTagFieldTextController ??= TextEditingController();
    _model.newTagFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
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
            buttonSize: 46.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).info,
              size: 25.0,
            ),
            onPressed: () async {
              // Navigate back
              context.safePop();
            },
          ),
          title: Text(
            'Update Cheatsheet Row',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).info,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Edit Cheatsheet Row Details',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextFormField(
                                controller:
                                    _model.conceptTextFieldTextController,
                                focusNode: _model.conceptTextFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Concept (you know)',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                minLines: 1,
                                validator: _model
                                    .conceptTextFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller:
                                    _model.descriptionTextFieldTextController,
                                focusNode: _model.descriptionTextFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Description (to learn)',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                minLines: 1,
                                validator: _model
                                    .descriptionTextFieldTextControllerValidator
                                    .asValidator(context),
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),

                    // Create / Move your tags saved in a column tagIds (Flashcards)
                    // TagListContainer all needs list:
                    // - Page action: ManageGetTags on page loading
                    // - tagIds col in Flashcards
                    // - selectedTagsState (List <Tag>)
                    // - allTagsState (List <Tag>)
                    // - from a state to other state transfer 2 functions
                    // - Tags *CRU*(D) functions including SQL
                    // - formatNewTags()
                    // - Reset tags states
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxHeight: 350.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 15.0, 5.0, 15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: double.infinity,
                                      constraints: BoxConstraints(
                                        minHeight: 50.0,
                                        maxHeight:
                                            MediaQuery.sizeOf(context).height *
                                                0.3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            child: TextFormField(
                                              controller: _model
                                                  .newTagFieldTextController,
                                              focusNode:
                                                  _model.newTagFieldFocusNode,
                                              onFieldSubmitted: (_) async {
                                                // Does tag Exist ?
                                                _model.tagExistString =
                                                    await actions
                                                        .verifyIfTagExist(
                                                  valueOrDefault<String>(
                                                    _model
                                                        .newTagFieldTextController
                                                        .text,
                                                    'newTagDefault',
                                                  ),
                                                  'cheatsheetRow',
                                                );
                                                if (_model.tagExistString ==
                                                    'true') {
                                                  // Shows tag exists
                                                  if (animationsMap[
                                                          'textOnActionTriggerAnimation'] !=
                                                      null) {
                                                    await animationsMap[
                                                            'textOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0)
                                                        .whenComplete(animationsMap[
                                                                'textOnActionTriggerAnimation']!
                                                            .controller
                                                            .reverse);
                                                  }
                                                } else if (_model
                                                        .tagExistString ==
                                                    'false') {
                                                  // Create new tag (need to verify existance)
                                                  await SQLiteManager.instance
                                                      .tagsINSERTNew(
                                                    name:
                                                        valueOrDefault<String>(
                                                      _model
                                                          .newTagFieldTextController
                                                          .text,
                                                      'newTagField INSERT default',
                                                    ),
                                                    categoriesList:
                                                        '[\"cheatsheetRow\"]',
                                                  );
                                                  // Get new tag for the list
                                                  _model.allTagsNewFalse =
                                                      await SQLiteManager
                                                          .instance
                                                          .tagsGETAllFromCtg(
                                                    category: 'cheatsheetRow',
                                                  );
                                                  // GET new tag, filter selected
                                                  _model.allTags = functions
                                                      .filterSelectedTagsInAllTags(
                                                          _model.selectedTags
                                                              .toList(),
                                                          functions
                                                              .formatNewTags(_model
                                                                  .allTagsNewFalse
                                                                  ?.toList())
                                                              .toList())
                                                      .toList()
                                                      .cast<TagStruct>();
                                                  // Reset field
                                                  safeSetState(() {
                                                    _model
                                                        .newTagFieldTextController
                                                        ?.clear();
                                                  });
                                                } else {
                                                  // Update tag with new category
                                                  await SQLiteManager.instance
                                                      .tagsUPDATEAddCategoryIf(
                                                    newTagName:
                                                        valueOrDefault<String>(
                                                      _model
                                                          .newTagFieldTextController
                                                          .text,
                                                      'newTagField UPDATE default',
                                                    ),
                                                    category: 'cheatsheetRow',
                                                  );
                                                  // Get new tag for the list
                                                  _model.allTagsNewUpdate =
                                                      await SQLiteManager
                                                          .instance
                                                          .tagsGETAllFromCtg(
                                                    category: 'cheatsheetRow',
                                                  );
                                                  // GET new tag, filter selected
                                                  _model.allTags = functions
                                                      .filterSelectedTagsInAllTags(
                                                          _model.selectedTags
                                                              .toList(),
                                                          functions
                                                              .formatNewTags(_model
                                                                  .allTagsNewUpdate
                                                                  ?.toList())
                                                              .toList())
                                                      .toList()
                                                      .cast<TagStruct>();
                                                  // Reset field
                                                  safeSetState(() {
                                                    _model
                                                        .newTagFieldTextController
                                                        ?.clear();
                                                  });
                                                }

                                                safeSetState(() {});
                                              },
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText: 'New tag',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                alignLabelWithHint: false,
                                                hintText: 'Enter your new Tag',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 2.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .newTagFieldTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Text(
                                              'Tag already exists',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ).animateOnActionTrigger(
                                              animationsMap[
                                                  'textOnActionTriggerAnimation']!,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: wrapWithModel(
                                  model: _model.selectedTagsListModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TagsListWidget(
                                    category: 'cheatsheetRow',
                                    selectedTagType: true,
                                    displayedListTagsState: _model.selectedTags,
                                    otherListTagsState: _model.allTags,
                                    tagTransfert: (tagItem) async {
                                      if (!_model.allTags.contains(tagItem)) {
                                        // Add to allTags
                                        _model.addToAllTags(tagItem);
                                      }
                                      // Remove from selectedTags
                                      _model.removeFromSelectedTags(tagItem);
                                      safeSetState(() {});
                                    },
                                    removeTagFromState: (tagItem) async {
                                      // Remove selected tag from state
                                      _model.removeFromSelectedTags(tagItem);
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: wrapWithModel(
                                  model: _model.allTagsListModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: TagsListWidget(
                                    category: 'cheatsheetRow',
                                    selectedTagType: false,
                                    displayedListTagsState: _model.allTags,
                                    otherListTagsState: _model.selectedTags,
                                    tagTransfert: (tagItem) async {
                                      if (!_model.selectedTags
                                          .contains(tagItem)) {
                                        // Put in selectedTags
                                        _model.addToSelectedTags(tagItem);
                                      }
                                      // Remove from allTags
                                      _model.removeFromAllTags(tagItem);
                                      safeSetState(() {});
                                    },
                                    removeTagFromState: (tagItem) async {
                                      // Remove tag from AllTags
                                      _model.removeFromAllTags(tagItem);
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        // Update cheatsheet row
                        await SQLiteManager.instance.cheatsheetRowsUPDATERow(
                          cheatsheetId: widget.cheatsheetId,
                          concept: _model.conceptTextFieldTextController.text,
                          answer:
                              _model.descriptionTextFieldTextController.text,
                          rowId: widget.id,
                          tagIds: valueOrDefault<String>(
                            functions.formatSelectedTagsToIds(
                                _model.selectedTags.toList()),
                            '[1]',
                          ),
                          conceptAudioUrl: 'none',
                          answerAudioUrl: 'none',
                        );
                        // Back to Cheatsheet Rows page
                        context.safePop();
                      },
                      text: 'Update Cheatsheet Row',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 56.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        // Navigate back
                        context.safePop();
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 56.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x00FFFFFF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
