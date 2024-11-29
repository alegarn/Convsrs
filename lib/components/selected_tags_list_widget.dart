import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'selected_tags_list_model.dart';
export 'selected_tags_list_model.dart';

class SelectedTagsListWidget extends StatefulWidget {
  const SelectedTagsListWidget({
    super.key,
    bool? tagOptionsVisible,
    this.selectedTagState,
    required this.tagTransfert,
    required this.allTagsState,
    String? category,
    required this.removeTagFromState,
  })  : tagOptionsVisible = tagOptionsVisible ?? false,
        category = category ?? 'flashcard';

  final bool tagOptionsVisible;
  final List<TagStruct>? selectedTagState;
  final Future Function(TagStruct item)? tagTransfert;
  final List<TagStruct>? allTagsState;
  final String category;
  final Future Function(TagStruct tag)? removeTagFromState;

  @override
  State<SelectedTagsListWidget> createState() => _SelectedTagsListWidgetState();
}

class _SelectedTagsListWidgetState extends State<SelectedTagsListWidget> {
  late SelectedTagsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectedTagsListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                style: FlutterFlowTheme.of(context).titleMedium.override(
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
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Builder(
                  builder: (context) {
                    final selectedTagsItemsRow =
                        widget.selectedTagState?.toList() ?? [];

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(selectedTagsItemsRow.length,
                            (selectedTagsItemsRowIndex) {
                          final selectedTagsItemsRowItem =
                              selectedTagsItemsRow[selectedTagsItemsRowIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              // Transfer from selected tags to allTags
                              await widget.tagTransfert?.call(
                                selectedTagsItemsRowItem,
                              );
                            },
                            onLongPress: () async {
                              // Toggle tag options
                              _model.displayTagOption =
                                  !_model.displayTagOption;
                              safeSetState(() {});
                            },
                            child: Container(
                              height: 32.0,
                              constraints: const BoxConstraints(
                                minWidth: 48.0,
                                minHeight: 48.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          selectedTagsItemsRowItem.name,
                                          'no_tag',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    _model.displayTagOption,
                                    false,
                                  ))
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        // Delete or Update Tag in db
                                        await action_blocks
                                            .deleteOrUpdateTagInDatabase(
                                          context,
                                          category: widget.category,
                                          tagItem: selectedTagsItemsRowItem,
                                        );
                                        // Update tag id in flashcards
                                        unawaited(
                                          () async {
                                            await SQLiteManager.instance
                                                .flashcardsUPDATETagIdsInAllFlashcards(
                                              tagId: valueOrDefault<String>(
                                                selectedTagsItemsRowItem.id
                                                    .toString(),
                                                '1',
                                              ),
                                            );
                                          }(),
                                        );
                                        // Remove tag from list
                                        await widget.removeTagFromState?.call(
                                          selectedTagsItemsRowItem,
                                        );
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 24.0,
                                      ),
                                    ),
                                ],
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
    );
  }
}
