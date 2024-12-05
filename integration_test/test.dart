import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:convsrs/flutter_flow/flutter_flow_theme.dart';
import 'package:convsrs/index.dart';
import 'package:convsrs/main.dart';
import 'package:convsrs/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';

import 'package:convsrs/backend/supabase/supabase.dart';
import 'package:convsrs/auth/supabase_auth/auth_util.dart';

import 'package:convsrs/backend/sqlite/sqlite_manager.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await SupaFlow.initialize();

    await SQLiteManager.initialize();
    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('Deck CRUD Flashcard CRUD and Retrieval Test',
      (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: 'a@a.com', password: 'aaaaaa');
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(
        entryPage: HomePageWidget(),
      ),
    ));

    await tester.tap(find.byKey(const ValueKey('bigButton_5tjy')));
    await tester.tap(find.byKey(const ValueKey('AddDeckButton_6e6p')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 200),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 500),
    );
    expect(find.byKey(const ValueKey('deckNameField')), findsOneWidget);
    await tester.enterText(
        find.byKey(const ValueKey('deckNameField')), 'NewDeckTest');
    FocusManager.instance.primaryFocus?.unfocus();
    expect(
      tester
          .widget<TextFormField>(find.byKey(const ValueKey('deckNameField')))
          .controller
          .text,
      equals('NewDeckTest'),
    );
    await tester.tap(find.byKey(const ValueKey('Button_p32y')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 200),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 500),
    );
    expect(find.text('Decks'), findsOneWidget);
    expect(find.text('NewDeckTest'), findsOneWidget);
    await tester.longPress(find.byKey(const ValueKey('Row_xlmt')));
    expect(find.byKey(const ValueKey('DeleteButton_89zx')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('DeleteButton_89zx')));
    await tester.pumpAndSettle(
      const Duration(milliseconds: 200),
      EnginePhase.sendSemanticsUpdate,
      const Duration(milliseconds: 500),
    );
    expect(find.byKey(const ValueKey('deckRow')), findsNothing);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }

  return false;
}
