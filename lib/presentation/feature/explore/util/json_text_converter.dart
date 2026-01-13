

import 'dart:convert';

import 'package:flutter/foundation.dart';

class JsonTextConverter {
  static final JsonTextConverter _instance = JsonTextConverter._internal();

  factory JsonTextConverter() {
    return _instance;
  }

  JsonTextConverter._internal();


  static String extractDescriptionText(String? descriptionInput) {
    if (descriptionInput == null || descriptionInput.isEmpty) {
      return '';
    }

    try {
      // Attempt to decode the input string as JSON
      final dynamic decoded = jsonDecode(descriptionInput);

      // Check if the decoded object is a Map AND contains the 'ops' key,
      // and 'ops' is a List (indicating a Quill Delta format)
      if (decoded is Map<String, dynamic> &&
          decoded.containsKey('ops') &&
          decoded['ops'] is List) {
        final List<dynamic> ops = decoded['ops'];

        // Extract all 'insert' values from the Quill Delta operations
        final String quillText = ops
            .where((op) => op is Map<String, dynamic> && op.containsKey('insert'))
            .map((op) => op['insert'].toString())
            .join();

        // Return the extracted text (newline characters '\n' are already handled by jsonDecode)
        return quillText;
      }
      // If it's valid JSON but not a Quill Delta (e.g., {"foo": "bar"}, or "[1,2,3]"),
      // then we fall through to return the original descriptionInput.

    } on FormatException catch (e) {
      // If jsonDecode throws a FormatException, it means the string was not valid JSON.
      // In this case, treat the original input string as a plain string.
      debugPrint('Description is not valid JSON: $e. Treating as plain string.');
      return descriptionInput;
    } catch (e) {
      // Catch any other unexpected errors during parsing
      debugPrint('Unexpected error parsing description: $e. Returning original string.');
      return descriptionInput;
    }

    // If the input was valid JSON but did not match the Quill Delta 'ops' structure,
    // return the original input string. This handles cases like:
    // - '{"some_key": "some_value"}'
    // - '[1, 2, 3]'
    // - 'null' (if passed as the string "null")
    return descriptionInput;
  }




}



