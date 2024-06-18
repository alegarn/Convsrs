import '/components/flashcard_component/insert_audio_flashcard/insert_audio_flashcard_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'flip_flashcard_faces_widget.dart' show FlipFlashcardFacesWidget;
import 'package:flutter/material.dart';

class FlipFlashcardFacesModel
    extends FlutterFlowModel<FlipFlashcardFacesWidget> {
  ///  Local state fields for this component.

  String textRecto = 'Type here...';

  FFUploadedFile? imageRecto;

  String textVerso = 'Type here...';

  FFUploadedFile? imageVerso;

  ///  State fields for stateful widgets in this component.

  // State field(s) for CardTextField widget.
  FocusNode? cardTextFieldFocusNode;
  TextEditingController? cardTextFieldTextController;
  String? Function(BuildContext, String?)? cardTextFieldTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for InsertAudioFlashcard component.
  late InsertAudioFlashcardModel insertAudioFlashcardModel1;
  // State field(s) for TextVersoField widget.
  FocusNode? textVersoFieldFocusNode;
  TextEditingController? textVersoFieldTextController;
  String? Function(BuildContext, String?)?
      textVersoFieldTextControllerValidator;
  // Model for InsertAudioFlashcard component.
  late InsertAudioFlashcardModel insertAudioFlashcardModel2;

  @override
  void initState(BuildContext context) {
    insertAudioFlashcardModel1 =
        createModel(context, () => InsertAudioFlashcardModel());
    insertAudioFlashcardModel2 =
        createModel(context, () => InsertAudioFlashcardModel());
  }

  @override
  void dispose() {
    cardTextFieldFocusNode?.dispose();
    cardTextFieldTextController?.dispose();

    insertAudioFlashcardModel1.dispose();
    textVersoFieldFocusNode?.dispose();
    textVersoFieldTextController?.dispose();

    insertAudioFlashcardModel2.dispose();
  }
}
