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

  List<String> conversationData = [];
  void addToConversationData(String item) => conversationData.add(item);
  void removeFromConversationData(String item) => conversationData.remove(item);
  void removeAtIndexFromConversationData(int index) =>
      conversationData.removeAt(index);
  void insertAtIndexInConversationData(int index, String item) =>
      conversationData.insert(index, item);
  void updateConversationDataAtIndex(int index, Function(String) updateFn) =>
      conversationData[index] = updateFn(conversationData[index]);

  ///  State fields for stateful widgets in this page.

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
