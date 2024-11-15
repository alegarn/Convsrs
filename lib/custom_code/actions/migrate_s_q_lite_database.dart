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

// Define your migration scripts here
final List<Migration> _migrations = [
  // Migration for version 1: Creating a new table
  Migration(1, (Database db) async {
    // Perform migration for version 1
    // create my new table
    await db.execute(
        "CREATE TABLE 'tags' ('id' INTEGER NOT NULL DEFAULT 0 UNIQUE,'name'	TEXT NOT NULL DEFAULT 'no_tag',	'categories'	TEXT NOT NULL DEFAULT '[]', PRIMARY KEY('id' AUTOINCREMENT));");
    await db.execute(
        "INSERT INTO tags (name, categories) VALUES ('no_tag', '[\"flashcard\"]');");
    await db.execute(
        "ALTER TABLE flashcards ADD COLUMN tagIds TEXT NOT NULL DEFAULT '[1]';");
    await db.execute(
        "UPDATE flashcards SET tagIds = '[1]' WHERE tagIds IS NULL OR tagIds = '';");
  })
  // Migration for version 3: Adding a new column to an existing table
  //Migration(3, (Database db) async {
  // Perform migration for version 3
  //await db.execute('ALTER TABLE test_table ADD COLUMN new_column TEXT');
  //}),

  // Add more migrations as needed
];

// Update this constant as your schema evolves
const expectedVersion = 1;

Future<void> migrateSQLiteDatabase() async {
  // Obtain the database instance
  Database db = SQLiteManager.instance.database;

  // Get the current database version
  int currentVersion = await SQLiteManager.instance.database.getVersion();

  debugPrint('SQLite db version is ${currentVersion}');

  // If the current version is lower than the expected version, perform migrations
  if (currentVersion < expectedVersion) {
    await performMigrations(db, currentVersion, expectedVersion);

    // Update the schema version in the database
    await SQLiteManager.instance.database.setVersion(expectedVersion);
  }
}

Future<void> performMigrations(
    Database db, int fromVersion, int toVersion) async {
  // Run migrations
  for (var migration in _migrations) {
    // Execute migration if its version is within the range of current and expected versions
    if (migration.version > fromVersion && migration.version <= toVersion) {
      await migration.action(db);
    }
  }
}

class Migration {
  final int version;
  final Future<void> Function(Database) action;

  // Constructor to initialize the migration version and action function
  Migration(this.version, this.action);
}
