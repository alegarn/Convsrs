import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OpenAIRetrievalChatContextCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
    String? model = 'gpt-4o-mini',
    String? context = '',
    String? apiKey = '',
    String? language = 'english',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "${escapeStringForJson(model)}",
  "messages": [
    {
      "role": "system",
      "content": "language used in the next answers: ${escapeStringForJson(language)} / ${escapeStringForJson(context)}"
    },
    {
      "role": "user",
      "content": "${escapeStringForJson(prompt)}"
    }
  ]
}''';
    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'OpenAI Retrieval Chat Context',
        apiUrl: 'https://api.openai.com/v1/chat/completions',
        callType: ApiCallType.POST,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        params: const {},
        body: ffApiRequestBody,
        bodyType: BodyType.JSON,
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    ExtractTokensFromResponseInterceptor(),
  ];
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
