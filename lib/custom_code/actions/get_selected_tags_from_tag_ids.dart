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

Future<List<TagStruct>> getSelectedTagsFromTagIds(String? tagIds) async {
  // Check if tagIds is null or empty
  if (tagIds == null || tagIds.isEmpty) {
    return [
      TagStruct(id: 1, name: "no_tag")
    ]; // Return default tag if no IDs provided
  }

  debugPrint("tagIds = ${tagIds}");

  // Remove brackets and split the string into a list of IDs
  List<String> idList = tagIds.replaceAll(RegExp(r'[\[\]\s]'), '').split(',');

  debugPrint("idList = ${idList}");

  // Prepare a SQL query to fetch tags with the given IDs
  if (idList.isEmpty) {
    return [
      TagStruct(id: 1, name: "no_tag")
    ]; // Return default tag if no IDs after processing
  }

  // Create a comma-separated string of IDs for the SQL query
  String idString = idList.join(',');

  debugPrint("idString = ${idString}");

  // Execute the SQL query
  Database db = SQLiteManager.instance.database;
  final List<Map<String, dynamic>> results =
      await db.rawQuery("SELECT id, name FROM tags WHERE id IN ($idString);");

  debugPrint("results = ${results}");

  // Map the results to a List<TagStruct>
  if (results.isNotEmpty) {
    return results.map((result) {
      return TagStruct(
        id: result['id'] as int,
        name: result['name'] as String,
      );
    }).toList();
  } else {
    return [
      TagStruct(id: 1, name: "no_tag")
    ]; // Return default tag if no tags found
  }
}
