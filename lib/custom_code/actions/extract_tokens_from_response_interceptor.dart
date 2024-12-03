// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/backend/api_requests/api_interceptor.dart';

class ExtractTokensFromResponseInterceptor extends FFApiInterceptor {
  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Perform any necessary calls or modifications to the [options] before
    // the API call is made.
    return options;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    // Perform any necessary calls or modifications to the [response] prior
    // to returning it.

    // Convert the response body text to a Map<String, dynamic>
    Map<String, dynamic> responseData = formatResponseToString(response);

    // Extract token details from the response
    Map<String, int> tokenDetails = extractTokensFromResponse(responseData);

    // You can log or store the token details as needed
    print('Token Details: $tokenDetails');

    // Return the original response
    return response;
  }

  Map<String, dynamic> formatResponseToString(ApiCallResponse response) {
    Map<String, dynamic> responseData;

    try {
      responseData = jsonDecode(response.bodyText) as Map<String, dynamic>;
    } catch (e) {
      // Handle JSON parsing error
      print('Error parsing response: $e');
      return {}; // Return an empty map or handle the error as needed
    }

    return responseData;
  }

  Map<String, int> extractTokensFromResponse(Map<String, dynamic> response) {
    // Initialize a map to hold the token details
    Map<String, int> tokenDetails = {
      'prompt_tokens': 0,
      'completion_tokens': 0,
      'total_tokens': 0,
    };

    // Check if the response contains the 'usage' key
    if (response.containsKey('usage')) {
      final usage = response['usage'];

      // Extract the token counts if they exist
      tokenDetails['prompt_tokens'] = usage['prompt_tokens'] ?? 0;
      tokenDetails['completion_tokens'] = usage['completion_tokens'] ?? 0;
      tokenDetails['total_tokens'] = usage['total_tokens'] ?? 0;
    }

    return tokenDetails;
  }
}
