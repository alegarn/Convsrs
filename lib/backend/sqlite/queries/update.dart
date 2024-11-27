import 'package:sqflite/sqflite.dart';

/// BEGIN USER CREATE INSERT
Future performUserCreateINSERT(
  Database database, {
  String? uuid,
  String? username,
  String? email,
  String? password,
  double? globalSuccessRate,
  int? totalCardLearned,
}) {
  final query = '''
INSERT INTO users (uuid, username, email, password, globalSuccessRate, totalCardLearned)
VALUES (
  '$uuid', 
  '$username', 
   '$email',
   '$password', 
   $globalSuccessRate, 
   $totalCardLearned
 );
''';
  return database.rawQuery(query);
}

/// END USER CREATE INSERT

/// BEGIN USERS UPDATE AN EXISTING  INFORMATION
Future performUsersUpdateAnExistingInformation(
  Database database, {
  String? uuid,
  String? email,
  double? globalSuccessRate,
}) {
  final query = '''
UPDATE "users"
SET 
  "email" = '$email', 
  "globalSuccessRate" = $globalSuccessRate
WHERE "uuid" = '$uuid';
''';
  return database.rawQuery(query);
}

/// END USERS UPDATE AN EXISTING  INFORMATION

/// BEGIN USER DELETE BY UUID
Future performUserDeleteByUUID(
  Database database, {
  String? uuid,
}) {
  final query = '''
DELETE FROM "users" WHERE "uuid" = '$uuid';
/* foreign key mismatch - "srsParameters" referencing "users" */
''';
  return database.rawQuery(query);
}

/// END USER DELETE BY UUID

/// BEGIN SRS PARAMETERS CREATE INSERT QUERY
Future performSRSParametersCreateINSERTQuery(
  Database database, {
  int? userId,
  int? stepNumber,
  int? retrievalIntervalDuration,
  String? conversationStepsIntervals,
}) {
  final query = '''
INSERT INTO srsParameters (userId, stepNumber, retrievalIntervalDuration, conversationStepsIntervals)
VALUES (
  '$userId', 
  $stepNumber, 
  $retrievalIntervalDuration, 
  '$conversationStepsIntervals'
 );
''';
  return database.rawQuery(query);
}

/// END SRS PARAMETERS CREATE INSERT QUERY

/// BEGIN SRS PARAMETERS UPDATE QUERY
Future performSRSParametersUpdateQuery(
  Database database, {
  String? newUserId,
  int? myNewStepNumber,
  int? myNewRetrievalIntervalDuration,
  int? srsId,
  int? myNewConversationStepsIntervals,
}) {
  final query = '''
UPDATE srsParameters
SET 
  userId = '$newUserId', 
  stepNumber = $myNewStepNumber, 
  retrievalIntervalDuration = $myNewRetrievalIntervalDuration, 
  conversationStepsIntervals =' $myNewConversationStepsIntervals'
WHERE id = $srsId;
''';
  return database.rawQuery(query);
}

/// END SRS PARAMETERS UPDATE QUERY

/// BEGIN SRS PARAMETERS DELETE QUERY
Future performSRSParametersDeleteQuery(
  Database database, {
  int? srsParametersId,
}) {
  final query = '''
DELETE FROM srsParameters WHERE id = $srsParametersId;
''';
  return database.rawQuery(query);
}

/// END SRS PARAMETERS DELETE QUERY

/// BEGIN RETRIEVALSESSIONSDECKS CREATE INSERT A NEW RECORD
Future performRetrievalSessionsDecksCreateINSERTANewRecord(
  Database database, {
  int? deckId,
}) {
  final query = '''
--INSERT INTO "retrievalSessionsDecks" ("retrievalSessionId", "deckId") VALUES (retrievalSessionId}, deckId});

INSERT INTO retrievalSessionsDecks ("retrievalSessionId", "deckId") 
VALUES ((SELECT last_insert_rowid() ), $deckId);
''';
  return database.rawQuery(query);
}

/// END RETRIEVALSESSIONSDECKS CREATE INSERT A NEW RECORD

/// BEGIN RETRIEVALSESSIONSDECKS DELETE  BY ID
Future performRetrievalSessionsDecksDeleteById(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM "retrievalSessionsDecks" WHERE "id" = $id;
''';
  return database.rawQuery(query);
}

/// END RETRIEVALSESSIONSDECKS DELETE  BY ID

/// BEGIN RETRIEVALSESSIONS CREATE
Future performRetrievalSessionsCREATE(
  Database database, {
  String? userId,
  int? durationSec,
  int? totalCardNumber,
  int? failNumber,
  int? successNumber,
  String? date,
}) {
  final query = '''
INSERT INTO retrievalSessions (
  "userId", "durationSec", "totalCardNumber", "failNumber", "successNumber", "date"
  )
VALUES (
  '$userId',
  $durationSec, 
  $totalCardNumber,
  $failNumber, 
  $successNumber, 
  '$date'
 );
''';
  return database.rawQuery(query);
}

/// END RETRIEVALSESSIONS CREATE

/// BEGIN RETRIEVALSESSIONS UPDATE
Future performRetrievalSessionsUPDATE(
  Database database, {
  int? retrievalSessionId,
  int? newTotalCardNumber,
  int? newFailNumber,
  int? newDurationSec,
  int? newSuccessNumber,
  String? newSpeakingRetrievalDates,
  String? retrievalSessionDate,
}) {
  final query = '''
UPDATE "retrievalSessions"
SET 
  "durationSec" = $newDurationSec, 
  "totalCardNumber" = $newTotalCardNumber, 
  "failNumber" = $newFailNumber, 
  "successNumber" = $newSuccessNumber,
  "speakingRetrievalDates" = "$newSpeakingRetrievalDates",
  "date" = "$retrievalSessionDate"
WHERE "id" = $retrievalSessionId;

''';
  return database.rawQuery(query);
}

/// END RETRIEVALSESSIONS UPDATE

/// BEGIN RETRIEVALSESSIONS DELETE
Future performRetrievalSessionsDELETE(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM "retrievalSessions" WHERE "id" = $id;
''';
  return database.rawQuery(query);
}

/// END RETRIEVALSESSIONS DELETE

/// BEGIN PERSONAS CREATE
Future performPersonasCREATE(
  Database database, {
  String? userId,
  String? name,
  String? infos,
  String? subject,
}) {
  final query = '''
INSERT INTO personas (userId, name, infos, subject) 
VALUES ('$userId', '$name', '$infos', '$subject');
''';
  return database.rawQuery(query);
}

/// END PERSONAS CREATE

/// BEGIN PERSONAS UPDATE ALL VALUES
Future performPersonasUPDATEAllValues(
  Database database, {
  String? userId,
  String? name,
  String? infos,
  String? subject,
  int? id,
}) {
  final query = '''
UPDATE personas 
SET
   userId = '$userId', 
   name = '$name',
   infos = '$infos',
   subject = '$subject' 
WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END PERSONAS UPDATE ALL VALUES

/// BEGIN PERSONAS DELETE USING ID
Future performPersonasDELETEUsingId(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM personas WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END PERSONAS DELETE USING ID

/// BEGIN FLASHCARD CREATE
Future performFlashcardCreate(
  Database database, {
  String? userId,
  String? textRecto,
  String? textVerso,
  String? audioRectoUrl,
  String? audioVersoUrl,
  String? imageRectoUrl,
  String? imageVersoUrl,
  int? currentRetrievalStep,
  int? currentSpeakingStep,
  int? toRecall,
  String? currentRecallDate,
  String? nextRecallDate,
  int? successCount,
  int? totalReviewCount,
  int? mentalImageBool,
  String? name,
  String? currentSpeakingDate,
  String? nextSpeakingDate,
  String? tagIds,
}) {
  final query = '''
-- Insert the new flashcard into the "flashcards" table
INSERT INTO flashcards (userId, name, textRecto, textVerso, audioRectoUrl, audioVersoUrl, imageRectoUrl, imageVersoUrl, currentRetrievalStep, currentSpeakingStep, toRecall, currentRecallDate, nextRecallDate, currentSpeakingDate, nextSpeakingDate, successCount, totalReviewCount, mentalImageBool, tagIds)
VALUES (
  '$userId',
   '$name', 
   '$textRecto', 
   '$textVerso', 
   '$audioRectoUrl', 
   '$audioVersoUrl', 
   '$imageRectoUrl', 
   '$imageVersoUrl', 
   $currentRetrievalStep, 
   $currentSpeakingStep, 
   $toRecall, 
   '$currentRecallDate', 
   '$nextRecallDate', 
   '$currentSpeakingDate', 
   '$nextSpeakingDate', 
   $successCount, 
   $totalReviewCount, 
   $mentalImageBool,
  COALESCE( '$tagIds' , '[1]')
);
''';
  return database.rawQuery(query);
}

/// END FLASHCARD CREATE

/// BEGIN FLASHCARD UPDATE
Future performFlashcardUpdate(
  Database database, {
  int? flashcardId,
  String? name,
  String? textRecto,
  String? textVerso,
  String? audioRectoUrl,
  String? audioVersoUrl,
  String? imageRectoUrl,
  String? imageVersoUrl,
  int? currentRetrievalStep,
  int? currentSpeakingStep,
  int? toRecall,
  String? currentRecallDate,
  String? nextRecallDate,
  int? successCount,
  int? totalReviewCount,
  int? mentalImageBool,
  String? currentSpeakingDate,
  String? nextSpeakingDate,
  String? tagIds,
}) {
  final query = '''
UPDATE flashcards 
SET 
 name = COALESCE('$name', name), 
 textRecto = COALESCE('$textRecto', textRecto), 
 textVerso = COALESCE('$textVerso', textVerso), 
 audioRectoUrl = COALESCE('$audioRectoUrl', audioRectoUrl), 
 audioVersoUrl = COALESCE('$audioVersoUrl', audioVersoUrl), 
 imageRectoUrl = COALESCE('$imageRectoUrl', imageRectoUrl), 
 imageVersoUrl = COALESCE('$imageVersoUrl', imageVersoUrl), 
 currentRetrievalStep = COALESCE($currentRetrievalStep, currentRetrievalStep), 
 currentSpeakingStep = COALESCE($currentSpeakingStep, currentSpeakingStep), 
 toRecall = COALESCE($toRecall, toRecall), 
 currentRecallDate = COALESCE('$currentRecallDate', currentRecallDate), 
 nextRecallDate = COALESCE('$nextRecallDate', nextRecallDate), 
 successCount = COALESCE($successCount, successCount), 
 totalReviewCount = COALESCE($totalReviewCount, totalReviewCount), 
 mentalImageBool = COALESCE($mentalImageBool, mentalImageBool),
 currentSpeakingDate = COALESCE('$currentSpeakingDate', currentSpeakingDate), 
 nextSpeakingDate = COALESCE('$nextSpeakingDate', nextSpeakingDate),
 tagIds = COALESCE('$tagIds',tagIds)
 WHERE id = $flashcardId;
''';
  return database.rawQuery(query);
}

/// END FLASHCARD UPDATE

/// BEGIN  FLASHCARD DELETE WITH ID
Future performFlashcardDeleteWithId(
  Database database, {
  int? flashcardId,
}) {
  final query = '''
DELETE FROM flashcards WHERE id = $flashcardId;
''';
  return database.rawQuery(query);
}

/// END  FLASHCARD DELETE WITH ID

/// BEGIN DECK CREATE
Future performDeckCREATE(
  Database database, {
  String? userId,
  String? name,
  int? totalCards,
  double? deckSuccessRate,
}) {
  final query = '''
INSERT INTO decks ("userId", "name", "totalCards", "deckSuccessRate") 
VALUES (
  '$userId', 
  '$name', 
  $totalCards, 
  $deckSuccessRate
);
''';
  return database.rawQuery(query);
}

/// END DECK CREATE

/// BEGIN DECK UPDATE FROM ID
Future performDeckUPDATEFromId(
  Database database, {
  String? userId,
  String? name,
  int? totalCards,
  double? deckSuccessRate,
  int? id,
}) {
  final query = '''
UPDATE decks
SET "userId" = '$userId', 
    "name" = '$name', 
    "totalCards" = $totalCards, 
    "deckSuccessRate" = $deckSuccessRate
WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END DECK UPDATE FROM ID

/// BEGIN DECK DELETE WITH ID
Future performDeckDELETEWithId(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM decks
WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END DECK DELETE WITH ID

/// BEGIN CONVERSATION CREATE
Future performConversationCREATE(
  Database database, {
  String? userId,
  int? personaId,
  int? deckId,
  int? cheatsheetId,
  int? durationMs,
  String? date,
  int? totalCardNumber,
  int? validatedCardNumber,
  String? validatedCardIds,
  int? timeSpoken,
}) {
  final query = '''
INSERT INTO conversations ("userId", "personaId", "deckId", "cheatsheetId", "durationMs", "date", "totalCardNumber", "validatedCardNumber", "validatedCardIds", "timeSpoken")
VALUES (
  COALESCE('$userId', 'none'), 
  COALESCE($personaId, 1), 
  COALESCE($deckId, 1), 
  COALESCE($cheatsheetId, 0), 
  COALESCE($durationMs, 1), 
  DATE('now'), 
  COALESCE($totalCardNumber, 0), 
  COALESCE($validatedCardNumber, 0), 
  COALESCE('$validatedCardIds', '[]'), 
  COALESCE($timeSpoken, 0)
);
''';
  return database.rawQuery(query);
}

/// END CONVERSATION CREATE

/// BEGIN CONVERSATION DELETE FROM ID
Future performConversationDELETEFromId(
  Database database, {
  int? conversationId,
}) {
  final query = '''
DELETE FROM conversations
WHERE id = $conversationId;
''';
  return database.rawQuery(query);
}

/// END CONVERSATION DELETE FROM ID

/// BEGIN  CHEATSHEET CREATE
Future performCheatsheetCREATE(
  Database database, {
  String? userId,
  String? name,
}) {
  final query = '''
INSERT INTO cheatsheets (userId, name) 
VALUES (
  '$userId',
  '$name'
);

''';
  return database.rawQuery(query);
}

/// END  CHEATSHEET CREATE

/// BEGIN CHEATSHEET UPDATE ALL INFOS BY ID
Future performCheatsheetUPDATEAllInfosById(
  Database database, {
  int? id,
  String? newConcept,
  String? newAnswer,
  String? newConceptAudioUrl,
  String? newAnswerAudioUrl,
  String? newCheatsheetId,
}) {
  final query = '''
UPDATE cheatsheetRows 
SET 
  cheatsheetId = '$newCheatsheetId', 
  concept = '$newConcept', 
  answer = '$newAnswer', 
  conceptAudioUrl = '$newConceptAudioUrl', 
  answerAudioUrl = '$newAnswerAudioUrl' 
WHERE id = $id;

''';
  return database.rawQuery(query);
}

/// END CHEATSHEET UPDATE ALL INFOS BY ID

/// BEGIN CHEATSHEET DELETE BY ID
Future performCheatsheetDELETEById(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM cheatsheets WHERE id = $id;
''';
  return database.rawQuery(query);
}

/// END CHEATSHEET DELETE BY ID

/// BEGIN CHEATSHEET ROW CREATE
Future performCheatsheetRowCREATE(
  Database database, {
  String? concept,
  String? answer,
  String? conceptAudioUrl,
  String? answerAudioUrl,
  int? cheatsheetId,
  String? tagIds,
}) {
  final query = '''
INSERT INTO cheatsheetRows ( cheatsheetId,  concept, answer, conceptAudioUrl, answerAudioUrl,tagIds) 
VALUES (
  $cheatsheetId,
  '$concept', 
  '$answer', 
  '$conceptAudioUrl', 
  '$answerAudioUrl',
  '$tagIds'
);
''';
  return database.rawQuery(query);
}

/// END CHEATSHEET ROW CREATE

/// BEGIN CHEATSHEETROWS UPDATE ROW
Future performCheatsheetRowsUPDATERow(
  Database database, {
  int? cheatsheetId,
  String? concept,
  String? answer,
  String? conceptAudioUrl,
  String? answerAudioUrl,
  int? rowId,
}) {
  final query = '''
UPDATE cheatsheetRows
SET 
  "cheatsheetId" = $cheatsheetId,
  "concept" = CASE WHEN $concept IS NOT NULL THEN '$concept' ELSE "concept" END,
  "answer" = CASE WHEN $answer IS NOT NULL THEN '$answer' ELSE "answer" END,
  "conceptAudioUrl" = CASE WHEN $conceptAudioUrl IS NOT NULL THEN '$conceptAudioUrl' ELSE "conceptAudioUrl" END,
  "answerAudioUrl" = CASE WHEN $answerAudioUrl IS NOT NULL THEN '$answerAudioUrl' ELSE "answerAudioUrl" END
WHERE id = $rowId;
''';
  return database.rawQuery(query);
}

/// END CHEATSHEETROWS UPDATE ROW

/// BEGIN CHEATSHEET ROWS DELETE ID
Future performCheatsheetRowsDELETEId(
  Database database, {
  int? id,
}) {
  final query = '''
DELETE FROM "cheatsheetRows" WHERE "id" = $id;
''';
  return database.rawQuery(query);
}

/// END CHEATSHEET ROWS DELETE ID

/// BEGIN USER CREATE IF NO USER IN DB
Future performUserCreateIfNoUserInDB(
  Database database, {
  String? uuid,
  String? username,
  String? email,
  double? globalSuccessRate,
  int? totalCardLearned,
}) {
  final query = '''
INSERT INTO users (uuid, username, email, password, globalSuccessRate, totalCardLearned)
SELECT '$uuid', '$username', '$email', 'aaaaaa', $globalSuccessRate , $totalCardLearned
WHERE NOT EXISTS (SELECT * FROM users WHERE uuid = '$uuid');
''';
  return database.rawQuery(query);
}

/// END USER CREATE IF NO USER IN DB

/// BEGIN CONVERSATIONSFLASHCARDS CREATE AFTER CONVERSATION
Future performConversationsFlashcardsCREATEAfterConversation(
  Database database, {
  int? flashcardId,
  int? conversationId,
}) {
  final query = '''
INSERT INTO conversationsFlashcards ("conversationId", "flashcardId")
VALUES ($conversationId, $flashcardId);
''';
  return database.rawQuery(query);
}

/// END CONVERSATIONSFLASHCARDS CREATE AFTER CONVERSATION

/// BEGIN CONVERSATIONPERSONAS CREATE AFTER CONVERSATION
Future performConversationPersonasCREATEAfterConversation(
  Database database, {
  String? personaId,
  int? conversationId,
}) {
  final query = '''
-- Insert a new row into the conversationPersonas table
INSERT INTO conversationPersonas ("conversationId", "personaId")
VALUES ($conversationId, $personaId);
''';
  return database.rawQuery(query);
}

/// END CONVERSATIONPERSONAS CREATE AFTER CONVERSATION

/// BEGIN SRSPARAMETERS CREATE FIRST ONES
Future performSrsParametersCREATEFirstOnes(
  Database database, {
  String? userId,
}) {
  final query = '''
WITH RECURSIVE numbers(n) AS (
  SELECT 1
  UNION ALL
  SELECT n + 1 FROM numbers WHERE n < 10
)
INSERT INTO srsParameters (userId, stepNumber, retrievalIntervalDurationSec, conversationStepsIntervalsSec)
SELECT '$userId', n, 
  CASE n
    WHEN 1 THEN 14400
    WHEN 2 THEN 86400
    WHEN 3 THEN 172800
    WHEN 4 THEN 345600
    WHEN 5 THEN 604800
    WHEN 6 THEN 1209600
    WHEN 7 THEN 2592000
    WHEN 8 THEN 5184000
    WHEN 9 THEN 7776000
    WHEN 10 THEN 15552000
  END,
  CASE n
    WHEN 1 THEN '[0]'
    WHEN 2 THEN '[0]'
    WHEN 3 THEN '[0,86400]'
    WHEN 4 THEN '[0,172800]'
    WHEN 5 THEN '[0,151200,302400]'
    WHEN 6 THEN '[0,302400,604800]'
    WHEN 7 THEN '[0,345600,691200,1296000]'
    WHEN 8 THEN '[0,604800,1296000,2592000]'
    WHEN 9 THEN '[0,1036800,1987200,3888000]'
    WHEN 10 THEN '[0,1987200,3888000,7776000]'
  END
FROM numbers;
''';
  return database.rawQuery(query);
}

/// END SRSPARAMETERS CREATE FIRST ONES

/// BEGIN DECKSFLASHCARDS CREATE ROW
Future performDecksFlashcardsCREATERow(
  Database database, {
  int? deckId,
  int? flashcardId,
}) {
  final query = '''
-- Insert a new row into the "decksFlashcards" table
INSERT INTO decksFlashcards (deckId, flashcardId)
VALUES ($deckId, $flashcardId);
''';
  return database.rawQuery(query);
}

/// END DECKSFLASHCARDS CREATE ROW

/// BEGIN DECKS INCREMENT TOTALCARDS
Future performDecksIncrementTotalCards(
  Database database, {
  int? deckId,
}) {
  final query = '''
UPDATE decks
SET totalCards = totalCards + 1
WHERE id = $deckId;
''';
  return database.rawQuery(query);
}

/// END DECKS INCREMENT TOTALCARDS

/// BEGIN DATAEXTRACT CREATE 1 ROW
Future performDataExtractCREATE1Row(
  Database database, {
  String? userId,
  String? tableName,
  String? date,
  int? sizeOct,
  int? partNumber,
  String? tableData,
  int? lineCount,
}) {
  final query = '''
INSERT INTO dataExtract (userId, tableName, date, sizeOct, partNumber, tableData, lineCount) 
VALUES ('$userId', '$tableName', '$date', $sizeOct, $partNumber, '$tableData', $lineCount);


''';
  return database.rawQuery(query);
}

/// END DATAEXTRACT CREATE 1 ROW

/// BEGIN DATAEXTRACT DELETE ALL
Future performDataExtractDELETEAll(
  Database database,
) {
  const query = '''
DELETE FROM dataExtract;
''';
  return database.rawQuery(query);
}

/// END DATAEXTRACT DELETE ALL

/// BEGIN DECKSFLASHCARDS DELETE ROW BY FLASHCARDID
Future performDecksFlashcardsDELETERowByFlashcardId(
  Database database, {
  int? flashcardId,
}) {
  final query = '''
DELETE FROM "decksFlashcards" WHERE "flashcardId" = $flashcardId;
''';
  return database.rawQuery(query);
}

/// END DECKSFLASHCARDS DELETE ROW BY FLASHCARDID

/// BEGIN TAGS INSERT NEW
Future performTagsINSERTNew(
  Database database, {
  String? name,
  String? categoriesList,
}) {
  final query = '''
INSERT INTO tags
(name, categories) 
VALUES 
('$name', '$categoriesList');
''';
  return database.rawQuery(query);
}

/// END TAGS INSERT NEW

/// BEGIN TAGS UPDATE ADD CATEGORY IF
Future performTagsUPDATEAddCategoryIf(
  Database database, {
  String? newTagName,
  String? category,
}) {
  final query = '''
UPDATE tags
SET categories = REPLACE(categories, ']', ',\"$category\"]')
WHERE name = '$newTagName' AND categories NOT LIKE '%$category%';
''';
  return database.rawQuery(query);
}

/// END TAGS UPDATE ADD CATEGORY IF
