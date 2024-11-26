import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'first_db',
      'ConvsrsDb.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<SRSParametersReadSELECTQueryRow>> sRSParametersReadSELECTQuery({
    int? srsParameterId,
  }) =>
      performSRSParametersReadSELECTQuery(
        _database,
        srsParameterId: srsParameterId,
      );

  Future<List<RetrievalSessionsDecksReadSELECTByIdRow>>
      retrievalSessionsDecksReadSELECTById({
    int? id,
  }) =>
          performRetrievalSessionsDecksReadSELECTById(
            _database,
            id: id,
          );

  Future<List<RetrievalSessionsREADAllFromUserIdRow>>
      retrievalSessionsREADAllFromUserId({
    String? userId,
  }) =>
          performRetrievalSessionsREADAllFromUserId(
            _database,
            userId: userId,
          );

  Future<List<RetrievalSessionsREADByIdRow>> retrievalSessionsREADById({
    int? id,
  }) =>
      performRetrievalSessionsREADById(
        _database,
        id: id,
      );

  Future<List<PersonasREADAllRow>> personasREADAll({
    String? userId,
  }) =>
      performPersonasREADAll(
        _database,
        userId: userId,
      );

  Future<List<FlashcardRead1WithIdRow>> flashcardRead1WithId({
    int? flashcardId,
  }) =>
      performFlashcardRead1WithId(
        _database,
        flashcardId: flashcardId,
      );

  Future<List<FlashcardsListIdWithNameRow>> flashcardsListIdWithName({
    String? userId,
  }) =>
      performFlashcardsListIdWithName(
        _database,
        userId: userId,
      );

  Future<List<DeckRead1FromIdRow>> deckRead1FromId({
    int? id,
  }) =>
      performDeckRead1FromId(
        _database,
        id: id,
      );

  Future<List<DecksReadListIdNameRow>> decksReadListIdName({
    String? userId,
  }) =>
      performDecksReadListIdName(
        _database,
        userId: userId,
      );

  Future<List<ConversationREAD1RowFromIdRow>> conversationREAD1RowFromId({
    int? conversationId,
  }) =>
      performConversationREAD1RowFromId(
        _database,
        conversationId: conversationId,
      );

  Future<List<CheatsheetRowREAD1RowRow>> cheatsheetRowREAD1Row({
    int? id,
  }) =>
      performCheatsheetRowREAD1Row(
        _database,
        id: id,
      );

  Future<List<CheatsheetsREADListIdNameRow>> cheatsheetsREADListIdName({
    String? userId,
  }) =>
      performCheatsheetsREADListIdName(
        _database,
        userId: userId,
      );

  Future<List<CheatsheetRowsREADConceptAnswerRow>>
      cheatsheetRowsREADConceptAnswer({
    int? cheatsheetId,
  }) =>
          performCheatsheetRowsREADConceptAnswer(
            _database,
            cheatsheetId: cheatsheetId,
          );

  Future<List<CheatsheetRowsReadAllFromCheatsheetIdRow>>
      cheatsheetRowsReadAllFromCheatsheetId({
    int? cheatsheetId,
  }) =>
          performCheatsheetRowsReadAllFromCheatsheetId(
            _database,
            cheatsheetId: cheatsheetId,
          );

  Future<List<FlashcardsREADTextVersoRow>> flashcardsREADTextVerso({
    int? deckId,
  }) =>
      performFlashcardsREADTextVerso(
        _database,
        deckId: deckId,
      );

  Future<List<UserReadAllRow>> userReadAll() => performUserReadAll(
        _database,
      );

  Future<List<FlashcardsInfosForRetrievalSessionRow>>
      flashcardsInfosForRetrievalSession({
    String? userId,
    int? deckId,
    int? numberOfCard,
  }) =>
          performFlashcardsInfosForRetrievalSession(
            _database,
            userId: userId,
            deckId: deckId,
            numberOfCard: numberOfCard,
          );

  Future<List<SRSParametersGetConversationStepsIntervalsSecFromStepNumberRow>>
      sRSParametersGetConversationStepsIntervalsSecFromStepNumber({
    int? stepNumber,
  }) =>
          performSRSParametersGetConversationStepsIntervalsSecFromStepNumber(
            _database,
            stepNumber: stepNumber,
          );

  Future<List<SRSParametersGetRetrievalIntervalDurationSecFromStepNumberRow>>
      sRSParametersGetRetrievalIntervalDurationSecFromStepNumber({
    int? stepNumber,
  }) =>
          performSRSParametersGetRetrievalIntervalDurationSecFromStepNumber(
            _database,
            stepNumber: stepNumber,
          );

  Future<List<CountTotalWordLearnedRow>> countTotalWordLearned() =>
      performCountTotalWordLearned(
        _database,
      );

  Future<List<DeckFlashcardsCountTotalWordsLearnedFromDeckIdRow>>
      deckFlashcardsCountTotalWordsLearnedFromDeckId({
    int? deckId,
  }) =>
          performDeckFlashcardsCountTotalWordsLearnedFromDeckId(
            _database,
            deckId: deckId,
          );

  Future<List<DeckFlashcardsCountTotalWordsToBeLearnedFromDeckIdRow>>
      deckFlashcardsCountTotalWordsToBeLearnedFromDeckId({
    int? deckId,
  }) =>
          performDeckFlashcardsCountTotalWordsToBeLearnedFromDeckId(
            _database,
            deckId: deckId,
          );

  Future<List<DeckCountCardsInDeckUsingDeckIdRow>>
      deckCountCardsInDeckUsingDeckId({
    int? deckId,
  }) =>
          performDeckCountCardsInDeckUsingDeckId(
            _database,
            deckId: deckId,
          );

  Future<List<FlashcardsForConversationWithDeckIdRow>>
      flashcardsForConversationWithDeckId({
    int? deckId,
  }) =>
          performFlashcardsForConversationWithDeckId(
            _database,
            deckId: deckId,
          );

  Future<List<CardsToBeRetrievedCountRow>> cardsToBeRetrievedCount() =>
      performCardsToBeRetrievedCount(
        _database,
      );

  Future<List<CardsToBePracticeCountRow>> cardsToBePracticeCount() =>
      performCardsToBePracticeCount(
        _database,
      );

  Future<List<UserSelectUserRow>> userSelectUser({
    String? uuid,
  }) =>
      performUserSelectUser(
        _database,
        uuid: uuid,
      );

  Future<List<FlashcardsReadAllFromDeckNameAndIdRow>>
      flashcardsReadAllFromDeckNameAndId({
    int? deckId,
    String? userId,
  }) =>
          performFlashcardsReadAllFromDeckNameAndId(
            _database,
            deckId: deckId,
            userId: userId,
          );

  Future<List<FlashcardReadAllRow>> flashcardReadAll({
    String? userId,
  }) =>
      performFlashcardReadAll(
        _database,
        userId: userId,
      );

  Future<List<FlashcardsSELECTLastIdRow>> flashcardsSELECTLastId() =>
      performFlashcardsSELECTLastId(
        _database,
      );

  Future<List<DecksREADFromUserIdRow>> decksREADFromUserId({
    String? userId,
  }) =>
      performDecksREADFromUserId(
        _database,
        userId: userId,
      );

  Future<List<RetrievalSessionsDecksREADAllRow>>
      retrievalSessionsDecksREADAll() => performRetrievalSessionsDecksREADAll(
            _database,
          );

  Future<List<SRSParametersREADAllRow>> sRSParametersREADAll() =>
      performSRSParametersREADAll(
        _database,
      );

  Future<List<ConversationsREADAllRow>> conversationsREADAll({
    String? userId,
  }) =>
      performConversationsREADAll(
        _database,
        userId: userId,
      );

  Future<List<DataExtractREADAllNoDataRow>> dataExtractREADAllNoData() =>
      performDataExtractREADAllNoData(
        _database,
      );

  Future<List<CheatsheetsREADAllByUserIdRow>> cheatsheetsREADAllByUserId({
    String? userId,
  }) =>
      performCheatsheetsREADAllByUserId(
        _database,
        userId: userId,
      );

  Future<List<CheatsheetRowsREADAllRow>> cheatsheetRowsREADAll() =>
      performCheatsheetRowsREADAll(
        _database,
      );

  Future<List<ConversationPersonasRow>> conversationPersonas() =>
      performConversationPersonas(
        _database,
      );

  Future<List<ConversationsFlashcardsREADAllRow>>
      conversationsFlashcardsREADAll() => performConversationsFlashcardsREADAll(
            _database,
          );

  Future<List<DecksFlashcardsREADAllRow>> decksFlashcardsREADAll() =>
      performDecksFlashcardsREADAll(
        _database,
      );

  Future<List<DataExtractREADDataFromTableNameRow>>
      dataExtractREADDataFromTableName({
    String? tableName,
  }) =>
          performDataExtractREADDataFromTableName(
            _database,
            tableName: tableName,
          );

  Future<List<SqliteSequenceREADAllRow>> sqliteSequenceREADAll() =>
      performSqliteSequenceREADAll(
        _database,
      );

  Future<List<ConversationsREADLastConversationIDRow>>
      conversationsREADLastConversationID() =>
          performConversationsREADLastConversationID(
            _database,
          );

  Future<List<FlashcardsREADLastIdRow>> flashcardsREADLastId() =>
      performFlashcardsREADLastId(
        _database,
      );

  Future<List<TagsGETAllFromCtgRow>> tagsGETAllFromCtg({
    String? category,
  }) =>
      performTagsGETAllFromCtg(
        _database,
        category: category,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future userCreateINSERT({
    String? uuid,
    String? username,
    String? email,
    String? password,
    double? globalSuccessRate,
    int? totalCardLearned,
  }) =>
      performUserCreateINSERT(
        _database,
        uuid: uuid,
        username: username,
        email: email,
        password: password,
        globalSuccessRate: globalSuccessRate,
        totalCardLearned: totalCardLearned,
      );

  Future usersUpdateAnExistingInformation({
    String? uuid,
    String? email,
    double? globalSuccessRate,
  }) =>
      performUsersUpdateAnExistingInformation(
        _database,
        uuid: uuid,
        email: email,
        globalSuccessRate: globalSuccessRate,
      );

  Future userDeleteByUUID({
    String? uuid,
  }) =>
      performUserDeleteByUUID(
        _database,
        uuid: uuid,
      );

  Future sRSParametersCreateINSERTQuery({
    int? userId,
    int? stepNumber,
    int? retrievalIntervalDuration,
    String? conversationStepsIntervals,
  }) =>
      performSRSParametersCreateINSERTQuery(
        _database,
        userId: userId,
        stepNumber: stepNumber,
        retrievalIntervalDuration: retrievalIntervalDuration,
        conversationStepsIntervals: conversationStepsIntervals,
      );

  Future sRSParametersUpdateQuery({
    String? newUserId,
    int? myNewStepNumber,
    int? myNewRetrievalIntervalDuration,
    int? srsId,
    int? myNewConversationStepsIntervals,
  }) =>
      performSRSParametersUpdateQuery(
        _database,
        newUserId: newUserId,
        myNewStepNumber: myNewStepNumber,
        myNewRetrievalIntervalDuration: myNewRetrievalIntervalDuration,
        srsId: srsId,
        myNewConversationStepsIntervals: myNewConversationStepsIntervals,
      );

  Future sRSParametersDeleteQuery({
    int? srsParametersId,
  }) =>
      performSRSParametersDeleteQuery(
        _database,
        srsParametersId: srsParametersId,
      );

  Future retrievalSessionsDecksCreateINSERTANewRecord({
    int? deckId,
  }) =>
      performRetrievalSessionsDecksCreateINSERTANewRecord(
        _database,
        deckId: deckId,
      );

  Future retrievalSessionsDecksDeleteById({
    int? id,
  }) =>
      performRetrievalSessionsDecksDeleteById(
        _database,
        id: id,
      );

  Future retrievalSessionsCREATE({
    String? userId,
    int? durationSec,
    int? totalCardNumber,
    int? failNumber,
    int? successNumber,
    String? date,
  }) =>
      performRetrievalSessionsCREATE(
        _database,
        userId: userId,
        durationSec: durationSec,
        totalCardNumber: totalCardNumber,
        failNumber: failNumber,
        successNumber: successNumber,
        date: date,
      );

  Future retrievalSessionsUPDATE({
    int? retrievalSessionId,
    int? newTotalCardNumber,
    int? newFailNumber,
    int? newDurationSec,
    int? newSuccessNumber,
    String? newSpeakingRetrievalDates,
    String? retrievalSessionDate,
  }) =>
      performRetrievalSessionsUPDATE(
        _database,
        retrievalSessionId: retrievalSessionId,
        newTotalCardNumber: newTotalCardNumber,
        newFailNumber: newFailNumber,
        newDurationSec: newDurationSec,
        newSuccessNumber: newSuccessNumber,
        newSpeakingRetrievalDates: newSpeakingRetrievalDates,
        retrievalSessionDate: retrievalSessionDate,
      );

  Future retrievalSessionsDELETE({
    int? id,
  }) =>
      performRetrievalSessionsDELETE(
        _database,
        id: id,
      );

  Future personasCREATE({
    String? userId,
    String? name,
    String? infos,
    String? subject,
  }) =>
      performPersonasCREATE(
        _database,
        userId: userId,
        name: name,
        infos: infos,
        subject: subject,
      );

  Future personasUPDATEAllValues({
    String? userId,
    String? name,
    String? infos,
    String? subject,
    int? id,
  }) =>
      performPersonasUPDATEAllValues(
        _database,
        userId: userId,
        name: name,
        infos: infos,
        subject: subject,
        id: id,
      );

  Future personasDELETEUsingId({
    int? id,
  }) =>
      performPersonasDELETEUsingId(
        _database,
        id: id,
      );

  Future flashcardCreate({
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
  }) =>
      performFlashcardCreate(
        _database,
        userId: userId,
        textRecto: textRecto,
        textVerso: textVerso,
        audioRectoUrl: audioRectoUrl,
        audioVersoUrl: audioVersoUrl,
        imageRectoUrl: imageRectoUrl,
        imageVersoUrl: imageVersoUrl,
        currentRetrievalStep: currentRetrievalStep,
        currentSpeakingStep: currentSpeakingStep,
        toRecall: toRecall,
        currentRecallDate: currentRecallDate,
        nextRecallDate: nextRecallDate,
        successCount: successCount,
        totalReviewCount: totalReviewCount,
        mentalImageBool: mentalImageBool,
        name: name,
        currentSpeakingDate: currentSpeakingDate,
        nextSpeakingDate: nextSpeakingDate,
        tagIds: tagIds,
      );

  Future flashcardUpdate({
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
  }) =>
      performFlashcardUpdate(
        _database,
        flashcardId: flashcardId,
        name: name,
        textRecto: textRecto,
        textVerso: textVerso,
        audioRectoUrl: audioRectoUrl,
        audioVersoUrl: audioVersoUrl,
        imageRectoUrl: imageRectoUrl,
        imageVersoUrl: imageVersoUrl,
        currentRetrievalStep: currentRetrievalStep,
        currentSpeakingStep: currentSpeakingStep,
        toRecall: toRecall,
        currentRecallDate: currentRecallDate,
        nextRecallDate: nextRecallDate,
        successCount: successCount,
        totalReviewCount: totalReviewCount,
        mentalImageBool: mentalImageBool,
        currentSpeakingDate: currentSpeakingDate,
        nextSpeakingDate: nextSpeakingDate,
        tagIds: tagIds,
      );

  Future flashcardDeleteWithId({
    int? flashcardId,
  }) =>
      performFlashcardDeleteWithId(
        _database,
        flashcardId: flashcardId,
      );

  Future deckCREATE({
    String? userId,
    String? name,
    int? totalCards,
    double? deckSuccessRate,
  }) =>
      performDeckCREATE(
        _database,
        userId: userId,
        name: name,
        totalCards: totalCards,
        deckSuccessRate: deckSuccessRate,
      );

  Future deckUPDATEFromId({
    String? userId,
    String? name,
    int? totalCards,
    double? deckSuccessRate,
    int? id,
  }) =>
      performDeckUPDATEFromId(
        _database,
        userId: userId,
        name: name,
        totalCards: totalCards,
        deckSuccessRate: deckSuccessRate,
        id: id,
      );

  Future deckDELETEWithId({
    int? id,
  }) =>
      performDeckDELETEWithId(
        _database,
        id: id,
      );

  Future conversationCREATE({
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
  }) =>
      performConversationCREATE(
        _database,
        userId: userId,
        personaId: personaId,
        deckId: deckId,
        cheatsheetId: cheatsheetId,
        durationMs: durationMs,
        date: date,
        totalCardNumber: totalCardNumber,
        validatedCardNumber: validatedCardNumber,
        validatedCardIds: validatedCardIds,
        timeSpoken: timeSpoken,
      );

  Future conversationDELETEFromId({
    int? conversationId,
  }) =>
      performConversationDELETEFromId(
        _database,
        conversationId: conversationId,
      );

  Future cheatsheetCREATE({
    String? userId,
    String? name,
  }) =>
      performCheatsheetCREATE(
        _database,
        userId: userId,
        name: name,
      );

  Future cheatsheetUPDATEAllInfosById({
    int? id,
    String? newConcept,
    String? newAnswer,
    String? newConceptAudioUrl,
    String? newAnswerAudioUrl,
    String? newCheatsheetId,
  }) =>
      performCheatsheetUPDATEAllInfosById(
        _database,
        id: id,
        newConcept: newConcept,
        newAnswer: newAnswer,
        newConceptAudioUrl: newConceptAudioUrl,
        newAnswerAudioUrl: newAnswerAudioUrl,
        newCheatsheetId: newCheatsheetId,
      );

  Future cheatsheetDELETEById({
    int? id,
  }) =>
      performCheatsheetDELETEById(
        _database,
        id: id,
      );

  Future cheatsheetRowCREATE({
    String? concept,
    String? answer,
    String? conceptAudioUrl,
    String? answerAudioUrl,
    int? cheatsheetId,
  }) =>
      performCheatsheetRowCREATE(
        _database,
        concept: concept,
        answer: answer,
        conceptAudioUrl: conceptAudioUrl,
        answerAudioUrl: answerAudioUrl,
        cheatsheetId: cheatsheetId,
      );

  Future cheatsheetRowsUPDATERow({
    int? cheatsheetId,
    String? concept,
    String? answer,
    String? conceptAudioUrl,
    String? answerAudioUrl,
    int? rowId,
  }) =>
      performCheatsheetRowsUPDATERow(
        _database,
        cheatsheetId: cheatsheetId,
        concept: concept,
        answer: answer,
        conceptAudioUrl: conceptAudioUrl,
        answerAudioUrl: answerAudioUrl,
        rowId: rowId,
      );

  Future cheatsheetRowsDELETEId({
    int? id,
  }) =>
      performCheatsheetRowsDELETEId(
        _database,
        id: id,
      );

  Future userCreateIfNoUserInDB({
    String? uuid,
    String? username,
    String? email,
    double? globalSuccessRate,
    int? totalCardLearned,
  }) =>
      performUserCreateIfNoUserInDB(
        _database,
        uuid: uuid,
        username: username,
        email: email,
        globalSuccessRate: globalSuccessRate,
        totalCardLearned: totalCardLearned,
      );

  Future conversationsFlashcardsCREATEAfterConversation({
    int? flashcardId,
    int? conversationId,
  }) =>
      performConversationsFlashcardsCREATEAfterConversation(
        _database,
        flashcardId: flashcardId,
        conversationId: conversationId,
      );

  Future conversationPersonasCREATEAfterConversation({
    String? personaId,
    int? conversationId,
  }) =>
      performConversationPersonasCREATEAfterConversation(
        _database,
        personaId: personaId,
        conversationId: conversationId,
      );

  Future srsParametersCREATEFirstOnes({
    String? userId,
  }) =>
      performSrsParametersCREATEFirstOnes(
        _database,
        userId: userId,
      );

  Future decksFlashcardsCREATERow({
    int? deckId,
    int? flashcardId,
  }) =>
      performDecksFlashcardsCREATERow(
        _database,
        deckId: deckId,
        flashcardId: flashcardId,
      );

  Future decksIncrementTotalCards({
    int? deckId,
  }) =>
      performDecksIncrementTotalCards(
        _database,
        deckId: deckId,
      );

  Future dataExtractCREATE1Row({
    String? userId,
    String? tableName,
    String? date,
    int? sizeOct,
    int? partNumber,
    String? tableData,
    int? lineCount,
  }) =>
      performDataExtractCREATE1Row(
        _database,
        userId: userId,
        tableName: tableName,
        date: date,
        sizeOct: sizeOct,
        partNumber: partNumber,
        tableData: tableData,
        lineCount: lineCount,
      );

  Future dataExtractDELETEAll() => performDataExtractDELETEAll(
        _database,
      );

  Future decksFlashcardsDELETERowByFlashcardId({
    int? flashcardId,
  }) =>
      performDecksFlashcardsDELETERowByFlashcardId(
        _database,
        flashcardId: flashcardId,
      );

  Future tagsINSERTNew({
    String? name,
    String? categoriesList,
  }) =>
      performTagsINSERTNew(
        _database,
        name: name,
        categoriesList: categoriesList,
      );

  Future tagsUPDATEAddCategoryIf({
    String? newTagName,
    String? category,
  }) =>
      performTagsUPDATEAddCategoryIf(
        _database,
        newTagName: newTagName,
        category: category,
      );

  /// END UPDATE QUERY CALLS
}
