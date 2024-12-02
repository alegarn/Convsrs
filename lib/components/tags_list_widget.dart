import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'tags_list_model.dart';
export 'tags_list_model.dart';

class TagsListWidget extends StatefulWidget {
  const TagsListWidget({
    super.key,
    this.displayedListTagsState,
    required this.tagTransfert,
    required this.otherListTagsState,
    String? category,
    required this.removeTagFromState,
    bool? selectedTagType,
  })  : category = category ?? 'flashcard',
        selectedTagType = selectedTagType ?? true;

  final List<TagStruct>? displayedListTagsState;
  final Future Function(TagStruct tagItem)? tagTransfert;
  final List<TagStruct>? otherListTagsState;
  final String category;
  final Future Function(TagStruct tagItem)? removeTagFromState;
  final bool selectedTagType;

  @override
  State<TagsListWidget> createState() => _TagsListWidgetState();
}

class _TagsListWidgetState extends State<TagsListWidget> {
  late TagsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TagsListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Can be of 2 types:
        // - selectedTags (current or tag newly selected)
        // - allTags
        //
        // A tag can be associated with more than just 1 table (the category):
        // - flashcard
        // - cheatsheetRow
        //
        // Parameters:
        // - displayTagsList
        // - otherTagsList
        // - category (name of the tag's associated table, singular, no "s")
        // - selectedTagType (is my component name  Selected Tags or All Tags)
        //
        // - removeTagFromState (callback, remove a clicked tag from current page state on delete)
        // - tagTransfert (callback to transfer a tag from this list to the other)
        Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: AutoSizeText(
                valueOrDefault<String>(
                  widget.selectedTagType ? 'Selected Tags' : 'All Tags',
                  'Selected or All Tags',
                ),
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
                        widget.displayedListTagsState?.toList() ?? [];

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
