import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier, [Widget? entryPage]) =>
    GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? entryPage ?? const HomePageWidget()
          : const AuthScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? entryPage ?? const HomePageWidget()
              : const AuthScreenWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'DecksScreen',
          path: '/decksScreen',
          builder: (context, params) => DecksScreenWidget(
            isConversation: params.getParam(
              'isConversation',
              ParamType.bool,
            ),
            personaId: params.getParam(
              'personaId',
              ParamType.int,
            ),
            conversationMode: params.getParam(
              'conversationMode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'FlashcardsScreen',
          path: '/flashcardsScreen',
          builder: (context, params) => FlashcardsScreenWidget(
            deckId: params.getParam(
              'deckId',
              ParamType.int,
            ),
            deckName: params.getParam(
              'deckName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'FlashcardUpdateScreen',
          path: '/flashcardUpdateScreen',
          builder: (context, params) => FlashcardUpdateScreenWidget(
            flashcardId: params.getParam(
              'flashcardId',
              ParamType.int,
            ),
            isCreation: params.getParam(
              'isCreation',
              ParamType.bool,
            ),
            deckId: params.getParam(
              'deckId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'ChooseMode',
          path: '/chooseMode',
          builder: (context, params) => const ChooseModeWidget(),
        ),
        FFRoute(
          name: 'PersonasScreen',
          path: '/personasScreen',
          builder: (context, params) => PersonasScreenWidget(
            conversationMode: params.getParam(
              'conversationMode',
              ParamType.String,
            ),
            isConversation: params.getParam(
              'isConversation',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'ConversationScreen',
          path: '/conversationScreen',
          builder: (context, params) => ConversationScreenWidget(
            personaId: params.getParam(
              'personaId',
              ParamType.int,
            ),
            deckId: params.getParam(
              'deckId',
              ParamType.int,
            ),
            cheatsheetId: params.getParam(
              'cheatsheetId',
              ParamType.int,
            ),
            conversationMode: params.getParam(
              'conversationMode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'InstructionsScreen',
          path: '/instructionsScreen',
          builder: (context, params) => const InstructionsScreenWidget(),
        ),
        FFRoute(
          name: 'ConversationEndScreen',
          path: '/conversationEndScreen',
          builder: (context, params) => ConversationEndScreenWidget(
            conversationTime: params.getParam(
              'conversationTime',
              ParamType.int,
            ),
            totalWords: params.getParam(
              'totalWords',
              ParamType.int,
            ),
            validationsSuccess: params.getParam(
              'validationsSuccess',
              ParamType.int,
            ),
            validationsFail: params.getParam(
              'validationsFail',
              ParamType.int,
            ),
            newCardCreated: params.getParam(
              'newCardCreated',
              ParamType.int,
            ),
            deckId: params.getParam(
              'deckId',
              ParamType.int,
            ),
            personaId: params.getParam(
              'personaId',
              ParamType.int,
            ),
            totalWordLearned: params.getParam(
              'totalWordLearned',
              ParamType.int,
            ),
            wordToBeLearned: params.getParam(
              'wordToBeLearned',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'PersonaScreen',
          path: '/personaScreen',
          builder: (context, params) => PersonaScreenWidget(
            personaId: params.getParam(
              'personaId',
              ParamType.int,
            ),
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            infos: params.getParam(
              'infos',
              ParamType.String,
            ),
            subject: params.getParam(
              'subject',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'RetrievalScreen',
          path: '/retrievalScreen',
          builder: (context, params) => RetrievalScreenWidget(
            deckId: params.getParam(
              'deckId',
              ParamType.int,
            ),
            flashcards: params.getParam<FlashcardsInfosForRetrievalSessionRow>(
              'flashcards',
              ParamType.SqliteRow,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'SettingsScreen',
          path: '/settingsScreen',
          builder: (context, params) => const SettingsScreenWidget(),
        ),
        FFRoute(
          name: 'CheatsheetsScreen',
          path: '/cheatsheetsScreen',
          builder: (context, params) => CheatsheetsScreenWidget(
            isConversation: params.getParam(
              'isConversation',
              ParamType.bool,
            ),
            deckId: params.getParam(
              'deckId',
              ParamType.int,
            ),
            personaId: params.getParam(
              'personaId',
              ParamType.int,
            ),
            conversationMode: params.getParam(
              'conversationMode',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'CheatsheetRowsScreen',
          path: '/cheatsheetRowsScreen',
          builder: (context, params) => CheatsheetRowsScreenWidget(
            cheatsheetName: params.getParam(
              'cheatsheetName',
              ParamType.String,
            ),
            cheatsheetId: params.getParam(
              'cheatsheetId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'StatsScreen',
          path: '/statsScreen',
          builder: (context, params) => const StatsScreenWidget(),
        ),
        FFRoute(
          name: 'ConversationSettingsScreen',
          path: '/conversationSettingsScreen',
          builder: (context, params) => const ConversationSettingsScreenWidget(),
        ),
        FFRoute(
          name: 'RetrievalEndScreen',
          path: '/retrievalEndScreen',
          builder: (context, params) => RetrievalEndScreenWidget(
            retrivalSessionTime: params.getParam(
              'retrivalSessionTime',
              ParamType.int,
            ),
            validationsSuccess: params.getParam(
              'validationsSuccess',
              ParamType.int,
            ),
            validationsFail: params.getParam(
              'validationsFail',
              ParamType.int,
            ),
            deckId: params.getParam(
              'deckId',
              ParamType.int,
            ),
            sessionWordsCount: params.getParam(
              'sessionWordsCount',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'ConversationParametersScreen',
          path: '/conversationParametersScreen',
          builder: (context, params) => const ConversationParametersScreenWidget(),
        ),
        FFRoute(
          name: 'AuthScreen',
          path: '/authScreen',
          builder: (context, params) => const AuthScreenWidget(),
        ),
        FFRoute(
          name: 'Infos',
          path: '/infos',
          builder: (context, params) => const InfosWidget(),
        ),
        FFRoute(
          name: 'ExtractDataScreen',
          path: '/extractDataScreen',
          builder: (context, params) => const ExtractDataScreenWidget(),
        ),
        FFRoute(
          name: 'AIChatScreen',
          path: '/aIChatScreen',
          builder: (context, params) => AIChatScreenWidget(
            textContext: params.getParam(
              'textContext',
              ParamType.String,
            ),
            language: params.getParam(
              'language',
              ParamType.String,
            ),
            flashcardsToReview: params.getParam(
              'flashcardsToReview',
              ParamType.DataStruct,
              isList: false,
              structBuilder: ConversationsFlashcardStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'CheatsheetRowsUpdateScreen',
          path: '/cheatsheetRowsUpdateScreen',
          builder: (context, params) => CheatsheetRowsUpdateScreenWidget(
            concept: params.getParam(
              'concept',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            tagIds: params.getParam(
              'tagIds',
              ParamType.String,
            ),
            cheatsheetId: params.getParam(
              'cheatsheetId',
              ParamType.int,
            ),
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/authScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
