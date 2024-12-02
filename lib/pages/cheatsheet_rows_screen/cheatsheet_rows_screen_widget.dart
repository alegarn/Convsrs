import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/components/tags_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'cheatsheet_rows_screen_model.dart';
export 'cheatsheet_rows_screen_model.dart';

class CheatsheetRowsScreenWidget extends StatefulWidget {
  const CheatsheetRowsScreenWidget({
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
  State<CheatsheetRowsScreenWidget> createState() =>
      _CheatsheetRowsScreenWidgetState();
}

class _CheatsheetRowsScreenWidgetState extends State<CheatsheetRowsScreenWidget>
    with TickerProviderStateMixin {
  late CheatsheetRowsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheatsheetRowsScreenModel());

    _model.cheatsheetRowConceptFieldTextController ??= TextEditingController();
    _model.cheatsheetRowConceptFieldFocusNode ??= FocusNode();

    _model.cheatsheetRowDescriptionFieldTextController ??=
        TextEditingController();
    _model.cheatsheetRowDescriptionFieldFocusNode ??= FocusNode();

    _model.newTagFieldTextController ??= TextEditingController();
    _model.newTagFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.07),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: true,
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
                  Text(
                    valueOrDefault<String>(
                      widget.cheatsheetName,
                      'Cheatsheet name',
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).accent4,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
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
                            flex: 4,
                            child: Text(
                              'Concept    ',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Flexible(
                            flex: 4,
                            child: Text(
                              'Description',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
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
                          shrinkWrap: true,
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
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
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
                                            minFontSize: 14.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          )),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                          child: VerticalDivider(
                                            width: 1.0,
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
                                            textAlign: TextAlign.center,
                                            minFontSize: 14.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          )),
                                        ),
                                        if (_model.isDeleting)
                                          Flexible(
                                            flex: 1,
                                            child: FlutterFlowIconButton(
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.text_fields,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                // Navigate to Update Page

                                                context.pushNamed(
                                                  'CheatsheetRowsUpdateScreen',
                                                  queryParameters: {
                                                    'concept': serializeParam(
                                                      cheatsheetListViewCheatsheetRowsREADConceptAnswerRow
                                                          .concept,
                                                      ParamType.String,
                                                    ),
                                                    'description':
                                                        serializeParam(
                                                      cheatsheetListViewCheatsheetRowsREADConceptAnswerRow
                                                          .answer,
                                                      ParamType.String,
                                                    ),
                                                    'tagIds': serializeParam(
                                                      cheatsheetListViewCheatsheetRowsREADConceptAnswerRow
                                                          .tagIds,
                                                      ParamType.String,
                                                    ),
                                                    'cheatsheetId':
                                                        serializeParam(
                                                      widget.cheatsheetId,
                                                      ParamType.int,
                                                    ),
                                                    'id': serializeParam(
                                                      cheatsheetListViewCheatsheetRowsREADConceptAnswerRow
                                                          .id,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                            ),
                                          ),
                                        if (_model.isDeleting)
                                          Flexible(
                                            flex: 1,
                                            child: FlutterFlowIconButton(
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

                                                safeSetState(() {});
                                              },
                                            ),
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
                  borderColor: FlutterFlowTheme.of(context).success,
                  borderRadius: 50.0,
                  borderWidth: 1.0,
                  buttonSize: MediaQuery.sizeOf(context).width * 0.15,
                  fillColor: FlutterFlowTheme.of(context).secondary,
                  icon: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 34.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    // Get tags in State
                    await _model.getTagsInStateCheatsheetRows(context);
                    safeSetState(() {});
                    // Show isCreatingRow
                    _model.isCreatingRow = !_model.isCreatingRow;
                    safeSetState(() {});
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
                                  () => safeSetState(() {}),
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
                                  () => safeSetState(() {}),
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

                          // Create / Move your tags saved in a column tagIds (cheatsheetRows)
                          // TagListContainer all needs list:
                          // - getTagsInStateCheatsheetRows()
                          // - tagIds col in cheatsheetRows (a migration)
                          // - selectedTagsState (List <Tag>)
                          // - allTagsState (List <Tag>)
                          // - from a state to other state transfer 2 functions
                          // - Tags *CR*(UD) functions including SQL
                          // - formatNewTags()
                          // - Reset tags states
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 3.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              constraints: const BoxConstraints(
                                minHeight: 200.0,
                                maxHeight: 350.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 5.0, 5.0, 5.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: double.infinity,
                                            constraints: BoxConstraints(
                                              minHeight: 50.0,
                                              maxHeight:
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.3,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .newTagFieldTextController,
                                                    focusNode: _model
                                                        .newTagFieldFocusNode,
                                                    onFieldSubmitted:
                                                        (_) async {
                                                      // verifyIfTagExist
                                                      _model.tagExistString =
                                                          await actions
                                                              .verifyIfTagExist(
                                                        _model
                                                            .newTagFieldTextController
                                                            .text,
                                                        'cheatsheetRow',
                                                      );
                                                      if (_model
                                                              .tagExistString ==
                                                          'true') {
                                                        // Shows tag exists
                                                        if (animationsMap[
                                                                'textOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'textOnActionTriggerAnimation']!
                                                              .controller
                                                              .forward(
                                                                  from: 0.0)
                                                              .whenComplete(
                                                                  animationsMap[
                                                                          'textOnActionTriggerAnimation']!
                                                                      .controller
                                                                      .reverse);
                                                        }
                                                      } else if (_model
                                                              .tagExistString ==
                                                          'false') {
                                                        // Create new tag
                                                        await SQLiteManager
                                                            .instance
                                                            .tagsINSERTNew(
                                                          name: valueOrDefault<
                                                              String>(
                                                            _model
                                                                .newTagFieldTextController
                                                                .text,
                                                            'newTagFieldDefault CREATE',
                                                          ),
                                                          categoriesList:
                                                              '[\"cheatsheetRow\"]',
                                                        );
                                                        // Get new tag for the list (being tested)
                                                        _model.allTagsNewFalse =
                                                            await SQLiteManager
                                                                .instance
                                                                .tagsGETAllFromCtg(
                                                          category:
                                                              'cheatsheetRow',
                                                        );
                                                        // Format and save the newly updated allTags
                                                        _model.allTagsState = functions
                                                            .formatNewTags(_model
                                                                .allTagsNewFalse
                                                                ?.toList())
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
                                                        await SQLiteManager
                                                            .instance
                                                            .tagsUPDATEAddCategoryIf(
                                                          newTagName:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .newTagFieldTextController
                                                                .text,
                                                            'newTagFieldDefault UPDATE',
                                                          ),
                                                          category:
                                                              'cheatsheetRow',
                                                        );
                                                        // Get new tag for the list
                                                        _model.allTagsNewUpdate =
                                                            await SQLiteManager
                                                                .instance
                                                                .tagsGETAllFromCtg(
                                                          category:
                                                              'cheatsheetRow',
                                                        );
                                                        // Format and save the newly updated allTags
                                                        _model.allTagsState = functions
                                                            .formatNewTags(_model
                                                                .allTagsNewUpdate
                                                                ?.toList())
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      alignLabelWithHint: false,
                                                      hintText:
                                                          'Enter your new Tag',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                lineHeight: 2.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .newTagFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    'Tag already exists',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TagsListWidget(
                                          category: 'cheatsheetRow',
                                          selectedTagType: true,
                                          displayedListTagsState:
                                              _model.selectedTagsState,
                                          otherListTagsState:
                                              _model.allTagsState,
                                          tagTransfert: (tagItem) async {
                                            if (!_model.allTagsState
                                                .contains(tagItem)) {
                                              // Add item to allTags
                                              _model.addToAllTagsState(tagItem);
                                            }
                                            // Remove item from selectedTags
                                            _model.removeFromSelectedTagsState(
                                                tagItem);
                                            safeSetState(() {});
                                          },
                                          removeTagFromState: (tagItem) async {
                                            // Selected Tag deletion to match the backend
                                            _model.removeFromSelectedTagsState(
                                                tagItem);
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: wrapWithModel(
                                        model: _model.allTagsListModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TagsListWidget(
                                          category: 'cheatsheetRow',
                                          selectedTagType: false,
                                          displayedListTagsState:
                                              _model.allTagsState,
                                          otherListTagsState:
                                              _model.selectedTagsState,
                                          tagTransfert: (tagItem) async {
                                            if (!_model.selectedTagsState
                                                .contains(tagItem)) {
                                              // Put tag item in selectedTags
                                              _model.addToSelectedTagsState(
                                                  tagItem);
                                            }
                                            // Remove from allTags
                                            _model.removeFromAllTagsState(
                                                tagItem);
                                            safeSetState(() {});
                                          },
                                          removeTagFromState:
                                              (tagItem) async {},
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 5.0)),
                                ),
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
                              flex: 1,
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
                                    tagIds: valueOrDefault<String>(
                                      functions.formatSelectedTagsToIds(
                                          _model.selectedTagsState.toList()),
                                      '[1]',
                                    ),
                                  );
                                  // Created cheatsheet row animation
                                  if (animationsMap[
                                          'buttonOnActionTriggerAnimation'] !=
                                      null) {
                                    animationsMap[
                                            'buttonOnActionTriggerAnimation']!
                                        .controller
                                      ..reset()
                                      ..repeat();
                                  }
                                  // End creating UI
                                  _model.isCreatingRow = !_model.isCreatingRow;
                                  safeSetState(() {});
                                  // Stop animation
                                  if (animationsMap[
                                          'buttonOnActionTriggerAnimation'] !=
                                      null) {
                                    animationsMap[
                                            'buttonOnActionTriggerAnimation']!
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
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ).animateOnActionTrigger(
                                animationsMap[
                                    'buttonOnActionTriggerAnimation']!,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  // Close Modal
                                  _model.isCreatingRow = !_model.isCreatingRow;
                                  safeSetState(() {});
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
                                    width: 0.0,
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
          ],
        ),
      ),
    );
  }
}
