import '/components/flashcard_component/insert_audio_flashcard/insert_audio_flashcard_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_creation_face_widget.dart' show CardCreationFaceWidget;
import 'package:flutter/material.dart';

class CardCreationFaceModel extends FlutterFlowModel<CardCreationFaceWidget> {
  ///  Local state fields for this component.

  bool showRecto = true;

  String? textRectoState = 'textRecto';

  String? textVersoState = 'textVerso';

  String nameState = 'name';

  ///  State fields for stateful widgets in this component.

  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for TextRectoField widget.
  FocusNode? textRectoFieldFocusNode;
  TextEditingController? textRectoFieldTextController;
  String? Function(BuildContext, String?)?
      textRectoFieldTextControllerValidator;
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
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    textRectoFieldFocusNode?.dispose();
    textRectoFieldTextController?.dispose();

    insertAudioFlashcardModel1.dispose();
    textVersoFieldFocusNode?.dispose();
    textVersoFieldTextController?.dispose();

    insertAudioFlashcardModel2.dispose();
  }
}
