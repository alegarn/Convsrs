import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'tag_list_model.dart';
export 'tag_list_model.dart';

class TagListWidget extends StatefulWidget {
  const TagListWidget({
    super.key,
    required this.tagsParameter,
    this.selectedTags,
  });

  final List<TagStruct>? tagsParameter;
  final List<TagStruct>? selectedTags;

  @override
  State<TagListWidget> createState() => _TagListWidgetState();
}

class _TagListWidgetState extends State<TagListWidget>
    with TickerProviderStateMixin {
  late TagListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Get tags
      _model.allTagsState = widget.tagsParameter!.toList().cast<TagStruct>();
      if (widget.selectedTags != null && (widget.selectedTags)!.isNotEmpty) {
        // Update selectedTags
        _model.selectedTagList =
            widget.selectedTags!.toList().cast<TagStruct>();
        // Filter allTags
        _model.allTagsState = functions
            .filterSelectedTagsInAllTags(
                widget.selectedTags?.toList(), widget.tagsParameter!.toList())
            .toList()
            .cast<TagStruct>();
        safeSetState(() {});
      } else {
        // Same filter
        _model.selectedTagList = functions
            .filterSelectedTagsInAllTags(
                widget.selectedTags?.toList(), widget.tagsParameter!.toList())
            .toList()
            .cast<TagStruct>();
        safeSetState(() {});
      }
    });

    _model.newTagFieldTextController ??= TextEditingController();
    _model.newTagFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'wrapOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        constraints: const BoxConstraints(
          minHeight: 200.0,
          maxHeight: 350.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 2,
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: 50.0,
                      maxHeight: MediaQuery.sizeOf(context).height * 0.3,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      child: TextFormField(
                        controller: _model.newTagFieldTextController,
                        focusNode: _model.newTagFieldFocusNode,
                        onFieldSubmitted: (_) async {
                          // Create new tag (need to verify existance)
                          await SQLiteManager.instance.tagsINSERTNew(
                            name: _model.newTagFieldTextController.text,
                            categoriesList: '[\"flashcard\"]',
                          );
                          // Update New Tag state
                          _model.newTag = _model.newTagFieldTextController.text;
                          // Get new tag for the list
                          _model.allTagsNew =
                              await SQLiteManager.instance.tagsGETAll();
                          // Format the tags
                          _model.allTagsState = functions
                              .formatNewTags(_model.allTagsNew?.toList())
                              .toList()
                              .cast<TagStruct>();
                          safeSetState(() {});
                          // Reset field
                          safeSetState(() {
                            _model.newTagFieldTextController?.clear();
                          });

                          safeSetState(() {});
                        },
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'New tag',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                          alignLabelWithHint: false,
                          hintText: 'Enter your new Tag',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    lineHeight: 2.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
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
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                        validator: _model.newTagFieldTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: AutoSizeText(
                          'Selected Tags',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.9,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final selectedTags =
                                  _model.selectedTagList.toList();

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(selectedTags.length,
                                      (selectedTagsIndex) {
                                    final selectedTagsItem =
                                        selectedTags[selectedTagsIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        // Add to allTags
                                        _model.addToAllTagsState(
                                            selectedTagsItem);
                                        // Remove from selectedTags
                                        _model.removeFromSelectedTagList(
                                            selectedTagsItem);
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                selectedTagsItem.name,
                                                'no_tag',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).divide(const SizedBox(width: 3.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: AutoSizeText(
                          'All Tags',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.95,
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.sizeOf(context).height * 1.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Builder(
                              builder: (context) {
                                final tagsItemList =
                                    _model.allTagsState.toList();

                                return Wrap(
                                  spacing: 0.0,
                                  runSpacing: 0.0,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(tagsItemList.length,
                                      (tagsItemListIndex) {
                                    final tagsItemListItem =
                                        tagsItemList[tagsItemListIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 3.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          // Put in selectedTags
                                          _model.addToSelectedTagList(
                                              tagsItemListItem);
                                          // Remove from allTags
                                          _model.removeFromAllTagsState(
                                              tagsItemListItem);
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  tagsItemListItem.name,
                                                  'no_tag',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ).animateOnPageLoad(
                                    animationsMap['wrapOnPageLoadAnimation']!);
                              },
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
        ),
      ),
    );
  }
}
