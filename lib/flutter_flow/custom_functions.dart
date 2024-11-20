import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/supabase_auth/auth_util.dart';

FlashcardStruct? getNextCurrentCardInFlashcardsList(
  List<FlashcardStruct> flashcardsList,
  FlashcardStruct currentCard,
) {
  int currentIndex =
      flashcardsList.indexWhere((card) => card.id == currentCard.id);
  if (currentIndex == -1 || currentIndex == flashcardsList.length - 1) {
    // If currentCard id is not found or it is the last card in the list
    return null;
  }

  // Get the next card from the list
  FlashcardStruct? nextCard = flashcardsList[currentIndex + 1];

  return nextCard;
}

List<FlashcardsRetrievalStatusStruct> setCardsRetrievalStatus(
  List<FlashcardStruct> flashcardsList,
  int timeToRetrieveCount,
) {
  List<FlashcardsRetrievalStatusStruct> currentCardsStatus = [];

  // Iterate through each flashcard in the list
  for (FlashcardStruct flashcard in flashcardsList) {
    // Create a new FlashcardsRetrievalStatusStruct object
    FlashcardsRetrievalStatusStruct status = FlashcardsRetrievalStatusStruct(
      id: flashcard.id,
      status: "waiting",
      toReviewAgainThisSessionCount: timeToRetrieveCount,
      currentRetrievalStep: flashcard.currentRetrievalStep,
    );

    // Add the object to the currentCardsStatus list
    currentCardsStatus.add(status);
  }

  return currentCardsStatus;
}

String? dateNow() {
  final DateTime dateNow = DateTime.now().toUtc();
  return DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateNow);
}

List<FlashcardStruct> moveCurrentcardToEnd(
  List<FlashcardStruct> cardsToReviewList,
  FlashcardStruct currentCard,
) {
  final int currentIndex =
      cardsToReviewList.indexWhere((card) => card.id == currentCard.id);

  if (currentIndex == -1) {
    return cardsToReviewList;
  }
  ;

  final List<FlashcardStruct> updatedList = List.from(cardsToReviewList);
  final FlashcardStruct removedCard = updatedList.removeAt(currentIndex);
  updatedList.add(removedCard);

  return updatedList;
}

List<FlashcardsRetrievalStatusStruct> updateFlashcardsStatusList(
  List<FlashcardsRetrievalStatusStruct> flashcardsRetrievalStatus,
  FlashcardStruct currentCard,
  bool? currentCardIsRemembered,
) {
  return flashcardsRetrievalStatus.map((flashcard) {
    if (flashcard.id == currentCard.id) {
      String newStatus =
          currentCardIsRemembered == true ? "succeeded" : "failed";
      int newToRetrieveCount = flashcard.currentRetrievalStep == 1
          ? flashcard.toReviewAgainThisSessionCount - 1
          : 0;

      return FlashcardsRetrievalStatusStruct(
        id: flashcard.id,
        status: newStatus,
        toReviewAgainThisSessionCount: newToRetrieveCount,
        currentRetrievalStep: flashcard.currentRetrievalStep,
      );
    } else {
      return flashcard;
    }
  }).toList();
}

bool isCurrentcardToReviewAgainThisSession(
  FlashcardStruct? currentCard,
  List<FlashcardsRetrievalStatusStruct> cardsStatus,
) {
  if (currentCard == null) {
    return false;
  }

  FlashcardsRetrievalStatusStruct cardStatus = cardsStatus.firstWhere(
    (status) => status.id == currentCard.id,
    orElse: () => FlashcardsRetrievalStatusStruct(),
  );

  if (cardStatus.toReviewAgainThisSessionCount == 0) {
    return false;
  }

  return true;
}

bool? isListEmpty(List<FlashcardStruct>? myList) {
  return myList?.isEmpty ?? true;
}

List<FlashcardStruct> updateReviewedFlashcardsWithStatus(
  List<FlashcardStruct> cardReviewedList,
  List<FlashcardsRetrievalStatusStruct> cardsStatus,
) {
  for (int i = 0; i < cardReviewedList.length; i++) {
    FlashcardStruct card = cardReviewedList[i];
    FlashcardsRetrievalStatusStruct? status = cardsStatus.firstWhere(
      (element) => element.id == card.id,
      orElse: () => FlashcardsRetrievalStatusStruct(),
    );

    if (status.status == "succeeded") {
      card.currentRetrievalStep += 1;
    } else if (status.status == "failed") {
      card.currentRetrievalStep = 1;
    }
    ;

    card.totalReviewCount += 1;
  }
  ;

  return cardReviewedList;
}

String getNextSpeakingDateFromIntervals(String conversationStepsIntervalsSec) {
  List<String> intervals = conversationStepsIntervalsSec
      .replaceAll(RegExp(r'[\[\]]'), '')
      .split(', ');
  final DateTime dateNow = DateTime.now();

  if (intervals.length > 1) {
    final int nextSpeakingInterval = int.parse(intervals[1]);
    final DateTime nextSpeakingDate =
        dateNow.add(Duration(seconds: nextSpeakingInterval));
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(nextSpeakingDate);
  }
  ;

  return DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateNow);
}

String? calculateNextRecallDate(int? retrievalIntervalDurationSec) {
  final DateTime dateNow = DateTime.now().toUtc();

  final Duration interval =
      Duration(seconds: retrievalIntervalDurationSec ?? 0);
  final DateTime nextRecallDate = dateNow.add(interval);

  return DateFormat('yyyy-MM-ddTHH:mm:ss').format(nextRecallDate);
}

List<FlashcardConversationStatusStruct>? updateFlashcardConversationStatus(
    List<FlashcardsForConversationWithDeckIdRow>? cardsData) {
  bool isNotNullOrEmpty(String? str) {
    // Regular expression to match a list of numbers in square brackets
    final RegExp regex = RegExp(r'^\[\s*(\d+\s*(,\s*\d+\s*)*)?\]$');

    // Check if the input string is valid
    if (str == null || !regex.hasMatch(str) || str.isEmpty) {
      return false; // Return default list if the format is incorrect
    }
    return true;
  }

  List<int> stringToIntList(String? str) {
    if (str != null) {
      // Remove the square brackets
      str = str.replaceAll('[', '').replaceAll(']', '');
      // Split the string by commas and convert to integers
      return str.split(',').map(int.parse).toList();
    }
    return []; // Return an empty list if str is null
  }

  List<FlashcardConversationStatusStruct> flashcardConversationStatusList = [];
  if (cardsData != null) {
    for (var cardData in cardsData) {
      FlashcardConversationStatusStruct flashcardConversationStatus =
          FlashcardConversationStatusStruct(
        id: cardData.flashcardID,
        textVerso: cardData.textVerso,
        textRecto: cardData.textRecto,
        timesValidatedByClickCount: 0,
        isFullyValidated: false,
        tagIds: isNotNullOrEmpty(cardData.tagIds)
            ? stringToIntList(cardData.tagIds)
            : [1],
      );
      flashcardConversationStatusList.add(flashcardConversationStatus);
    }
  }
  return flashcardConversationStatusList;
}

List<FlashcardStruct>? updateCardToReviewListState(
    List<FlashcardsInfosForRetrievalSessionRow>? flashcardsRows) {
  List<FlashcardStruct> flashcardList = [];

  if (flashcardsRows != null) {
    for (var row in flashcardsRows) {
/*       String currentRecallDateString =
          DateFormat('yyyy-MM-ddTHH:mm:ss').format(row.currentRecallDate);
      String nextRecallDateString =
          DateFormat('yyyy-MM-ddTHH:mm:ss').format(row.nextRecallDate);
 */
      FlashcardStruct flashcard = FlashcardStruct(
        id: row.id,
        name: row.name,
        textRecto: row.textRecto,
        textVerso: row.textVerso,
        currentRetrievalStep: row.currentRetrievalStep,
        currentSpeakingStep: row.currentSpeakingStep,
        toRecall: row.toRecall,
        currentRecallDate: row.currentRecallDate, //currentRecallDateString,
        nextRecallDate: row.nextRecallDate, //nextRecallDateString,
        currentSpeakingDate: row.currentSpeakingDate,
        nextSpeakingDate: row.nextSpeakingDate,
        successCount: row.successCount,
        totalReviewCount: row.totalReviewCount,
        mentalImageBool: row.mentalImageBool,
      );
      flashcardList.add(flashcard);
    }
  }

  return flashcardList;
}

String? createListValidatedCardsIds(
    List<ConversationTagsListsStruct>? conversationTagsList) {
  if (conversationTagsList == null || conversationTagsList.isEmpty) {
    return null;
  }

  // Extracting ids from flashcardInfosList only if isFullyValidated is true
  List<String> validatedCardIds = [];

  for (var conversationTags in conversationTagsList) {
    for (var flashcard in conversationTags.flashcardInfosList) {
      if (flashcard.isFullyValidated == true) {
        validatedCardIds.add(flashcard.id.toString());
      }
    }
  }

  // Convert the list of validated card IDs to a JSON string
  String cardIds = jsonEncode(validatedCardIds);
  return cardIds.isNotEmpty ? cardIds : null;
}

int extractLenghtInStringArray(String stringArray) {
  List<String> intervals =
      stringArray.replaceAll(RegExp(r'[^\d,]'), '').split(',');
  return intervals.length;
}

String? updateFlashcardCurrentSpeakingDate(
  int? currentSpeakingStep,
  String? conversationStepsIntervalsSec,
  String? currentSpeakingDate,
) {
// currentSpeakingDate is string with a date in "YYYY-MM-DD HH:MM:SS.SSS" format
// conversationStepsIntervalsSec contains an array like "[0,516541,216...]", all numbers are the intervals in sec
// currentSpeakingStep = 1 minimum (10 max)
// choose the interval:  conversationStepsIntervalsSec[currentSpeakingStep-1] when string to array of integers returns the new current interval
//currentSpeakingDate = interval in conversationStepsIntervalsSec[currentSpeakingStep - 1] + today
  //if conversationStepsIntervalsSec.length <= currentSpeakingStep
  //nextSpeakingStep = interval in conversationStepsIntervalsSec[currentSpeakingStep] + currentSpeakingDate
  if (currentSpeakingStep == null ||
      conversationStepsIntervalsSec == null ||
      currentSpeakingDate == null) {
    return null;
  }

  List<String> intervals = conversationStepsIntervalsSec
      .replaceAll('[', '')
      .replaceAll(']', '')
      .split(',')
      .map((interval) => interval.trim())
      .toList();

  if (currentSpeakingStep < 0 ||
      currentSpeakingStep > 10 ||
      intervals.isEmpty) {
    return null;
  }

  if (intervals.length > currentSpeakingStep + 1) {
    DateTime currentDateTime;

    if (currentSpeakingDate == 'done') {
      currentDateTime = DateTime.now().toUtc();
    } else {
      currentDateTime = DateTime.parse(currentSpeakingDate);
    }
    int newInterval = int.parse(intervals[currentSpeakingStep + 1]);

    DateTime newSpeakingDate =
        currentDateTime.add(Duration(seconds: newInterval));

    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(newSpeakingDate);
  }

  if (intervals.length <= currentSpeakingStep + 1) {
    return "done";
  }

  //int nextInterval = int.parse(intervals[currentSpeakingStep]);
  //DateTime nextSpeakingDate =
  //  newSpeakingDate.add(Duration(seconds: nextInterval));

  //return DateFormat('yyyy-MM-ddTHH:mm:ss').format(nextSpeakingDate);
}

String? updateFlashcardNextSpeakingDate(
  String? nextSpeakingDate,
  int? intervals,
  int? currentSpeakingStep,
) {
  return null;
  // nextSpeakingDate is string  like "none" or "yyyy..."
  // intervals is a string like '[0, 5153165, ...]' like an array of integers
  // currentSpeakingStep is int, it will determine the next interval by being the position on the array intervals
  // if  intervals.length <  currentSpeakingStep +2
  // return 'none'
  // else
  // calculate the interval in
}

List<FlashcardConversationStatusStruct>? moveFirstItemFlashConvStatToEndOfList(
    List<FlashcardConversationStatusStruct>? flashcardConversationStatus) {
  if (flashcardConversationStatus == null ||
      flashcardConversationStatus.isEmpty) {
    return null;
  }

  FlashcardConversationStatusStruct firstItem =
      flashcardConversationStatus.removeAt(0);
  flashcardConversationStatus.add(firstItem);

  return flashcardConversationStatus;
}

String? csvFromPersonas(List<PersonasREADAllRow>? personas) {
  final List<String> csvLines = [];
  csvLines.add('id,userId,name,infos,subject');

  for (final persona in personas!) {
    final List<String> rowData = [
      persona.id.toString(),
      persona.userId,
      persona.name,
      persona.infos,
      persona.subject
    ];
    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromFlashcards(List<FlashcardReadAllRow>? flashcards) {
  if (flashcards == null) {
    return 'no data';
  }

  final List<String> csvLines = [];
  csvLines.add(
      'id,userId,name,textRecto,textVerso,audioRectoUrl,audioVersoUrl,imageRectoUrl,imageVersoUrl,currentRetrievalStep,currentSpeakingStep,toRecall,currentRecallDate,nextRecallDate,currentSpeakingDate,nextSpeakingDate,successCount,totalReviewCount,mentalImageBool,tagIds');

  for (final flashcard in flashcards) {
    final List<String> rowData = [
      flashcard.id?.toString() ?? '',
      flashcard.userId,
      flashcard.name,
      flashcard.textRecto,
      flashcard.textVerso,
      flashcard.audioRectoUrl,
      flashcard.audioVersoUrl,
      flashcard.imageRectoUrl,
      flashcard.imageVersoUrl,
      flashcard.currentRetrievalStep.toString(),
      flashcard.currentSpeakingStep.toString(),
      flashcard.toRecall.toString(),
      flashcard.currentRecallDate,
      flashcard.nextRecallDate,
      flashcard.currentSpeakingDate ?? 'default',
      flashcard.nextSpeakingDate ?? 'default',
      flashcard.successCount.toString(),
      flashcard.totalReviewCount.toString(),
      flashcard.mentalImageBool.toString(),
      flashcard.tagIds.toString()
    ];
    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromDecks(List<DecksREADFromUserIdRow>? decks) {
  if (decks == null) {
    return 'no data';
  }

  final List<String> csvLines = [];
  csvLines.add('id,userId,name,totalCards,deckSuccessRate');
  for (final deck in decks) {
    final List<String> rowData = [
      deck.id.toString(),
      deck.userId ?? '',
      deck.name ?? '',
      deck.totalCards.toString(),
      deck.deckSuccessRate.toString(),
    ];
    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromConversations(List<ConversationsREADAllRow>? conversations) {
  if (conversations == null) {
    return 'no data';
  }

  final List<String> csvLines = [];

  csvLines.add(
      'id,personaId,deckId,cheatsheetId,durationMs,date,totalCardNumber,validatedCardNumber,validatedCardIds,timeSpoken');
  for (final conversation in conversations) {
    final List<String> rowData = [
      conversation.id.toString(),
      //conversation.userId ?? '',
      conversation.personaId.toString(),
      conversation.deckId.toString(),
      conversation.cheatsheetId.toString(),
      conversation.durationMs.toString(),
      conversation.date ?? '',
      conversation.totalCardNumber.toString(),
      conversation.validatedCardNumber.toString(),
      conversation.validatedCardIds ?? '',
      conversation.timeSpoken.toString(),
    ];
    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromParameters(List<SRSParametersREADAllRow>? srsParameters) {
  if (srsParameters == null) {
    return 'no data';
  }

  final List<String> csvLines = [];
  csvLines.add(
      'id,stepNumber,retrievalIntervalDurationSec,conversationStepsIntervalsSec');

  for (final srsParameter in srsParameters) {
    final List<String> rowData = [
      srsParameter.id.toString(),
      //srsParameter.userId ?? '',
      srsParameter.stepNumber.toString(),
      srsParameter.retrievalIntervalDurationSec.toString(),
      srsParameter.conversationStepsIntervalsSec.toString(),
    ];

    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvRetrievalSessionsDecks(
    List<RetrievalSessionsDecksREADAllRow>? retrievalSesssionsDecks) {
  if (retrievalSesssionsDecks == null) {
    return 'no data';
  }

  final List<String> csvLines = [];

  csvLines.add('id,retrievalSessionId,deckId');

  for (final sessionDeck in retrievalSesssionsDecks) {
    final List<String> rowData = [
      sessionDeck.id.toString(),
      sessionDeck.retrievalSessionId.toString(),
      sessionDeck.deckId.toString(),
    ];

    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromConversationsFlashcards(
    List<ConversationsFlashcardsREADAllRow>? conversationsFlashcards) {
  if (conversationsFlashcards == null) {
    return 'no data';
  }

  final List<String> csvLines = [];

  csvLines.add('id,conversationId,flashcardId');

  for (final conversationFlashcard in conversationsFlashcards) {
    final List<String> rowData = [
      conversationFlashcard.id.toString(),
      conversationFlashcard.conversationId.toString(),
      conversationFlashcard.flashcardId.toString(),
    ];

    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromDecksFlashcards(
    List<DecksFlashcardsREADAllRow>? decksFlashcards) {
  if (decksFlashcards == null) {
    return 'no data';
  }

  final List<String> csvLines = [];

  csvLines.add('id,deckId,flashcardId');

  for (final deckFlashcard in decksFlashcards) {
    final List<String> rowData = [
      deckFlashcard.id.toString(),
      deckFlashcard.deckId.toString(),
      deckFlashcard.flashcardId.toString(),
    ];

    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromConversationPersonas(
    List<ConversationPersonasRow>? conversationPersonas) {
  if (conversationPersonas == null) {
    return 'no data';
  }

  final List<String> csvLines = [];

  csvLines.add('id,conversationId,personaId');

  for (final row in conversationPersonas) {
    final List<String> rowData = [
      row.id.toString(),
      row.conversationId.toString(),
      row.personaId.toString(),
    ];

    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromCheatsheets(List<CheatsheetsREADAllByUserIdRow>? cheatsheets) {
  if (cheatsheets == null) {
    return 'no data';
  }

  final List<String> csvLines = [];

  csvLines.add('id,name');

  for (final cheatsheet in cheatsheets) {
    final List<String> rowData = [
      cheatsheet.id.toString(),

      //cheatsheet.userId ?? '',

      cheatsheet.name,
    ];

    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromCheatsheetRows(List<CheatsheetRowsREADAllRow>? cheatsheetRows) {
  if (cheatsheetRows == null) {
    return 'no data';
  }

  final List<String> csvLines = [];

  csvLines.add('id,cheatsheetId,concept,answer,conceptAudioUrl,answerAudioUrl');

  for (final row in cheatsheetRows) {
    final List<String> rowData = [
      row.id.toString(),
      row.cheatsheetId.toString(),
      row.concept,
      row.answer,
      row.conceptAudioUrl,
      row.answerAudioUrl,
    ];

    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? csvFromRetrievalSessions(
    List<RetrievalSessionsREADAllFromUserIdRow>? retrievalSessions) {
  if (retrievalSessions == null) {
    return 'no data';
  }

  final List<String> csvLines = [];
  csvLines.add(
      'id,userId,durationSec,totalCardNumber,failNumber,successNumber,date');

  for (final session in retrievalSessions) {
    final List<String> rowData = [
      session.id.toString(),
      session.userId ?? '',
      session.durationSec.toString(),
      session.totalCardNumber.toString(),
      session.failNumber.toString(),
      session.successNumber.toString(),
      session.date.toString(),
    ];
    csvLines.add(rowData.join(','));
  }

  return csvLines.join('\n');
}

String? extractFlashcards(
    List<ConversationTagsListsStruct>? conversationTagsList) {
  String flashcardData = '';

  if (conversationTagsList != null) {
    for (var conversationTags in conversationTagsList) {
      for (var flashcard in conversationTags.flashcardInfosList) {
        flashcardData += '${flashcard.textRecto} : ${flashcard.textVerso}\n';
      }
    }
  }

  return flashcardData.isNotEmpty ? flashcardData.trim() : null;
}

List<TagStruct> formatNewTags(List<TagsGETAllRow>? allTagsList) {
  // Check if the input list is null or empty
  if (allTagsList == null || allTagsList.isEmpty) {
    // Return a list with a default TagStruct
    return [TagStruct(id: 1, name: "no_tag")];
  }

  // Map the allTagsList to a new List<TagStruct>
  return allTagsList.map((tag) {
    return TagStruct(id: tag?.id ?? 1, name: tag?.name ?? "no_tag");
  }).toList();
}

String? extractTagsIds(List<TagStruct>? selectedTags) {
  // Check if the selectedTags list is null or empty
  if (selectedTags == null || selectedTags.isEmpty) {
    return '["1"]'; // or return an empty string if preferred
  }

  // Extract the IDs and join them into a comma-separated string
  return '[${selectedTags.map((tag) => tag?.id.toString()).where((id) => id != null).join(",")}]'; // Join non-null IDs
}

List<TagStruct> filterSelectedTagsInAllTags(
  List<TagStruct>? selectedTagListArg,
  List<TagStruct> allTags,
) {
  debugPrint("filterSelectedTagsInAllTags");
  debugPrint(
      "selectedTagListArg = ${selectedTagListArg?.map((tag) => tag.toString())}");
  debugPrint("allTags = ${allTags.map((tag) => tag.toString())}");

  // If selectedTagListArg is null or empty, return allTags filtered by the default tag
  if (selectedTagListArg == null || selectedTagListArg.isEmpty) {
    // Create a set with the default tag ID
    final defaultTagId = 1; // Assuming we want to filter out tags with id 1
    return allTags.where((tag) => tag.id != defaultTagId).toList();
  }

  // Create a set of selected tag IDs for efficient lookup
  final selectedTagIds = selectedTagListArg.map((tag) => tag.id).toSet();

  debugPrint("selectedTagIds = ${selectedTagIds.toList().toString()}");
  debugPrint(
      "filtered allTags =  ${allTags.where((tag) => !selectedTagIds.contains(tag.id)).toList()}");

  // Filter out tags from allTags that are in selectedTagIds
  return allTags.where((tag) => !selectedTagIds.contains(tag.id)).toList();
}

String? formatSelectedTagsToIds(List<TagStruct>? selectedTagsArgument) {
  if (selectedTagsArgument == null || selectedTagsArgument.isEmpty) {
    // Return a list with a default TagStruct
    return "[]";
  }

  // Create a list to hold the IDs
  final List<int> selectedTagsList = [];

  // Map through the selected tags and add their IDs to the list
  selectedTagsArgument.forEach((tag) {
    if (tag != null) {
      selectedTagsList.add(tag.id);
    }
  });

  // Convert the list of IDs to a string
  return selectedTagsList.toString();
}

bool? detectTagIds(String tagIds) {
  RegExp regex = RegExp(r'^\[(\d+)(,\d+)*\]$');
  return regex.hasMatch(tagIds);
}

List<TagStruct> newSelectedTag() {
  return [TagStruct(id: 1, name: "no_tag")];
}

String? getNamesFromTagList(List<TagStruct> tagList) {
  // Create a Set to hold unique names
  Set<String> uniqueNames = {};

  // Iterate through the tag list and add names to the Set
  for (var tag in tagList) {
    uniqueNames.add(tag.name);
  }

  // Combine the unique names into a single string
  String combinedNames = uniqueNames.join('| ');

  return combinedNames.isNotEmpty
      ? combinedNames
      : null; // Return null if no names are present
}

List<DecksFlashcardForListStruct>? addFlashcardsListToDecksFlashcardState(
  List<FlashcardsReadAllFromDeckNameAndIdRow>? flashcards,
  int? deckId,
) {
  if (flashcards == null) {
    return null; // Return null if the input list is null
  }

  List<DecksFlashcardForListStruct> decksFlashcards =
      flashcards.asMap().entries.map((entry) {
    int index = entry.key; // Get the index
    FlashcardsReadAllFromDeckNameAndIdRow flashcard =
        entry.value; // Get the flashcard

    return DecksFlashcardForListStruct(
      listId: index + 1, // Assign id as n + 1
      deckId: deckId, // Use the provided deckId
      flashcardId: flashcard.id, // Assuming flashcard.id is the flashcardId
      name: flashcard.name,
      isVisible: true, // Defaulting to true for visibility
    );
  }).toList();

  return decksFlashcards;
}

List<DecksFlashcardForListStruct> updateFlashcardsVisibility(
  List<DecksFlashcardForListStruct> flashcardList,
  String? filterText,
) {
  if (filterText == null || filterText.isEmpty) {
    for (var flashcard in flashcardList) {
      flashcard.isVisible = true;
    }
    return flashcardList;
  }

  for (var flashcard in flashcardList) {
    flashcard.isVisible =
        flashcard.name.toLowerCase().contains(filterText.toLowerCase());
  }

  return flashcardList;
}
