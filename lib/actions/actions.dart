import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future newTagInsert(
  BuildContext context, {
  String? name,
}) async {
  List<TagsGETAllFromCtgRow>? allTagsNew;

  // Create new tag (need to verify existance)
  await SQLiteManager.instance.tagsINSERTNew(
    name: name!,
    categoriesList: '[\"flashcard\"]',
  );
  // Get new tag for the list
  allTagsNew = await SQLiteManager.instance.tagsGETAllFromCtg(
    category: 'flashcard',
  );
}

Future moveSelectedTagToAllTags(
  BuildContext context, {
  required List<TagStruct>? selectedTagsItem,
  List<TagStruct>? allTags,
}) async {
  if (!selectedTagsItem!.contains(TagStruct(
    id: 1,
    name: 'no_tag',
  ))) {}
}

Future moveTagToSelectedTags(
  BuildContext context, {
  required List<TagStruct>? selectedTags,
  required TagStruct? tagItem,
}) async {
  if (!selectedTags!.contains(tagItem)) {}
}

Future deleteOrUpdateTagInDatabase(
  BuildContext context, {
  required String? category,
  required TagStruct? tagItem,
}) async {
  List<TagsGETCtgsByIdRow>? tagGetOutput;

  // Get Tag
  tagGetOutput = await SQLiteManager.instance.tagsGETCtgsById(
    id: valueOrDefault<int>(
      tagItem?.id,
      1,
    ),
  );
  if (functions.verifyIfOnlyOneCategoryIsLeft(
          valueOrDefault<String>(
            tagGetOutput.first.categories,
            '[]',
          ),
          category!) ==
      'true') {
    // Delete selected tag
    await SQLiteManager.instance.tagsDELETEById(
      id: valueOrDefault<int>(
        tagItem?.id,
        1,
      ),
    );
  } else {
    // Modify Tag category
    await SQLiteManager.instance.tagsUPDATERemoveCategory(
      id: valueOrDefault<int>(
        tagItem?.id,
        1,
      ),
      category: category,
    );
  }
}
