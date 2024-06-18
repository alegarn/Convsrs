import '/backend/sqlite/sqlite_manager.dart';
import '/components/flashcard_component/card_creation_face/card_creation_face_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'flip_card_component_model.dart';
export 'flip_card_component_model.dart';

class FlipCardComponentWidget extends StatefulWidget {
  const FlipCardComponentWidget({
    super.key,
    int? deckId,
  }) : deckId = deckId ?? 0;

  final int deckId;

  @override
  State<FlipCardComponentWidget> createState() =>
      _FlipCardComponentWidgetState();
}

class _FlipCardComponentWidgetState extends State<FlipCardComponentWidget>
    with TickerProviderStateMixin {
  late FlipCardComponentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlipCardComponentModel());

    animationsMap.addAll({
      'cardCreationFaceOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xFFFBEB20),
            angle: 0.524,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        wrapWithModel(
          model: _model.cardCreationFacesModel,
          updateCallback: () => setState(() {}),
          child: const CardCreationFaceWidget(),
        ).animateOnActionTrigger(
          animationsMap['cardCreationFaceOnActionTriggerAnimation']!,
        ),
        Align(
          alignment: const AlignmentDirectional(1.0, 1.0),
          child: FFButtonWidget(
            onPressed: () async {
              // New Flashcard
              await SQLiteManager.instance.flashcardCreate(
                userId: FFAppState().userUuid,
                textRecto: valueOrDefault<String>(
                  _model
                      .cardCreationFacesModel.textRectoFieldTextController.text,
                  'textRecto',
                ),
                textVerso: valueOrDefault<String>(
                  _model
                      .cardCreationFacesModel.textVersoFieldTextController.text,
                  'textVerso',
                ),
                audioRectoUrl: 'none',
                audioVersoUrl: 'none',
                imageRectoUrl: 'none',
                imageVersoUrl: 'none',
                currentRetrievalStep: 1,
                currentSpeakingStep: 0,
                toRecall: 1,
                currentRecallDate: 'none',
                nextRecallDate: 'none',
                successCount: 0,
                totalReviewCount: 0,
                mentalImageBool: 0,
                name: valueOrDefault<String>(
                  _model
                      .cardCreationFacesModel.nameTextFieldTextController.text,
                  'name',
                ),
                currentSpeakingDate: 'none',
                nextSpeakingDate: 'none',
              );
              // Last flashcard Id
              _model.flashcardID =
                  await SQLiteManager.instance.flashcardsREADLastId();
              // new decksFlashcards
              await SQLiteManager.instance.decksFlashcardsCREATERow(
                deckId: widget.deckId,
                flashcardId: valueOrDefault<int>(
                  _model.flashcardID?.first.id,
                  0,
                ),
              );
              // Delete fields
              setState(() {
                _model.cardCreationFacesModel.nameTextFieldTextController
                    ?.clear();
                _model.cardCreationFacesModel.textRectoFieldTextController
                    ?.clear();
                _model.cardCreationFacesModel.insertAudioFlashcardModel1
                    .textController
                    ?.clear();
                _model.cardCreationFacesModel.textVersoFieldTextController
                    ?.clear();
                _model.cardCreationFacesModel.insertAudioFlashcardModel2
                    .textController
                    ?.clear();
              });
              // Confirm flashcard creation
              if (animationsMap['cardCreationFaceOnActionTriggerAnimation'] !=
                  null) {
                await animationsMap['cardCreationFaceOnActionTriggerAnimation']!
                    .controller
                    .forward(from: 0.0);
              }

              setState(() {});
            },
            text: '',
            icon: const Icon(
              Icons.done_outline,
              size: 30.0,
            ),
            options: FFButtonOptions(
              height: MediaQuery.sizeOf(context).height * 0.1,
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).success,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 28.0,
                    letterSpacing: 0.0,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).accent2,
                width: 3.0,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
