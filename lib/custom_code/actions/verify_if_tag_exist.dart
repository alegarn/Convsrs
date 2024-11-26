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

Future<String> verifyIfTagExist(
  String tagName,
  String category,
) async {
// Get the database instance
  Database db = SQLiteManager.instance.database;

  // Query to check if the tag exists
  final List<Map<String, dynamic>> results = await db.rawQuery(
    "SELECT id, categories FROM tags WHERE name = ?",
    [tagName],
  );

  // If the tag does not exist
  if (results.isEmpty) {
    return 'false'; // Tag does not exist
  }

  // If the tag exists, check its categories
  String categories = results.first['categories'];

  // Check if the category exists in the categories string
  if (categories.contains(category)) {
    return 'true'; // The tag exists and has the specified category
  } else {
    return 'update'; // The tag exists but does not have the specified category
  }
}
