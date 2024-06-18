import '/flutter_flow/flutter_flow_util.dart';
import 'insert_audio_flashcard_widget.dart' show InsertAudioFlashcardWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class InsertAudioFlashcardModel
    extends FlutterFlowModel<InsertAudioFlashcardWidget> {
  ///  Local state fields for this component.

  String audioFileName = 'None';

  String? audioFile;

  bool? isRecording = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  AudioRecorder? audioRecorder;
  String? audioRecord;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future upload(BuildContext context) async {}
}
