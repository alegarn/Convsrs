import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:flutter/material.dart';

Future newTagInsert(
  BuildContext context, {
  String? name,
}) async {
  List<TagsGETAllRow>? allTagsNew;

  // Create new tag (need to verify existance)
  await SQLiteManager.instance.tagsINSERTNew(
    name: name!,
    categoriesList: '[\"flashcard\"]',
  );
  // Get new tag for the list
  allTagsNew = await SQLiteManager.instance.tagsGETAll();
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
