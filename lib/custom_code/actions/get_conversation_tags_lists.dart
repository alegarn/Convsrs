// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:sqflite/sqflite.dart';

// Helper function to fetch tags by IDs from SQLite
Future<List<TagStruct>> fetchTagsByIds(List<int> ids) async {
  // delete every doublon of ids
  List<int> uniqueIds = ids.toSet().toList();
  // Create a comma-separated string of IDs for the SQL IN clause
  String idString = uniqueIds.join(',');

  // SQLite query to fetch tags by IDs
  final query = '''
    SELECT id, name FROM tags
    WHERE id IN ($idString)
  ''';

  Database db = SQLiteManager.instance.database;

  // Execute the query and convert the results to a list of TagStruct
  final List<Map<String, dynamic>> results = await db.rawQuery(query);
  return results
      .map((result) => TagStruct(id: result['id'], name: result['name']))
      .toList();
}

Future<List<ConversationTagsListsStruct>> getConversationTagsLists(
    List<FlashcardConversationStatusStruct>?
        flashcardConversationStatus) async {
  // get each ids list in every flashcards (final flashcardIds<list of int list> similar to [[1,3,...],[5,6,..]...])
  // extract the unique ids (uniqueIds <int list> is like [1,3,5,6,4,...])
  // extract the tags (by query) from unique ids
  // -> tags: TABLE "tags" ("id"	INTEGER NOT NULL DEFAULT 0 UNIQUE,"name"	TEXT NOT NULL DEFAULT 'no_tag',"categories"	TEXT NOT NULL DEFAULT '[]',PRIMARY KEY("id" AUTOINCREMENT));
  // -> SQL query Database db = SQLiteManager.instance.database;make conversationTagsLists using the extracted tags (id, name)
  // conversationTagsLists: list of tagStruct Lists [[tag, tag, ...], [tag,...], ...]
  // -> the structure is similar to flashcardIds list, but list of tags (id, name) instead
  // -> sort conversationTagsLists list lists in alphabetical order
  // sort conversationTagsLists list in alphabetical order (first element of each list is used)

  // Check if the input list is null
  if (flashcardConversationStatus == null) {
    return [];
  }

  // Step 1: build a list of int<List> from the ids in each tagIds of flashcardConversationStatus
  List<List<int>?> tagIdsList = flashcardConversationStatus
      .map((flashcard) => flashcard?.tagIds)
      .toList();

  // Step 2: Extract unique IDs from flashcards
  Set<int> uniqueIds = {};
  for (var flashcard in flashcardConversationStatus) {
    uniqueIds.addAll(flashcard.tagIds); // tagIds is a List<int>
  }

  // Step 2: Fetch tags based on unique IDs
  List<TagStruct> tags = await fetchTagsByIds(uniqueIds.toList());

  // Step 3: build ConversationTagsListsStruct (a list of tagsList: TagStruct<List>, corresponding flashcard)
  List<ConversationTagsListsStruct> conversationTagsLists = [];
  for (var flashcard in flashcardConversationStatus) {
    // Create a list for tags of the current flashcard
    List<TagStruct> tagsFromFlashcard = [];
    List<FlashcardConversationStatusStruct> flashcardsWithTags = [];
    for (var id in flashcard.tagIds) {
      var tag = tags.firstWhere(
        (tag) => tag.id == id,
        orElse: () => TagStruct(id: id, name: 'Unknown Tag'),
      );
      tagsFromFlashcard
          .add(tag); // Add the tag to the current flashcard's tag list
    }
    flashcardsWithTags.add(flashcard);
    // Add the list of tags for the current flashcard to the conversationTagsLists
    conversationTagsLists.add(ConversationTagsListsStruct(
        tagsLists: tagsFromFlashcard,
        flashcardInfosList:
            flashcardsWithTags)); // Assuming ConversationTagsListsStruct has a field for tags
  }

  // Step 4: Sort each sublist of conversationTagsLists in alphabetical order
  for (var tagList in conversationTagsLists) {
    tagList.tagsLists.sort((a, b) => a.name.compareTo(
        b.name)); // Sort the tags in each ConversationTagsListsStruct
  }

  // Step 5: Sort each element (a sublist) in conversationTagsLists in alphabetical order using each sublist's element's name
  conversationTagsLists
      .sort((a, b) => a.tagsLists.first.name.compareTo(b.tagsLists.first.name));

  // update conversationTagsLists: add each flashcard from flashcardInfosList to other flashcardInfosList if the tagsLists is perfectly equal
  // put an example result first before proceeding
  // {tagsLists: [{name:"a" id: 1}, {name:"b" id: 2}]}, flashcardInfosList: [{flashcard1}]}
  // {tagsLists: [{name:"b" id: 2}, {name:"c" id: 3}]}, flashcardInfosList: [{flashcard2}]}
  // {tagsLists: [{name:"a" id: 1}, {name:"b" id: 2}]}, flashcardInfosList: [{flashcard3}]}
  // then {tagsLists: [{name:"a" id: 1}, {name:"b" id: 2}]}, flashcardInfosList: [{flashcard1}, {flashcard3}]

  // Step 5: Update conversationTagsLists to merge flashcards with identical tagsLists
  Map<String, ConversationTagsListsStruct> mergedTagsListsMap = {};

  for (var conversationTags in conversationTagsLists) {
    // Create a unique key for the tagsLists based on the tag IDs
    String key = conversationTags.tagsLists.map((tag) => tag.id).join(',');

    if (mergedTagsListsMap.containsKey(key)) {
      // If the key exists, merge the flashcardInfosList
      mergedTagsListsMap[key]!
          .flashcardInfosList
          .addAll(conversationTags.flashcardInfosList);
    } else {
      // If the key does not exist, add it to the map
      mergedTagsListsMap[key] = conversationTags;
    }
  }

  // Convert the map back to a list
  return mergedTagsListsMap.values.toList();
  //return conversationTagsLists;
}
