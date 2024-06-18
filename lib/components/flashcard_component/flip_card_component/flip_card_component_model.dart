import '/backend/sqlite/sqlite_manager.dart';
import '/components/flashcard_component/card_creation_face/card_creation_face_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'flip_card_component_widget.dart' show FlipCardComponentWidget;
import 'package:flutter/material.dart';

class FlipCardComponentModel extends FlutterFlowModel<FlipCardComponentWidget> {
  ///  Local state fields for this component.

  bool isRecto = true;

  ///  State fields for stateful widgets in this component.

  // Model for CardCreationFaces.
  late CardCreationFaceModel cardCreationFacesModel;
  // Stores action output result for [Backend Call - SQLite (flashcards READ last id)] action in ValidCardButton widget.
  List<FlashcardsREADLastIdRow>? flashcardID;

  @override
  void initState(BuildContext context) {
    cardCreationFacesModel =
        createModel(context, () => CardCreationFaceModel());
  }

  @override
  void dispose() {
    cardCreationFacesModel.dispose();
  }
}
