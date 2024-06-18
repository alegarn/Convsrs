import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN SRS PARAMETERS READ SELECT QUERY
Future<List<SRSParametersReadSELECTQueryRow>>
    performSRSParametersReadSELECTQuery(
  Database database, {
  int? srsParameterId,
}) {
  final query = '''
SELECT * FROM srsParameters WHERE id = $srsParameterId;
''';
  return _readQuery(database, query, (d) => SRSParametersReadSELECTQueryRow(d));
}

class SRSParametersReadSELECTQueryRow extends SqliteRow {
  SRSParametersReadSELECTQueryRow(super.data);

  int? get stepNumber => data['stepNumber'] as int?;
  int? get retrievalIntervalDurationSec =>
      data['retrievalIntervalDurationSec'] as int?;
  List<String>? get conversationStepsIntervalsSec =>
      data['conversationStepsIntervalsSec'] as List<String>?;
}

/// END SRS PARAMETERS READ SELECT QUERY

/// BEGIN RETRIEVALSESSIONSDECKS READ SELECT BY ID
Future<List<RetrievalSessionsDecksReadSELECTByIdRow>>
    performRetrievalSessionsDecksReadSELECTById(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT * 
FROM retrievalSessionsDecks
WHERE id = $id 
LIMIT 1;
''';
  return _readQuery(
      database, query, (d) => RetrievalSessionsDecksReadSELECTByIdRow(d));
}

class RetrievalSessionsDecksReadSELECTByIdRow extends SqliteRow {
  RetrievalSessionsDecksReadSELECTByIdRow(super.data);

  int get id => data['id'] as int;
  int get retrievalSessionId => data['retrievalSessionId'] as int;
  int get deckId => data['deckId'] as int;
}

/// END RETRIEVALSESSIONSDECKS READ SELECT BY ID

/// BEGIN RETRIEVALSESSIONS READ ALL FROM USERID
Future<List<RetrievalSessionsREADAllFromUserIdRow>>
    performRetrievalSessionsREADAllFromUserId(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT *
 FROM retrievalSessions
 WHERE userId='$userId';
''';
  return _readQuery(
      database, query, (d) => RetrievalSessionsREADAllFromUserIdRow(d));
}

class RetrievalSessionsREADAllFromUserIdRow extends SqliteRow {
  RetrievalSessionsREADAllFromUserIdRow(super.data);

  int? get id => data['id'] as int?;
  String? get userId => data['userId'] as String?;
  int? get durationSec => data['durationSec'] as int?;
  int? get totalCardNumber => data['totalCardNumber'] as int?;
  int? get failNumber => data['failNumber'] as int?;
  int? get successNumber => data['successNumber'] as int?;
  String? get date => data['date'] as String?;
}

/// END RETRIEVALSESSIONS READ ALL FROM USERID

/// BEGIN RETRIEVALSESSIONS READ BY ID
Future<List<RetrievalSessionsREADByIdRow>> performRetrievalSessionsREADById(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT * FROM "retrievalSessions" WHERE "id" = $id;
''';
  return _readQuery(database, query, (d) => RetrievalSessionsREADByIdRow(d));
}

class RetrievalSessionsREADByIdRow extends SqliteRow {
  RetrievalSessionsREADByIdRow(super.data);

  String get userId => data['userId'] as String;
  int get durationSec => data['durationSec'] as int;
  int get totalCardNumber => data['totalCardNumber'] as int;
  String get failNumber => data['failNumber'] as String;
  int get successNumber => data['successNumber'] as int;
  String get date => data['date'] as String;
}

/// END RETRIEVALSESSIONS READ BY ID

/// BEGIN PERSONAS READ ALL
Future<List<PersonasREADAllRow>> performPersonasREADAll(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT * 
FROM personas
WHERE userId='$userId';
''';
  return _readQuery(database, query, (d) => PersonasREADAllRow(d));
}

class PersonasREADAllRow extends SqliteRow {
  PersonasREADAllRow(super.data);

  int get id => data['id'] as int;
  String get userId => data['userId'] as String;
  String get name => data['name'] as String;
  String get infos => data['infos'] as String;
  String get subject => data['subject'] as String;
}

/// END PERSONAS READ ALL

/// BEGIN FLASHCARD READ 1 WITH ID
Future<List<FlashcardRead1WithIdRow>> performFlashcardRead1WithId(
  Database database, {
  int? flashcardId,
}) {
  final query = '''
SELECT * FROM flashcards 
WHERE id = $flashcardId 
LIMIT 1;
''';
  return _readQuery(database, query, (d) => FlashcardRead1WithIdRow(d));
}

class FlashcardRead1WithIdRow extends SqliteRow {
  FlashcardRead1WithIdRow(super.data);

  String get userId => data['userId'] as String;
  String get textRecto => data['textRecto'] as String;
  String get textVerso => data['textVerso'] as String;
  String get audioRectoUrl => data['audioRectoUrl'] as String;
  String get audioVersoUrl => data['audioVersoUrl'] as String;
  String get imageRectoUrl => data['imageRectoUrl'] as String;
  String get imageVersoUrl => data['imageVersoUrl'] as String;
  int get currentRetrievalStep => data['currentRetrievalStep'] as int;
  int get currentSpeakingStep => data['currentSpeakingStep'] as int;
  int get toRecall => data['toRecall'] as int;
  String get currentRecallDate => data['currentRecallDate'] as String;
  String get nextRecallDate => data['nextRecallDate'] as String;
  int get successCount => data['successCount'] as int;
  int get totalReviewCount => data['totalReviewCount'] as int;
  int get mentalImageBool => data['mentalImageBool'] as int;
  String get name => data['name'] as String;
  String? get currentSpeakingDate => data['currentSpeakingDate'] as String?;
  String? get nextSpeakingDate => data['nextSpeakingDate'] as String?;
}

/// END FLASHCARD READ 1 WITH ID

/// BEGIN FLASHCARDS LIST ID WITH  NAME
Future<List<FlashcardsListIdWithNameRow>> performFlashcardsListIdWithName(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT id, name 
FROM flashcards
WHERE userId='$userId';
''';
  return _readQuery(database, query, (d) => FlashcardsListIdWithNameRow(d));
}

class FlashcardsListIdWithNameRow extends SqliteRow {
  FlashcardsListIdWithNameRow(super.data);

  int get id => data['id'] as int;
  String get name => data['name'] as String;
}

/// END FLASHCARDS LIST ID WITH  NAME

/// BEGIN DECK READ 1 FROM ID
Future<List<DeckRead1FromIdRow>> performDeckRead1FromId(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT 
  d.userId ,
  d.name,
  d.totalCards,
  d.deckSuccessRate
FROM decks d
WHERE id = $id 
LIMIT 1;
''';
  return _readQuery(database, query, (d) => DeckRead1FromIdRow(d));
}

class DeckRead1FromIdRow extends SqliteRow {
  DeckRead1FromIdRow(super.data);

  int get userId => data['userId'] as int;
  String get name => data['name'] as String;
  int get totalCards => data['totalCards'] as int;
  double get deckSuccessRate => data['deckSuccessRate'] as double;
}

/// END DECK READ 1 FROM ID

/// BEGIN DECKS READ LIST ID NAME
Future<List<DecksReadListIdNameRow>> performDecksReadListIdName(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT id, name 
FROM decks
WHERE userId='$userId';
''';
  return _readQuery(database, query, (d) => DecksReadListIdNameRow(d));
}

class DecksReadListIdNameRow extends SqliteRow {
  DecksReadListIdNameRow(super.data);

  int get id => data['id'] as int;
  String get name => data['name'] as String;
}

/// END DECKS READ LIST ID NAME

/// BEGIN CONVERSATION READ 1 ROW FROM ID
Future<List<ConversationREAD1RowFromIdRow>> performConversationREAD1RowFromId(
  Database database, {
  int? conversationId,
}) {
  final query = '''
SELECT * FROM conversations 
WHERE id = $conversationId;
''';
  return _readQuery(database, query, (d) => ConversationREAD1RowFromIdRow(d));
}

class ConversationREAD1RowFromIdRow extends SqliteRow {
  ConversationREAD1RowFromIdRow(super.data);

  String get userId => data['userId'] as String;
  int get personaId => data['personaId'] as int;
  int get deckId => data['deckId'] as int;
  int get cheatsheetId => data['cheatsheetId'] as int;
  int get durationSeconds => data['durationSeconds'] as int;
  String get date => data['date'] as String;
  int get totalCardNumber => data['totalCardNumber'] as int;
  int get validatedCardNumber => data['validatedCardNumber'] as int;
  List<String>? get validatedCardIds =>
      data['validatedCardIds'] as List<String>?;
  int get timeSpoken => data['timeSpoken'] as int;
}

/// END CONVERSATION READ 1 ROW FROM ID

/// BEGIN CHEATSHEET ROW READ 1 ROW
Future<List<CheatsheetRowREAD1RowRow>> performCheatsheetRowREAD1Row(
  Database database, {
  int? id,
}) {
  final query = '''
SELECT * FROM cheatsheetRows 
WHERE id = $id
LIMIT 1;
''';
  return _readQuery(database, query, (d) => CheatsheetRowREAD1RowRow(d));
}

class CheatsheetRowREAD1RowRow extends SqliteRow {
  CheatsheetRowREAD1RowRow(super.data);

  String get userId => data['userId'] as String;
  String get concept => data['concept'] as String;
  String get answer => data['answer'] as String;
  String get conceptAudioUrl => data['conceptAudioUrl'] as String;
  String get answerAudioUrl => data['answerAudioUrl'] as String;
}

/// END CHEATSHEET ROW READ 1 ROW

/// BEGIN CHEATSHEETS READ LIST ID NAME
Future<List<CheatsheetsREADListIdNameRow>> performCheatsheetsREADListIdName(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT 
id, name 
FROM cheatsheets
WHERE userId='$userId';
''';
  return _readQuery(database, query, (d) => CheatsheetsREADListIdNameRow(d));
}

class CheatsheetsREADListIdNameRow extends SqliteRow {
  CheatsheetsREADListIdNameRow(super.data);

  int get id => data['id'] as int;
  String get name => data['name'] as String;
}

/// END CHEATSHEETS READ LIST ID NAME

/// BEGIN CHEATSHEET ROWS READ CONCEPT ANSWER
Future<List<CheatsheetRowsREADConceptAnswerRow>>
    performCheatsheetRowsREADConceptAnswer(
  Database database, {
  int? cheatsheetId,
}) {
  final query = '''
SELECT id, concept, answer 
FROM cheatsheetRows 
WHERE cheatsheetId = $cheatsheetId;
''';
  return _readQuery(
      database, query, (d) => CheatsheetRowsREADConceptAnswerRow(d));
}

class CheatsheetRowsREADConceptAnswerRow extends SqliteRow {
  CheatsheetRowsREADConceptAnswerRow(super.data);

  int get id => data['id'] as int;
  String get concept => data['concept'] as String;
  String get answer => data['answer'] as String;
}

/// END CHEATSHEET ROWS READ CONCEPT ANSWER

/// BEGIN CHEATSHEET ROWS READ ALL FROM CHEATSHEET ID
Future<List<CheatsheetRowsReadAllFromCheatsheetIdRow>>
    performCheatsheetRowsReadAllFromCheatsheetId(
  Database database, {
  int? cheatsheetId,
}) {
  final query = '''
SELECT * 
FROM cheatsheetRows 
WHERE cheatsheetId = $cheatsheetId;
''';
  return _readQuery(
      database, query, (d) => CheatsheetRowsReadAllFromCheatsheetIdRow(d));
}

class CheatsheetRowsReadAllFromCheatsheetIdRow extends SqliteRow {
  CheatsheetRowsReadAllFromCheatsheetIdRow(super.data);

  int get id => data['id'] as int;
  String get concept => data['concept'] as String;
  String get answer => data['answer'] as String;
  String get conceptAudioUrl => data['conceptAudioUrl'] as String;
  String get answerAudioUrl => data['answerAudioUrl'] as String;
}

/// END CHEATSHEET ROWS READ ALL FROM CHEATSHEET ID

/// BEGIN FLASHCARDS READ TEXTVERSO
Future<List<FlashcardsREADTextVersoRow>> performFlashcardsREADTextVerso(
  Database database, {
  int? deckId,
}) {
  final query = '''
SELECT 
  f.id,
  f.textVerso
FROM flashcards f
JOIN decksFlashcards df 
ON f.id = df.flashcardId
WHERE 
  df.deckId = $deckId AND f.toRecall = 1;
''';
  return _readQuery(database, query, (d) => FlashcardsREADTextVersoRow(d));
}

class FlashcardsREADTextVersoRow extends SqliteRow {
  FlashcardsREADTextVersoRow(super.data);

  String get textVerso => data['textVerso'] as String;
  int get id => data['id'] as int;
}

/// END FLASHCARDS READ TEXTVERSO

/// BEGIN USER READ ALL
Future<List<UserReadAllRow>> performUserReadAll(
  Database database,
) {
  const query = '''
SELECT 'username', 'uuid'
FROM users;
''';
  return _readQuery(database, query, (d) => UserReadAllRow(d));
}

class UserReadAllRow extends SqliteRow {
  UserReadAllRow(super.data);

  String get username => data['username'] as String;
  String get uuid => data['uuid'] as String;
}

/// END USER READ ALL

/// BEGIN FLASHCARDS INFOS FOR RETRIEVAL SESSION
Future<List<FlashcardsInfosForRetrievalSessionRow>>
    performFlashcardsInfosForRetrievalSession(
  Database database, {
  String? userId,
  int? deckId,
}) {
  final query = '''
SELECT 
  f.id, 
  f.name,
  f.textRecto,
  f.textVerso,
  f.currentRetrievalStep,
  f.currentSpeakingStep,
  f.toRecall,
  f.currentRecallDate,
  f.nextRecallDate,
  f.currentSpeakingDate,
  f.nextSpeakingDate,
  f.successCount,
  f.totalReviewCount,
  f.mentalImageBool,
  f.totalReviewCount
FROM flashcards f
JOIN decksFlashcards df ON f.id = df.flashcardId
WHERE f.userId = '$userId'
AND df.deckId = $deckId
AND (f.currentRecallDate = 'none' OR julianday(f.currentRecallDate) <= julianday('now')); 
''';
  return _readQuery(
      database, query, (d) => FlashcardsInfosForRetrievalSessionRow(d));
}

class FlashcardsInfosForRetrievalSessionRow extends SqliteRow {
  FlashcardsInfosForRetrievalSessionRow(super.data);

  String get textRecto => data['textRecto'] as String;
  String get textVerso => data['textVerso'] as String;
  int get currentRetrievalStep => data['currentRetrievalStep'] as int;
  int get currentSpeakingStep => data['currentSpeakingStep'] as int;
  int get toRecall => data['toRecall'] as int;
  String get currentRecallDate => data['currentRecallDate'] as String;
  String get nextRecallDate => data['nextRecallDate'] as String;
  int get successCount => data['successCount'] as int;
  int get totalReviewCount => data['totalReviewCount'] as int;
  int get mentalImageBool => data['mentalImageBool'] as int;
  int get id => data['id'] as int;
  String get nextSpeakingDate => data['nextSpeakingDate'] as String;
  String get currentSpeakingDate => data['currentSpeakingDate'] as String;
  String get name => data['name'] as String;
}

/// END FLASHCARDS INFOS FOR RETRIEVAL SESSION

/// BEGIN SRS PARAMETERS GET CONVERSATIONSTEPSINTERVALSSEC FROM STEPNUMBER
Future<List<SRSParametersGetConversationStepsIntervalsSecFromStepNumberRow>>
    performSRSParametersGetConversationStepsIntervalsSecFromStepNumber(
  Database database, {
  int? stepNumber,
}) {
  final query = '''
SELECT conversationStepsIntervalsSec
FROM srsParameters
WHERE stepNumber = $stepNumber
LIMIT 1;
''';
  return _readQuery(database, query,
      (d) => SRSParametersGetConversationStepsIntervalsSecFromStepNumberRow(d));
}

class SRSParametersGetConversationStepsIntervalsSecFromStepNumberRow
    extends SqliteRow {
  SRSParametersGetConversationStepsIntervalsSecFromStepNumberRow(
      super.data);

  String get conversationStepsIntervalsSec =>
      data['conversationStepsIntervalsSec'] as String;
}

/// END SRS PARAMETERS GET CONVERSATIONSTEPSINTERVALSSEC FROM STEPNUMBER

/// BEGIN SRS PARAMETERS  GET RETRIEVALINTERVALDURATIONSEC FROM STEPNUMBER
Future<List<SRSParametersGetRetrievalIntervalDurationSecFromStepNumberRow>>
    performSRSParametersGetRetrievalIntervalDurationSecFromStepNumber(
  Database database, {
  int? stepNumber,
}) {
  final query = '''
SELECT retrievalIntervalDurationSec
FROM srsParameters
WHERE stepNumber = $stepNumber
LIMIT 1;
''';
  return _readQuery(database, query,
      (d) => SRSParametersGetRetrievalIntervalDurationSecFromStepNumberRow(d));
}

class SRSParametersGetRetrievalIntervalDurationSecFromStepNumberRow
    extends SqliteRow {
  SRSParametersGetRetrievalIntervalDurationSecFromStepNumberRow(
      super.data);

  int? get retrievalIntervalDurationSec =>
      data['retrievalIntervalDurationSec'] as int?;
}

/// END SRS PARAMETERS  GET RETRIEVALINTERVALDURATIONSEC FROM STEPNUMBER

/// BEGIN COUNTTOTALWORDLEARNED
Future<List<CountTotalWordLearnedRow>> performCountTotalWordLearned(
  Database database,
) {
  const query = '''
SELECT COUNT(*) AS totalWordLearned 
FROM flashcards 
WHERE nextRecallDate != 'none';
''';
  return _readQuery(database, query, (d) => CountTotalWordLearnedRow(d));
}

class CountTotalWordLearnedRow extends SqliteRow {
  CountTotalWordLearnedRow(super.data);

  int? get totalWordLearned => data['totalWordLearned'] as int?;
}

/// END COUNTTOTALWORDLEARNED

/// BEGIN DECKFLASHCARDS COUNTTOTALWORDSLEARNED FROM DECK ID
Future<List<DeckFlashcardsCountTotalWordsLearnedFromDeckIdRow>>
    performDeckFlashcardsCountTotalWordsLearnedFromDeckId(
  Database database, {
  int? deckId,
}) {
  final query = '''
SELECT COUNT(*) AS countTotalWordsLearned
FROM flashcards
INNER JOIN decksFlashcards ON flashcards.id = decksFlashcards.flashcardId
WHERE decksFlashcards.deckId = $deckId
AND flashcards.nextRecallDate != 'none';
''';
  return _readQuery(database, query,
      (d) => DeckFlashcardsCountTotalWordsLearnedFromDeckIdRow(d));
}

class DeckFlashcardsCountTotalWordsLearnedFromDeckIdRow extends SqliteRow {
  DeckFlashcardsCountTotalWordsLearnedFromDeckIdRow(super.data);

  int? get countTotalWordsLearned => data['countTotalWordsLearned'] as int?;
}

/// END DECKFLASHCARDS COUNTTOTALWORDSLEARNED FROM DECK ID

/// BEGIN DECKFLASHCARDS COUNTTOTALWORDSTOBELEARNED FROM DECK ID
Future<List<DeckFlashcardsCountTotalWordsToBeLearnedFromDeckIdRow>>
    performDeckFlashcardsCountTotalWordsToBeLearnedFromDeckId(
  Database database, {
  int? deckId,
}) {
  final query = '''
SELECT COUNT(*) AS deckWordsToBeLearned
FROM flashcards
INNER JOIN decksFlashcards ON flashcards.id = decksFlashcards.flashcardId
WHERE decksFlashcards.deckId = $deckId
AND flashcards.nextRecallDate = 'none';
''';
  return _readQuery(database, query,
      (d) => DeckFlashcardsCountTotalWordsToBeLearnedFromDeckIdRow(d));
}

class DeckFlashcardsCountTotalWordsToBeLearnedFromDeckIdRow extends SqliteRow {
  DeckFlashcardsCountTotalWordsToBeLearnedFromDeckIdRow(
      super.data);

  int? get deckWordsToBeLearned => data['deckWordsToBeLearned'] as int?;
}

/// END DECKFLASHCARDS COUNTTOTALWORDSTOBELEARNED FROM DECK ID

/// BEGIN DECK COUNT CARDS IN DECK USING DECKID
Future<List<DeckCountCardsInDeckUsingDeckIdRow>>
    performDeckCountCardsInDeckUsingDeckId(
  Database database, {
  int? deckId,
}) {
  final query = '''
SELECT COUNT(*) AS countTotalFlashcardsInDeck
FROM flashcards
JOIN decksFlashcards ON flashcards.id = decksFlashcards.flashcardId
WHERE decksFlashcards.deckId = $deckId;
''';
  return _readQuery(
      database, query, (d) => DeckCountCardsInDeckUsingDeckIdRow(d));
}

class DeckCountCardsInDeckUsingDeckIdRow extends SqliteRow {
  DeckCountCardsInDeckUsingDeckIdRow(super.data);

  int? get countTotalFlashcardsInDeck =>
      data['countTotalFlashcardsInDeck'] as int?;
}

/// END DECK COUNT CARDS IN DECK USING DECKID

/// BEGIN FLASHCARDS FOR CONVERSATION WITH DECKID
Future<List<FlashcardsForConversationWithDeckIdRow>>
    performFlashcardsForConversationWithDeckId(
  Database database, {
  int? deckId,
}) {
  final query = '''
SELECT 
  f.id as flashcardID, 
  f.textVerso as textVerso
FROM flashcards as f
INNER JOIN
  decksFlashcards as df ON f.id = df.flashcardId
WHERE df.deckId = $deckId
AND date(f.currentSpeakingDate) <= date('now', 'localtime');
''';
  return _readQuery(
      database, query, (d) => FlashcardsForConversationWithDeckIdRow(d));
}

class FlashcardsForConversationWithDeckIdRow extends SqliteRow {
  FlashcardsForConversationWithDeckIdRow(super.data);

  int? get flashcardID => data['flashcardID'] as int?;
  String? get textVerso => data['textVerso'] as String?;
}

/// END FLASHCARDS FOR CONVERSATION WITH DECKID

/// BEGIN CARDSTOBERETRIEVEDCOUNT
Future<List<CardsToBeRetrievedCountRow>> performCardsToBeRetrievedCount(
  Database database,
) {
  const query = '''
SELECT COUNT(*) 
FROM flashcards 
WHERE date(currentRecallDate) <= date('now');
''';
  return _readQuery(database, query, (d) => CardsToBeRetrievedCountRow(d));
}

class CardsToBeRetrievedCountRow extends SqliteRow {
  CardsToBeRetrievedCountRow(super.data);

  int? get cardsToBeRetrievedCount => data['cardsToBeRetrievedCount'] as int?;
}

/// END CARDSTOBERETRIEVEDCOUNT

/// BEGIN CARDSTOBEPRACTICECOUNT
Future<List<CardsToBePracticeCountRow>> performCardsToBePracticeCount(
  Database database,
) {
  const query = '''
SELECT COUNT(*) 
FROM flashcards 
WHERE date(currentSpeakingDate) <= date('now');
''';
  return _readQuery(database, query, (d) => CardsToBePracticeCountRow(d));
}

class CardsToBePracticeCountRow extends SqliteRow {
  CardsToBePracticeCountRow(super.data);

  int? get cardsToBePracticeCount => data['cardsToBePracticeCount'] as int?;
}

/// END CARDSTOBEPRACTICECOUNT

/// BEGIN USER SELECT USER
Future<List<UserSelectUserRow>> performUserSelectUser(
  Database database, {
  String? uuid,
}) {
  final query = '''
SELECT * 
FROM users 
WHERE uuid='$uuid' 
LIMIT 1;
''';
  return _readQuery(database, query, (d) => UserSelectUserRow(d));
}

class UserSelectUserRow extends SqliteRow {
  UserSelectUserRow(super.data);

  String? get uuid => data['uuid'] as String?;
  String? get username => data['username'] as String?;
  String? get email => data['email'] as String?;
  String? get password => data['password'] as String?;
  double? get globalSuccessRate => data['globalSuccessRate'] as double?;
  String? get totalCardLearned => data['totalCardLearned'] as String?;
}

/// END USER SELECT USER

/// BEGIN FLASHCARDS READ ALL FROM DECK NAME AND ID
Future<List<FlashcardsReadAllFromDeckNameAndIdRow>>
    performFlashcardsReadAllFromDeckNameAndId(
  Database database, {
  int? deckId,
  String? userId,
}) {
  final query = '''
SELECT
  f.id, 
  f.name
FROM flashcards f
JOIN decksFlashcards df ON f.id = df.flashcardId
WHERE df.deckId = $deckId;
''';
  return _readQuery(
      database, query, (d) => FlashcardsReadAllFromDeckNameAndIdRow(d));
}

class FlashcardsReadAllFromDeckNameAndIdRow extends SqliteRow {
  FlashcardsReadAllFromDeckNameAndIdRow(super.data);

  int? get id => data['id'] as int?;
  String? get name => data['name'] as String?;
}

/// END FLASHCARDS READ ALL FROM DECK NAME AND ID

/// BEGIN FLASHCARD READ ALL
Future<List<FlashcardReadAllRow>> performFlashcardReadAll(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT * 
FROM flashcards
WHERE userId='$userId';
''';
  return _readQuery(database, query, (d) => FlashcardReadAllRow(d));
}

class FlashcardReadAllRow extends SqliteRow {
  FlashcardReadAllRow(super.data);

  String get userId => data['userId'] as String;
  String get textRecto => data['textRecto'] as String;
  String get textVerso => data['textVerso'] as String;
  String get audioRectoUrl => data['audioRectoUrl'] as String;
  String get audioVersoUrl => data['audioVersoUrl'] as String;
  String get imageRectoUrl => data['imageRectoUrl'] as String;
  String get imageVersoUrl => data['imageVersoUrl'] as String;
  int get currentRetrievalStep => data['currentRetrievalStep'] as int;
  int get currentSpeakingStep => data['currentSpeakingStep'] as int;
  int get toRecall => data['toRecall'] as int;
  String get currentRecallDate => data['currentRecallDate'] as String;
  String get nextRecallDate => data['nextRecallDate'] as String;
  int get successCount => data['successCount'] as int;
  int get totalReviewCount => data['totalReviewCount'] as int;
  int get mentalImageBool => data['mentalImageBool'] as int;
  String get name => data['name'] as String;
  String? get currentSpeakingDate => data['currentSpeakingDate'] as String?;
  String? get nextSpeakingDate => data['nextSpeakingDate'] as String?;
  int? get id => data['id'] as int?;
}

/// END FLASHCARD READ ALL

/// BEGIN FLASHCARDS SELECT LAST ID
Future<List<FlashcardsSELECTLastIdRow>> performFlashcardsSELECTLastId(
  Database database,
) {
  const query = '''
SELECT id FROM flashcards ORDER BY id DESC LIMIT 1;
''';
  return _readQuery(database, query, (d) => FlashcardsSELECTLastIdRow(d));
}

class FlashcardsSELECTLastIdRow extends SqliteRow {
  FlashcardsSELECTLastIdRow(super.data);

  int? get id => data['id'] as int?;
}

/// END FLASHCARDS SELECT LAST ID

/// BEGIN DECKS READ FROM USERID
Future<List<DecksREADFromUserIdRow>> performDecksREADFromUserId(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT 
  d.id,
  d.userId,
  d.name,
  d.totalCards,
  deckSuccessRate
FROM decks as d
WHERE userId = '$userId';
''';
  return _readQuery(database, query, (d) => DecksREADFromUserIdRow(d));
}

class DecksREADFromUserIdRow extends SqliteRow {
  DecksREADFromUserIdRow(super.data);

  int? get id => data['id'] as int?;
  String? get userId => data['userId'] as String?;
  String? get name => data['name'] as String?;
  int? get totalCards => data['totalCards'] as int?;
  double? get deckSuccessRate => data['deckSuccessRate'] as double?;
}

/// END DECKS READ FROM USERID

/// BEGIN RETRIEVALSESSIONSDECKS READ ALL
Future<List<RetrievalSessionsDecksREADAllRow>>
    performRetrievalSessionsDecksREADAll(
  Database database,
) {
  const query = '''
SELECT
id,
retrievalSessionId,
deckId
FROM retrievalSessionsDecks;
''';
  return _readQuery(
      database, query, (d) => RetrievalSessionsDecksREADAllRow(d));
}

class RetrievalSessionsDecksREADAllRow extends SqliteRow {
  RetrievalSessionsDecksREADAllRow(super.data);

  int? get id => data['id'] as int?;
  int? get retrievalSessionId => data['retrievalSessionId'] as int?;
  int? get deckId => data['deckId'] as int?;
}

/// END RETRIEVALSESSIONSDECKS READ ALL

/// BEGIN SRS PARAMETERS READ ALL
Future<List<SRSParametersREADAllRow>> performSRSParametersREADAll(
  Database database,
) {
  const query = '''
SELECT *
FROM srsParameters;
''';
  return _readQuery(database, query, (d) => SRSParametersREADAllRow(d));
}

class SRSParametersREADAllRow extends SqliteRow {
  SRSParametersREADAllRow(super.data);

  int get stepNumber => data['stepNumber'] as int;
  int get retrievalIntervalDurationSec =>
      data['retrievalIntervalDurationSec'] as int;
  String get conversationStepsIntervalsSec =>
      data['conversationStepsIntervalsSec'] as String;
  int get id => data['id'] as int;
}

/// END SRS PARAMETERS READ ALL

/// BEGIN CONVERSATIONS READ ALL
Future<List<ConversationsREADAllRow>> performConversationsREADAll(
  Database database, {
  String? userId,
}) {
  final query = '''
  SELECT *
  FROM conversations
  WHERE userId='$userId';
''';
  return _readQuery(database, query, (d) => ConversationsREADAllRow(d));
}

class ConversationsREADAllRow extends SqliteRow {
  ConversationsREADAllRow(super.data);

  int? get id => data['id'] as int?;
  int? get personaId => data['personaId'] as int?;
  int? get deckId => data['deckId'] as int?;
  int? get cheatsheetId => data['cheatsheetId'] as int?;
  int? get durationMs => data['durationMs'] as int?;
  String? get date => data['date'] as String?;
  int? get totalCardNumber => data['totalCardNumber'] as int?;
  int? get validatedCardNumber => data['validatedCardNumber'] as int?;
  String? get validatedCardIds => data['validatedCardIds'] as String?;
  int? get timeSpoken => data['timeSpoken'] as int?;
}

/// END CONVERSATIONS READ ALL

/// BEGIN DATAEXTRACT READ ALL NO DATA
Future<List<DataExtractREADAllNoDataRow>> performDataExtractREADAllNoData(
  Database database,
) {
  const query = '''
SELECT
  id,
  tableName,
  date,
  sizeOct,
  lineCount
 FROM dataExtract;
''';
  return _readQuery(database, query, (d) => DataExtractREADAllNoDataRow(d));
}

class DataExtractREADAllNoDataRow extends SqliteRow {
  DataExtractREADAllNoDataRow(super.data);

  int get id => data['id'] as int;
  String get tableName => data['tableName'] as String;
  String get date => data['date'] as String;
  int get sizeOct => data['sizeOct'] as int;
  int get partNumber => data['partNumber'] as int;
  int get lineCount => data['lineCount'] as int;
  String get userId => data['userId'] as String;
}

/// END DATAEXTRACT READ ALL NO DATA

/// BEGIN CHEATSHEETS READ ALL BY USERID
Future<List<CheatsheetsREADAllByUserIdRow>> performCheatsheetsREADAllByUserId(
  Database database, {
  String? userId,
}) {
  final query = '''
SELECT 
  id,
  name
FROM cheatsheets
WHERE userId = '$userId';
''';
  return _readQuery(database, query, (d) => CheatsheetsREADAllByUserIdRow(d));
}

class CheatsheetsREADAllByUserIdRow extends SqliteRow {
  CheatsheetsREADAllByUserIdRow(super.data);

  int get id => data['id'] as int;
  String get name => data['name'] as String;
}

/// END CHEATSHEETS READ ALL BY USERID

/// BEGIN CHEATSHEET ROWS READ ALL
Future<List<CheatsheetRowsREADAllRow>> performCheatsheetRowsREADAll(
  Database database,
) {
  const query = '''
SELECT
  id,
  cheatsheetId,
  concept,
  answer,
  conceptAudioUrl,
  answerAudioUrl
FROM cheatsheetRows;
''';
  return _readQuery(database, query, (d) => CheatsheetRowsREADAllRow(d));
}

class CheatsheetRowsREADAllRow extends SqliteRow {
  CheatsheetRowsREADAllRow(super.data);

  int get cheatsheetId => data['cheatsheetId'] as int;
  String get concept => data['concept'] as String;
  String get answer => data['answer'] as String;
  String get conceptAudioUrl => data['conceptAudioUrl'] as String;
  String get answerAudioUrl => data['answerAudioUrl'] as String;
  int get id => data['id'] as int;
}

/// END CHEATSHEET ROWS READ ALL

/// BEGIN CONVERSATIONPERSONAS
Future<List<ConversationPersonasRow>> performConversationPersonas(
  Database database,
) {
  const query = '''
SELECT 
  id, 
  conversationId,
  personaId
FROM conversationPersonas;
''';
  return _readQuery(database, query, (d) => ConversationPersonasRow(d));
}

class ConversationPersonasRow extends SqliteRow {
  ConversationPersonasRow(super.data);

  int? get id => data['id'] as int?;
  int? get conversationId => data['conversationId'] as int?;
  int? get personaId => data['personaId'] as int?;
}

/// END CONVERSATIONPERSONAS

/// BEGIN CONVERSATIONSFLASHCARDS READ ALL
Future<List<ConversationsFlashcardsREADAllRow>>
    performConversationsFlashcardsREADAll(
  Database database,
) {
  const query = '''
SELECT
  id, 
  conversationId,
  flashcardId
 FROM conversationsFlashcards;
''';
  return _readQuery(
      database, query, (d) => ConversationsFlashcardsREADAllRow(d));
}

class ConversationsFlashcardsREADAllRow extends SqliteRow {
  ConversationsFlashcardsREADAllRow(super.data);

  int? get id => data['id'] as int?;
  int? get conversationId => data['conversationId'] as int?;
  int? get flashcardId => data['flashcardId'] as int?;
}

/// END CONVERSATIONSFLASHCARDS READ ALL

/// BEGIN DECKSFLASHCARDS READ ALL
Future<List<DecksFlashcardsREADAllRow>> performDecksFlashcardsREADAll(
  Database database,
) {
  const query = '''
SELECT
  id,
  deckId,
  flashcardId
FROM decksFlashcards;
''';
  return _readQuery(database, query, (d) => DecksFlashcardsREADAllRow(d));
}

class DecksFlashcardsREADAllRow extends SqliteRow {
  DecksFlashcardsREADAllRow(super.data);

  int? get id => data['id'] as int?;
  int? get deckId => data['deckId'] as int?;
  int? get flashcardId => data['flashcardId'] as int?;
}

/// END DECKSFLASHCARDS READ ALL

/// BEGIN DATAEXTRACT READ DATA FROM TABLENAME
Future<List<DataExtractREADDataFromTableNameRow>>
    performDataExtractREADDataFromTableName(
  Database database, {
  String? tableName,
}) {
  final query = '''
SELECT
  tableData
FROM dataExtract
WHERE tableName='$tableName';
''';
  return _readQuery(
      database, query, (d) => DataExtractREADDataFromTableNameRow(d));
}

class DataExtractREADDataFromTableNameRow extends SqliteRow {
  DataExtractREADDataFromTableNameRow(super.data);

  String get tableData => data['tableData'] as String;
}

/// END DATAEXTRACT READ DATA FROM TABLENAME

/// BEGIN SQLITESEQUENCE READ ALL
Future<List<SqliteSequenceREADAllRow>> performSqliteSequenceREADAll(
  Database database,
) {
  const query = '''
SELECT
  name,
  seq
FROM sqlite_sequence;
''';
  return _readQuery(database, query, (d) => SqliteSequenceREADAllRow(d));
}

class SqliteSequenceREADAllRow extends SqliteRow {
  SqliteSequenceREADAllRow(super.data);

  String? get name => data['name'] as String?;
  int? get seq => data['seq'] as int?;
}

/// END SQLITESEQUENCE READ ALL

/// BEGIN CONVERSATIONS READ LAST CONVERSATIONID
Future<List<ConversationsREADLastConversationIDRow>>
    performConversationsREADLastConversationID(
  Database database,
) {
  const query = '''
 SELECT id
 FROM conversations
 ORDER BY id DESC
 LIMIT 1;
''';
  return _readQuery(
      database, query, (d) => ConversationsREADLastConversationIDRow(d));
}

class ConversationsREADLastConversationIDRow extends SqliteRow {
  ConversationsREADLastConversationIDRow(super.data);

  int? get id => data['id'] as int?;
}

/// END CONVERSATIONS READ LAST CONVERSATIONID

/// BEGIN FLASHCARDS READ LAST ID
Future<List<FlashcardsREADLastIdRow>> performFlashcardsREADLastId(
  Database database,
) {
  const query = '''
SELECT id
FROM flashcards
ORDER BY id DESC
LIMIT 1;
''';
  return _readQuery(database, query, (d) => FlashcardsREADLastIdRow(d));
}

class FlashcardsREADLastIdRow extends SqliteRow {
  FlashcardsREADLastIdRow(super.data);

  int? get id => data['id'] as int?;
}

/// END FLASHCARDS READ LAST ID
