import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'former_word_list_wrap_model.dart';
export 'former_word_list_wrap_model.dart';

class FormerWordListWrapWidget extends StatefulWidget {
  const FormerWordListWrapWidget({
    super.key,
    bool? parameter1,
    bool? parameter2,
    String? parameter3,
    String? parameter4,
    int? parameter5,
    this.parameter6,
    int? parameter7,
    this.parameter8,
    this.parameter9,
  })  : parameter1 = parameter1 ?? false,
        parameter2 = parameter2 ?? false,
        parameter3 = parameter3 ?? 'none',
        parameter4 = parameter4 ?? 'none',
        parameter5 = parameter5 ?? 5,
        parameter7 = parameter7 ?? 5;

  final bool parameter1;
  final bool parameter2;
  final String parameter3;
  final String parameter4;
  final int parameter5;
  final int? parameter6;
  final int parameter7;
  final int? parameter8;
  final List<FlashcardConversationStatusStruct>? parameter9;

  @override
  State<FormerWordListWrapWidget> createState() =>
      _FormerWordListWrapWidgetState();
}

class _FormerWordListWrapWidgetState extends State<FormerWordListWrapWidget>
    with TickerProviderStateMixin {
  late FormerWordListWrapModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormerWordListWrapModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0xFFFFF000),
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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 3.0, 0.0),
      child: Builder(
        builder: (context) {
          final wordList = widget.parameter9?.toList() ?? [];

          return Wrap(
            spacing: 3.0,
            runSpacing: 2.0,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.none,
            children: List.generate(wordList.length, (wordListIndex) {
              final wordListItem = wordList[wordListIndex];
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  // FlashcardStatus Update

                  safeSetState(() {});
                  if (wordListItem.timesValidatedByClickCount ==
                      widget.parameter8) {
                    // State WordValidatedCount

                    safeSetState(() {});
                  } else {
                    return;
                  }
                },
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                    maxHeight: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      wordListItem.isFullyValidated
                          ? FlutterFlowTheme.of(context).warning
                          : FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).primary,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              widget.parameter2
                                  ? valueOrDefault<String>(
                                      wordListItem.textVerso,
                                      'none',
                                    )
                                  : valueOrDefault<String>(
                                      wordListItem.textRecto,
                                      'none',
                                    ),
                              'Verso',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: wordListItem.isFullyValidated
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  fontSize: 48.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            valueOrDefault<String>(
                              wordListItem.timesValidatedByClickCount
                                  .toString(),
                              '0',
                            ).maybeHandleOverflow(
                              maxChars: 2,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: wordListItem.isFullyValidated
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).warning,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation']!,
              );
            }),
          );
        },
      ),
    );
  }
}
