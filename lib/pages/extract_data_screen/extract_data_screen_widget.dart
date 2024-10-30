import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'extract_data_screen_model.dart';
export 'extract_data_screen_model.dart';

class ExtractDataScreenWidget extends StatefulWidget {
  const ExtractDataScreenWidget({super.key});

  @override
  State<ExtractDataScreenWidget> createState() =>
      _ExtractDataScreenWidgetState();
}

class _ExtractDataScreenWidgetState extends State<ExtractDataScreenWidget> {
  late ExtractDataScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExtractDataScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Extract  data',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 340.0,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Extract your data table',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 25.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final extractDataTable =
                                    _model.extractDataState.toList();

                                return FlutterFlowDataTable<
                                    DataExtractREADAllNoDataRow>(
                                  controller:
                                      _model.paginatedDataTableController,
                                  data: extractDataTable,
                                  columnsBuilder: (onSortChanged) => [
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Text(
                                          'id',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Text(
                                          'Table name',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Text(
                                          'SizeOct',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Text(
                                          'Rows count',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Text(
                                          'Extract table to state',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  dataRowBuilder: (extractDataTableItem,
                                          extractDataTableIndex,
                                          selected,
                                          onSelectChanged) =>
                                      DataRow(
                                    color: WidgetStateProperty.all(
                                      extractDataTableIndex % 2 == 0
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                    ),
                                    cells: [
                                      Text(
                                        valueOrDefault<String>(
                                          extractDataTableItem.id.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          extractDataTableItem.tableName,
                                          'tableName',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          extractDataTableItem.sizeOct
                                              .toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          extractDataTableItem.lineCount
                                              .toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          _model.extractDataFromTableName =
                                              await SQLiteManager.instance
                                                  .dataExtractREADDataFromTableName(
                                            tableName: valueOrDefault<String>(
                                              extractDataTableItem.tableName,
                                              'tableName',
                                            ),
                                          );
                                          _model.csvDataState =
                                              valueOrDefault<String>(
                                            _model.extractDataFromTableName
                                                ?.first.tableData,
                                            'extractDataDefault',
                                          );
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        text: 'Extract',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ].map((c) => DataCell(c)).toList(),
                                  ),
                                  paginated: true,
                                  selectable: false,
                                  hidePaginator: false,
                                  showFirstLastButtons: false,
                                  headingRowHeight: 56.0,
                                  dataRowHeight: 48.0,
                                  columnSpacing: 20.0,
                                  headingRowColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(8.0),
                                  addHorizontalDivider: true,
                                  addTopAndBottomDivider: false,
                                  hideDefaultHorizontalDivider: true,
                                  horizontalDividerColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  horizontalDividerThickness: 1.0,
                                  addVerticalDivider: false,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                // All dataExtract delete
                                await SQLiteManager.instance
                                    .dataExtractDELETEAll();
                                // Query table names with line count
                                _model.sqliteSequence = await SQLiteManager
                                    .instance
                                    .sqliteSequenceREADAll();
                                // SQLite query
                                _model.retrievalSessions = await SQLiteManager
                                    .instance
                                    .retrievalSessionsREADAllFromUserId(
                                  userId: FFAppState().userUuid,
                                );
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'retrievalSessions',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: functions.csvFromRetrievalSessions(
                                      _model.retrievalSessions?.toList())!,
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where((e) =>
                                            e.name == 'retrievalSessions')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.user =
                                    await SQLiteManager.instance.userSelectUser(
                                  uuid: FFAppState().userUuid,
                                );
                                _model.personas = await SQLiteManager.instance
                                    .personasREADAll(
                                  userId: FFAppState().userUuid,
                                );
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'personas',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvFromPersonas(
                                        _model.personas?.toList()),
                                    'defaultTableData',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where((e) => e.name == 'personas')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.flashcards = await SQLiteManager.instance
                                    .flashcardReadAll(
                                  userId: FFAppState().userUuid,
                                );
                                debugPrint(
                                    'Flashcards: ${_model.flashcards?.toList().map((flashcard) => flashcard.tagIds)}');

                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'flashcards',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvFromFlashcards(
                                        _model.flashcards?.toList()),
                                    'flashcards',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where((e) => e.name == 'flashcards')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.decks = await SQLiteManager.instance
                                    .decksREADFromUserId(
                                  userId: FFAppState().userUuid,
                                );
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'decks',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions
                                        .csvFromDecks(_model.decks?.toList()),
                                    'decks',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where((e) => e.name == 'decks')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.conversations = await SQLiteManager
                                    .instance
                                    .conversationsREADAll(
                                  userId: FFAppState().userUuid,
                                );
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'conversations',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvFromConversations(
                                        _model.conversations?.toList()),
                                    'conversations',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where(
                                            (e) => e.name == 'conversations')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.srsParameters = await SQLiteManager
                                    .instance
                                    .sRSParametersREADAll();
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'parameters',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvFromParameters(
                                        _model.srsParameters?.toList()),
                                    'srsParameters',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where(
                                            (e) => e.name == 'srsParameters')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.retrievalSessionsDecks =
                                    await SQLiteManager.instance
                                        .retrievalSessionsDecksREADAll();
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'retrievalSessionsDecks',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvRetrievalSessionsDecks(_model
                                        .retrievalSessionsDecks
                                        ?.toList()),
                                    'retrievalSessionsDecks',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where((e) =>
                                            e.name == 'retrievalSessionsDecks')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.conversationsFlashcards =
                                    await SQLiteManager.instance
                                        .conversationsFlashcardsREADAll();
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'conversationsFlashcards',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvFromConversationsFlashcards(
                                        _model.conversationsFlashcards
                                            ?.toList()),
                                    'conversationsFlashcards',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where((e) =>
                                            e.name == 'conversationsFlashcards')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.decksFlashcards = await SQLiteManager
                                    .instance
                                    .decksFlashcardsREADAll();
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'decksFlashcards',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvFromDecksFlashcards(
                                        _model.decksFlashcards?.toList()),
                                    'decksFlashcards',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where(
                                            (e) => e.name == 'decksFlashcards')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.conversationPersonas =
                                    await SQLiteManager.instance
                                        .conversationPersonas();
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'conversationPersonas',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvFromConversationPersonas(
                                        _model.conversationPersonas?.toList()),
                                    'conversationPersonas',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where((e) =>
                                            e.name == 'conversationPersonas')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.cheatsheets = await SQLiteManager
                                    .instance
                                    .cheatsheetsREADAllByUserId(
                                  userId: valueOrDefault<String>(
                                    FFAppState().userUuid,
                                    'uuid',
                                  ),
                                );
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'cheatsheets',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: functions.csvFromCheatsheets(
                                      _model.cheatsheets?.toList())!,
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where((e) => e.name == 'cheatsheets')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.cheatsheetRows = await SQLiteManager
                                    .instance
                                    .cheatsheetRowsREADAll();
                                // New dataExtract row
                                await SQLiteManager.instance
                                    .dataExtractCREATE1Row(
                                  userId: FFAppState().userUuid,
                                  tableName: 'cheatsheetRows',
                                  date: valueOrDefault<String>(
                                    functions.dateNow(),
                                    'today',
                                  ),
                                  sizeOct: 0,
                                  partNumber: 0,
                                  tableData: valueOrDefault<String>(
                                    functions.csvFromCheatsheetRows(
                                        _model.cheatsheetRows?.toList()),
                                    'cheatsheetRows',
                                  ),
                                  lineCount: valueOrDefault<int>(
                                    _model.sqliteSequence
                                        ?.where(
                                            (e) => e.name == 'cheatsheetRows')
                                        .toList()
                                        .first
                                        .seq,
                                    0,
                                  ),
                                );
                                _model.dataExtract = await SQLiteManager
                                    .instance
                                    .dataExtractREADAllNoData();
                                // Set extractData
                                _model.extractDataState = _model.dataExtract!
                                    .toList()
                                    .cast<DataExtractREADAllNoDataRow>();
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              text: 'Create one extract',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 1.0,
                    maxHeight: 450.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Text(
                            'CSV data',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              _model.csvDataState,
                              'csvDataDefault',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: FFButtonWidget(
                  onPressed: () async {
                    // Get data
                    await Clipboard.setData(
                        ClipboardData(text: _model.csvDataState));
                  },
                  text: 'Save to clipboard',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        24.0, 0.0, 24.0, 0.0),
                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
