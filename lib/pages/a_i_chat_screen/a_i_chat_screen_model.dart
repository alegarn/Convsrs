import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a_i_chat_screen_widget.dart' show AIChatScreenWidget;
import 'package:flutter/material.dart';

class AIChatScreenModel extends FlutterFlowModel<AIChatScreenWidget> {
  ///  Local state fields for this page.

  List<FlashcardsRetrievalStatusStruct> flashcardsState = [];
  void addToFlashcardsState(FlashcardsRetrievalStatusStruct item) =>
      flashcardsState.add(item);
  void removeFromFlashcardsState(FlashcardsRetrievalStatusStruct item) =>
      flashcardsState.remove(item);
  void removeAtIndexFromFlashcardsState(int index) =>
      flashcardsState.removeAt(index);
  void insertAtIndexInFlashcardsState(
          int index, FlashcardsRetrievalStatusStruct item) =>
      flashcardsState.insert(index, item);
  void updateFlashcardsStateAtIndex(
          int index, Function(FlashcardsRetrievalStatusStruct) updateFn) =>
      flashcardsState[index] = updateFn(flashcardsState[index]);

  String chatContext = 'exemple context';

  List<dynamic> conversationHistory = [];
  void addToConversationHistory(dynamic item) => conversationHistory.add(item);
  void removeFromConversationHistory(dynamic item) =>
      conversationHistory.remove(item);
  void removeAtIndexFromConversationHistory(int index) =>
      conversationHistory.removeAt(index);
  void insertAtIndexInConversationHistory(int index, dynamic item) =>
      conversationHistory.insert(index, item);
  void updateConversationHistoryAtIndex(
          int index, Function(dynamic) updateFn) =>
      conversationHistory[index] = updateFn(conversationHistory[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (OpenAI Retrieval Chat Context)] action in AIChatScreen widget.
  ApiCallResponse? apiResultd74;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
